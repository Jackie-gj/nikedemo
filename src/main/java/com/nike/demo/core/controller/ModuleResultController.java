package com.nike.demo.core.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.math3.ml.clustering.CentroidCluster;
import org.apache.commons.math3.ml.clustering.KMeansPlusPlusClusterer;
import org.apache.commons.math3.ml.distance.EuclideanDistance;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nike.demo.core.entity.DSIData;
import com.nike.demo.core.entity.DSIProperties;
import com.nike.demo.core.entity.ExtractData;
import com.nike.demo.core.entity.PropImportance;
import com.nike.demo.core.entity.enums.SeasonYear;
import com.nike.demo.core.service.DSIPropertiesService;
import com.nike.demo.core.service.PreparedDataService;
import com.nike.demo.core.service.PropImportanceService;
import com.nike.demo.core.service.UserService;
import com.nike.demo.core.service.processor.CSVWriterProcessor;
import com.nike.demo.core.service.processor.PreparedDataProcessor;
import com.nike.demo.core.service.processor.RandomForestProcessor;
import com.nike.demo.core.util.ResponseUtil;
import com.nike.demo.core.util.StringUtil;
import com.opencsv.bean.ColumnPositionMappingStrategy;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/module")
public class ModuleResultController {

    @Resource
    private UserService userService;

    @Resource
    private DSIPropertiesService dsiPropertiesService;

    @Resource
    private PreparedDataService preparedDataService;

    @Resource
    private PropImportanceService propImportanceService;

    private static final Logger log = Logger.getLogger(ModuleResultController.class);

    private static final String DEFAULT_STR_SEPARATOR = "_";

    private static final int DEFAULT_THREAD_POOL_SIZE = 2;

    private static final int DEFAULT_SAMPLE_SIZE_CLUSTER_C = 300;

    private static final int DEFAULT_COMBINATION_COUNTS = 333;

    private static final int DEFAULT_WAIT_EXECUTOR_MINS = 10;

    private static final int DEFAULT_BACKWARD_SEASONS = 3; // except current selected season

    private static final String STR_CLUSTER_A = "Cluster A";
    private static final String STR_CLUSTER_B = "Cluster B";
    private static final String STR_CLUSTER_C = "Cluster C";
    private static final String STR_CLUSTER_D = "Cluster D";

    private static final String STR_CSV_ATTR = "csv";
    private static final String STR_CSV_PATH = "/csv/";
    private static final String STR_CSV_EXTENTION = ".csv";
    private static final String STR_CSV_EXT_PREFIX = "Extract_";
    private static final String STR_CSV_EXP_PREFIX = "Export_";
    private static final String STR_ACC_GOODBABY = "goodbaby";

    @RequestMapping("/goModuleResultPage")
    public String goModuleResultPage(Model model) {
        List<PropImportance> allPropImportances = propImportanceService.listAll();
        Map<String, List<PropImportance>> groupPropImportance = allPropImportances.stream().collect(Collectors.groupingBy(PropImportance::getType));
        JSONObject allPropImportancesJson = JSONObject.fromObject(groupPropImportance);
        model.addAttribute("propImportances", allPropImportancesJson);
        return "index";
    }

    @SuppressWarnings("serial")
    @RequestMapping("/generate")
    public String generate(String dsiProperties, String seasonYear, String prodType, String account, HttpServletRequest request, HttpServletResponse response) throws Exception {
        // check params
        if (null == seasonYear || null == prodType || null == dsiProperties || dsiProperties.isEmpty()) {
            JSONObject result = new JSONObject();
            result.put("message", "Please double check the conditions!");
            ResponseUtil.write(response, result);
            return null;
        }
        log.debug("seasonYear: " + seasonYear); // the season year might be split in the feature
        log.debug("prodType: " + prodType);
        log.debug("dsiProperties: " + dsiProperties);

        // start process
        long start = System.currentTimeMillis();

        // check if the account is GB or not
        final boolean isGB;
        if (StringUtil.isEmpty(account)) {
            isGB = false;
        } else {
            isGB = STR_ACC_GOODBABY.equalsIgnoreCase(account);
        }

        // get the previous season of the selected one for the prediction
        seasonYear = SeasonYear.getByIndex(SeasonYear.valueOf(seasonYear).getIndex() - 1).name();

        int countByQuart = preparedDataService.getTotalCountByQuart(seasonYear, prodType);
        // if no data found for the selected season, return
        if (0 >= countByQuart) {
            JSONObject result = new JSONObject();
            result.put("message", "No data found!");
            ResponseUtil.write(response, result);
            return null;
        }

        // prepare the csv output folder
        String csvFolder = request.getServletContext().getRealPath(STR_CSV_PATH);
        File csvFolderFile = new File(csvFolder);
        if (!csvFolderFile.exists()) {
            csvFolderFile.mkdirs();
        }

        // get DSI Properties data from DB
        String[] propsArray = dsiProperties.split(",");
        List<DSIProperties> dsiPropertiesFromDB = dsiPropertiesService.findByGroupNames(Arrays.asList(propsArray), prodType);

        // group by group_name
        Map<String, List<DSIProperties>> dsiPropertiesMap = dsiPropertiesFromDB.stream().collect(Collectors.groupingBy(DSIProperties::getGroupName));

        // final group size , default <= 800 , need to be handled on front-end
        Set<String> keySet = dsiPropertiesMap.keySet();
        Integer mapSize = keySet.stream().mapToInt(key -> dsiPropertiesMap.get(key).size()).reduce((left, right) -> left * right).getAsInt();
        log.debug("properties size: " + mapSize);
        // 333 need to be configured on DB or properties
        if (DEFAULT_COMBINATION_COUNTS / 4 > countByQuart / mapSize) {
            JSONObject result = new JSONObject();
            result.put("message", "The property combinations are too small, the minimum count: " + DEFAULT_COMBINATION_COUNTS);
            ResponseUtil.write(response, result);
            return null;
        }

        // final output list
        List<DSIData> outputList = new ArrayList<DSIData>(mapSize);
        // UI column properties
        Set<Map<String, Object>> columnSet = new LinkedHashSet<Map<String, Object>>();
        Arrays.asList(propsArray).stream().forEachOrdered(m -> columnSet.add(new HashMap<String, Object>() {
            {
                put("title", dsiPropertiesMap.get(m).get(0).getColumnName());
                put("width", dsiPropertiesMap.get(m).get(0).getColumnWidth());
                put("field", "property" + (columnSet.size() + 1));
            }
        }));

        // construct the final output cross mappings
        Stream<DSIData> dsiDataStream = dsiPropertiesMap.get(propsArray[0]).stream().map(m -> {
            DSIData dsiData = new DSIData();
            String[] properties = new String[propsArray.length];
            properties[0] = m.getName();
            dsiData.setProperties(properties);
            return dsiData;
        });
        for (int i = 1; i < propsArray.length; i++) {
            final int pi = i;
            dsiDataStream = dsiDataStream.flatMap(dsiData -> dsiPropertiesMap.get(propsArray[pi]).stream().map(m -> {
                DSIData dsiDataNew = dsiData.clone();
                String[] properties = dsiDataNew.getProperties();
                properties[pi] = m.getName();
                dsiDataNew.setProperties(properties);
                return dsiDataNew;
            }));
        }

        // set the separated property columns, might be removed later.
        if (null != dsiDataStream) {
            dsiDataStream.forEach(d -> {
                for (int i = 0; i < d.getProperties().length; i++) {
                    try {
                        PropertyUtils.setSimpleProperty(d, "property" + (i + 1), d.getProperties()[i]);
                    } catch (Exception e) {
                        log.error(e);
                    }
                }
                outputList.add(d);
            });
        } else {
            return null; // TODO error message
        }
        System.out.println((System.currentTimeMillis() - start) / 1000 + "s");
        // do not use clone method since the reference list will not be duplicated
        HashMap<String, List<ExtractData>> totalDataMap = outputList.stream().collect(HashMap::new,
                (map, d) -> map.put(concatPropertyNames(d.getProperties()), new ArrayList<ExtractData>()), Map::putAll);

        HashMap<String, List<ExtractData>> dataMap1 = outputList.stream().collect(HashMap::new,
                (map, d) -> map.put(concatPropertyNames(d.getProperties()), new ArrayList<ExtractData>()), Map::putAll);

        HashMap<String, List<ExtractData>> dataMap2 = outputList.stream().collect(HashMap::new,
                (map, d) -> map.put(concatPropertyNames(d.getProperties()), new ArrayList<ExtractData>()), Map::putAll);

        HashMap<String, List<ExtractData>> dataMap3 = outputList.stream().collect(HashMap::new,
                (map, d) -> map.put(concatPropertyNames(d.getProperties()), new ArrayList<ExtractData>()), Map::putAll);

        HashMap<String, List<ExtractData>> dataMap4 = outputList.stream().collect(HashMap::new,
                (map, d) -> map.put(concatPropertyNames(d.getProperties()), new ArrayList<ExtractData>()), Map::putAll);

        // start 4(default) threads to fetch data from db and combine into one list
        Vector<CentroidCluster<ExtractData>> processedList = new Vector<CentroidCluster<ExtractData>>();
        ExecutorService threadPool = Executors.newFixedThreadPool(DEFAULT_THREAD_POOL_SIZE);
        SeasonYear selectSeasonYear = SeasonYear.valueOf(seasonYear);
        for (int i = 0; i <= DEFAULT_BACKWARD_SEASONS; i++) {
            String[] propsArrayCopy = new String[propsArray.length];
            System.arraycopy(propsArray, 0, propsArrayCopy, 0, propsArray.length);
            threadPool.submit(new PreparedDataProcessor(SeasonYear.getByIndex(selectSeasonYear.getIndex() - i).name(), prodType, propsArrayCopy, processedList));
        }
        threadPool.shutdown();
        threadPool.awaitTermination(DEFAULT_WAIT_EXECUTOR_MINS, TimeUnit.MINUTES);
        System.out.println((System.currentTimeMillis() - start) / 1000 + "s");
        // get all the 4 quarts data
        List<ExtractData> filteredList = processedList.stream().collect(ArrayList::new,
                (list, item) -> list.addAll(item.getPoints()), List::addAll);

        filteredList = filteredList.stream()
                .filter(item -> isGB ? STR_ACC_GOODBABY.equalsIgnoreCase(item.getAbbrevOwnerGroupName())
                        : !STR_ACC_GOODBABY.equalsIgnoreCase(item.getAbbrevOwnerGroupName()))
                .collect(Collectors.toList());

        // second round for clustering
        KMeansPlusPlusClusterer<ExtractData> kMeansPlusPlusClusterer2 = new KMeansPlusPlusClusterer<ExtractData>(4, 2000,
                new EuclideanDistance());
        List<CentroidCluster<ExtractData>> cluster2 = kMeansPlusPlusClusterer2.cluster(filteredList);
        List<CentroidCluster<ExtractData>> finalExtractDataList = cluster2.stream()
                .sorted((a, b) -> a.getPoints().size() <= b.getPoints().size() ? 1 : -1)
                .collect(Collectors.toList());//desc

        // debug use, checking cluster, need to be deleted
        int k = 0;
        for (CentroidCluster<ExtractData> cl : finalExtractDataList) {
            String clusterName = "cluster" + k;
            System.out.println(Thread.currentThread().getName() + ": " + clusterName + ": " + cl.getPoints().size());
            k++;
        }
        System.out.println((System.currentTimeMillis() - start) / 1000 + "s");
        // process the clustered data
        Double[] sdArray = new Double[finalExtractDataList.size()];
        for (int i = 0; i < finalExtractDataList.size(); i++) {
            CentroidCluster<ExtractData> centroidCluster = finalExtractDataList.get(i);
            sdArray[i] = centroidCluster.getCenter().getPoint()[1]; // center point SD
            log.info("SD: " + i + ": " + sdArray[i]);
            final int si = i;
            centroidCluster.getPoints().stream().forEach(a -> {
                String key = concatPropertyNames(propsArray, a);
                if (totalDataMap.containsKey(key)) {
                    switch (si) {
                        case 0:
                            dataMap1.get(key).add(a);
                            break;
                        case 1:
                            dataMap2.get(key).add(a);
                            break;
                        case 2:
                            dataMap3.get(key).add(a);
                            break;
                        case 3:
                            dataMap4.get(key).add(a);
                            break;
                        default:
                            break;
                    }
                    totalDataMap.get(key).add(a);
                } else {
                    log.info(key + " is not existing in the final output list");
                }
                // add the cluster info to the list for importance incidence, it might include the key patterns which are not in the totalDataMap
                a.setCluster(String.valueOf(si + 1));
            });
        }

        ExecutorService csvThreadPool = Executors.newFixedThreadPool(DEFAULT_THREAD_POOL_SIZE);
        // Extract Data CSV for Spark
        String extractDataFileName = STR_CSV_EXT_PREFIX + System.currentTimeMillis() + STR_CSV_EXTENTION;
        String extractDataFullPath = csvFolder + File.separator + extractDataFileName;
        CSVWriterProcessor<ExtractData> extractDataCSVWriterProcessor = new CSVWriterProcessor<ExtractData>(filteredList, extractDataFullPath);
        ColumnPositionMappingStrategy<ExtractData> extractDataMapper = new ColumnPositionMappingStrategy<ExtractData>();
        String[] extractDataColumnMapping = new String[propsArray.length + 1];
        extractDataColumnMapping[0] = "cluster";
        System.arraycopy(propsArray, 0, extractDataColumnMapping, 1, propsArray.length);
        extractDataMapper.setType(ExtractData.class);
        extractDataMapper.setColumnMapping(extractDataColumnMapping);
        extractDataCSVWriterProcessor.setMapper(extractDataMapper);
        extractDataCSVWriterProcessor.setHeaders(extractDataColumnMapping);
        csvThreadPool.submit(extractDataCSVWriterProcessor);
        System.out.println((System.currentTimeMillis() - start) / 1000 + "s");
        // calculate the probability
        double dSize1 = dataMap1.values().stream().mapToInt(l -> l.size()).sum();
        double dSize2 = dataMap2.values().stream().mapToInt(l -> l.size()).sum();
        double dSize3 = dataMap3.values().stream().mapToInt(l -> l.size()).sum();
        double dSize4 = dataMap4.values().stream().mapToInt(l -> l.size()).sum();
        double tSize = totalDataMap.values().stream().mapToInt(l -> l.size()).sum();

        double p1 = dSize1 / tSize;
        double p2 = dSize2 / tSize;
        double p3 = dSize3 / tSize;
        double p4 = dSize4 / tSize;

        HashMap<String, Double> proMap1 = dataMap1.keySet().stream().collect(HashMap::new, (m, d) -> {
            m.put(d, p1 * (dataMap1.get(d).size() / dSize1) / (totalDataMap.get(d).size() / tSize));
        }, Map::putAll);

        HashMap<String, Double> proMap2 = dataMap2.keySet().stream().collect(HashMap::new, (m, d) -> {
            m.put(d, p2 * (dataMap2.get(d).size() / dSize2) / (totalDataMap.get(d).size() / tSize));
        }, Map::putAll);

        HashMap<String, Double> proMap3 = dataMap3.keySet().stream().collect(HashMap::new, (m, d) -> {
            m.put(d, p3 * (dataMap3.get(d).size() / dSize3) / (totalDataMap.get(d).size() / tSize));
        }, Map::putAll);

        @SuppressWarnings("unused")
        HashMap<String, Double> proMap4 = dataMap4.keySet().stream().collect(HashMap::new, (m, d) -> {
            m.put(d, p4 * (dataMap4.get(d).size() / dSize4) / (totalDataMap.get(d).size() / tSize));
        }, Map::putAll);

        // distribute the clusters
        outputList.forEach(item -> {
            String key = concatPropertyNames(item.getProperties());
            if (proMap1.get(key) > 0.8) {
                item.setCluster(STR_CLUSTER_A);
                item.setSd(sdArray[0]);
            } else if (proMap1.get(key) + proMap2.get(key) > 0.8) {
                item.setCluster(STR_CLUSTER_B);
                item.setSd(sdArray[1]);
            } else if (proMap1.get(key) + proMap2.get(key) + proMap3.get(key) > 0.8) {
                item.setCluster(STR_CLUSTER_C);
                item.setSd(sdArray[2]);
            } else {
                item.setCluster(STR_CLUSTER_D);
                item.setSd(sdArray[3]);
            }
            item.setSampSize(totalDataMap.get(key).size());
            item.setSalesNum(totalDataMap.get(key).stream().mapToInt(t -> t.getNetSalesUnits()).sum());

            //sample size < 300 case, force set Cluster C
            if (item.getSampSize() <= DEFAULT_SAMPLE_SIZE_CLUSTER_C) {
                item.setCluster(STR_CLUSTER_C);
                item.setSd(sdArray[2]);
            }
        });

        long default2c = outputList.stream().filter(o -> o.getSampSize() <= DEFAULT_SAMPLE_SIZE_CLUSTER_C).count();
        int default2s = outputList.stream().filter(o -> o.getSampSize() <= DEFAULT_SAMPLE_SIZE_CLUSTER_C).mapToInt(o -> o.getSampSize()).sum();

        // Export CSV for download
        String exportFileName = STR_CSV_EXP_PREFIX + System.currentTimeMillis() + STR_CSV_EXTENTION;
        request.getSession().setAttribute(STR_CSV_ATTR, exportFileName);
        CSVWriterProcessor<DSIData> exportCSVWriterProcessor = new CSVWriterProcessor<DSIData>(outputList, csvFolder + File.separator + exportFileName);
        ColumnPositionMappingStrategy<DSIData> mapper = new ColumnPositionMappingStrategy<DSIData>();
        String[] exportCSVColumnMapping = new String[propsArray.length + 4];
        String[] exportCSVHeaders = new String[propsArray.length + 4];
        for (int i = 0; i < propsArray.length; i++) {
            exportCSVColumnMapping[i] = "property" + (i + 1);
        }
        exportCSVColumnMapping[propsArray.length] = "cluster";
        exportCSVColumnMapping[propsArray.length + 1] = "sd";
        exportCSVColumnMapping[propsArray.length + 2] = "salesNum";
        exportCSVColumnMapping[propsArray.length + 3] = "sampSize";
        System.arraycopy(exportCSVColumnMapping, 0, exportCSVHeaders, 0, exportCSVColumnMapping.length);
        System.arraycopy(propsArray, 0, exportCSVHeaders, 0, propsArray.length);
        mapper.setType(DSIData.class);
        mapper.setColumnMapping(exportCSVColumnMapping);
        exportCSVWriterProcessor.setMapper(mapper);
        exportCSVWriterProcessor.setHeaders(exportCSVHeaders);
        csvThreadPool.submit(exportCSVWriterProcessor);
        csvThreadPool.shutdown();
        csvThreadPool.awaitTermination(DEFAULT_WAIT_EXECUTOR_MINS, TimeUnit.MINUTES);
        System.out.println((System.currentTimeMillis() - start) / 1000 + "s, starting random forest calc");

        // start construct output json
        // 1. properties incidence
        Map<String, Double> propIncidenceMap = new HashMap<String, Double>();
        /*
        ExecutorService rfThreadPool = Executors.newCachedThreadPool();
        RandomForestProcessor randomForestProcessor = new RandomForestProcessor(propsArray, extractDataFullPath);
        Future<double[]> importanceFeature = rfThreadPool.submit(randomForestProcessor);
        double[] importances = importanceFeature.get();
        for (int i = 0; i < propsArray.length; i++) {
            propIncidenceMap.put(propsArray[i], importances[i]);
        }
        rfThreadPool.shutdown();
        System.out.println((System.currentTimeMillis() - start) / 1000 + "s, random forest calc finished");*/
        // 2.sample distribution
        List<Map<String, Integer>> sampleDisOutputList = outputList.stream()
                .collect(Collectors.groupingBy(DSIData::getCluster)).entrySet().stream().map(item -> {
                    // <cluster, size>
                    Map<String, Integer> sampleDisMap = new HashMap<>();
                    sampleDisMap.put(item.getKey(), item.getValue().stream().mapToInt(p -> p.getSampSize()).sum());
                    return sampleDisMap;
                }).collect(Collectors.toList());

        // 3. properties distribution
        // to make it easy to read and understand, does not use stream to collect data here.
        // output format -> <Property Name , <Property Value, List <Cluster, Size/Sum>>>
        Map<String, Map<String, List<Map<String, Integer>>>> propertyDisOutputMap = new LinkedHashMap<String, Map<String, List<Map<String, Integer>>>>();
        for (int i = 0; i < propsArray.length; i++) {
            Map<String, List<Map<String, Integer>>> propSubMap = new LinkedHashMap<String, List<Map<String, Integer>>>();
            propertyDisOutputMap.put(propsArray[i], propSubMap);

            // group by property values
            Map<String, List<DSIData>> propValueDisMap = new HashMap<String, List<DSIData>>();
            for (DSIData data : outputList) {
                String propValue = data.getProperties()[i];
                if (propValueDisMap.containsKey(propValue)) {
                    propValueDisMap.get(propValue).add(data);
                } else {
                    List<DSIData> tmpList = new ArrayList<DSIData>();
                    tmpList.add(data);
                    propValueDisMap.put(propValue, tmpList);
                }
            }

            for (String key : propValueDisMap.keySet()) {
                // group by clusters
                List<Map<String, Integer>> clusterDisList = new ArrayList<Map<String, Integer>>();
                Map<String, Integer> clusterDisMap = new HashMap<String, Integer>();
                List<DSIData> dsiDatas = propValueDisMap.get(key);
                for (DSIData data : dsiDatas) {
                    String clusterValue = data.getCluster();
                    if (clusterDisMap.containsKey(clusterValue)) {
                        clusterDisMap.put(clusterValue, clusterDisMap.get(clusterValue) + data.getSampSize());
                        //clusterDisMap.put(clusterValue, clusterDisMap.get(clusterValue) + data.getSalesNum());
                    } else {
                        clusterDisMap.put(clusterValue, data.getSampSize());
                        //clusterDisMap.put(clusterValue, data.getSalesNum());
                    }
                }
                clusterDisList.add(clusterDisMap);
                propSubMap.put(key, clusterDisList);
            }
        }

        // 4. convert output to json object for UI
        JSONObject result = new JSONObject();
        JSONArray tableOutputListJson = JSONArray.fromObject(outputList);
        JSONArray propIncidenceMapJson = JSONArray.fromObject(propIncidenceMap);
        JSONArray sampleDisOutputListJson = JSONArray.fromObject(sampleDisOutputList);
        JSONArray propertyDisOutputMapJson = JSONArray.fromObject(propertyDisOutputMap);
        JSONArray columnsSubJsonArray = JSONArray.fromObject(columnSet);
        JSONArray columnsJsonArray = new JSONArray();
        columnsJsonArray.add(columnsSubJsonArray);
        result.put("rows", tableOutputListJson);
        result.put("propIncidenceMapJson", propIncidenceMapJson);
        result.put("sampleDisOutputListJson", sampleDisOutputListJson);
        result.put("propertiesDisMapJson", propertyDisOutputMapJson);
        result.put("columns", columnsJsonArray);
        result.put("total", mapSize);
        result.put("default2c", default2c);
        result.put("default2s", default2s);
        ResponseUtil.write(response, result);

        // debug use
        System.out.println("total used: " + (System.currentTimeMillis() - start) / 1000 + "s");

        return null;
    }

    @RequestMapping("getSeasonYear")
    public String getSeasonYear(HttpServletResponse response) throws Exception {
        ResponseUtil.write(response, SeasonYear.convertToJSONArray());
        return null;
    }

    @RequestMapping("getPropImportance")
    public String getPropImportance(HttpServletResponse response) throws Exception {
        // get all 15 properties importances
        List<PropImportance> allPropImportances = propImportanceService.listAll();
        Map<String, List<PropImportance>> groupPropImportance = allPropImportances.stream().collect(Collectors.groupingBy(PropImportance::getType));
        JSONArray allPropImportancesJson = JSONArray.fromObject(groupPropImportance);
        ResponseUtil.write(response, allPropImportancesJson);
        return null;
    }

    @RequestMapping(value = "/export", method = RequestMethod.GET)
    public void download(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String utf = "UTF-8";
        String fileName = String.valueOf(request.getSession().getAttribute(STR_CSV_ATTR));
        String path = request.getServletContext().getRealPath(STR_CSV_PATH);
        File file = new File(path + File.separator + fileName);
        String downloadFileName = new String(fileName.getBytes(utf), "iso-8859-1");

        response.setContentType("text/csv");
        response.setCharacterEncoding(utf);
        response.setHeader("Pragma", "public");
        response.setHeader("Cache-Control", "max-age=30");
        response.setHeader("Content-Disposition", "attachment; filename=" + downloadFileName);

        byte[] buffer = new byte[4096];
        BufferedOutputStream output = null;
        BufferedInputStream input = null;
        try {
            output = new BufferedOutputStream(response.getOutputStream());
            input = new BufferedInputStream(new FileInputStream(file));
            int n = -1;
            while ((n = input.read(buffer, 0, 4096)) != -1) {
                output.write(buffer, 0, n);
            }
            output.flush();
            response.flushBuffer();
        } catch (Exception e) {
            System.out.println("error" + e);
        } finally {
            if (input != null) {
                input.close();
            }
            if (output != null) {
                output.close();
            }
        }
    }

    private String concatPropertyNames(String[] properties) {
        if (null == properties || 0 == properties.length) {
            return "";
        } else {
            StringBuilder sb = new StringBuilder();
            Arrays.asList(properties).stream().forEachOrdered(s -> sb.append(DEFAULT_STR_SEPARATOR).append(s));
            return sb.length() > 0 ? sb.substring(1, sb.length()).toString() : "";
        }
    }

    private String concatPropertyNames(String[] properties, ExtractData data) {
        if (null == properties || 0 == properties.length || null == data) {
            return "";
        } else {
            StringBuilder sb = new StringBuilder();
            Arrays.asList(properties).stream().forEachOrdered(s -> {
                try {
                    sb.append(DEFAULT_STR_SEPARATOR).append(PropertyUtils.getSimpleProperty(data, s));
                } catch (Exception e) {
                    log.error(e);
                }
            });
            return sb.length() > 0 ? sb.substring(1, sb.length()).toString() : "";
        }
    }
}
