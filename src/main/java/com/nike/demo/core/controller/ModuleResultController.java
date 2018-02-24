package com.nike.demo.core.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
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
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.io.FileUtils;
import org.apache.commons.math3.ml.clustering.CentroidCluster;
import org.apache.commons.math3.ml.clustering.KMeansPlusPlusClusterer;
import org.apache.commons.math3.ml.distance.EuclideanDistance;
import org.apache.log4j.Logger;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nike.demo.core.entity.DSIData;
import com.nike.demo.core.entity.DSIProperties;
import com.nike.demo.core.entity.ExtractData;
import com.nike.demo.core.entity.enums.SeasonYear;
import com.nike.demo.core.service.DSIPropertiesService;
import com.nike.demo.core.service.PreparedDataService;
import com.nike.demo.core.service.UserService;
import com.nike.demo.core.service.processor.CSVWriterProcessor;
import com.nike.demo.core.service.processor.PreparedDataProcessor;
import com.nike.demo.core.util.ResponseUtil;
import com.opencsv.bean.ColumnPositionMappingStrategy;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import shapeless.newtype;

@Controller
@RequestMapping("/module")
//@Scope("prototype")
public class ModuleResultController {

	@Resource
	private UserService userService;

	@Resource
	private DSIPropertiesService dsiPropertiesService;
	
	@Resource
	private PreparedDataService preparedDataService;

	private static final Logger log = Logger.getLogger(ModuleResultController.class);
	
	private static final String DEFAULT_STR_SEPARATOR = "_";
	
	private static final int DEFAULT_THREAD_POOL_SIZE = 2;
	
	private static final int DEFAULT_WAIT_EXECUTOR_MINS = 5;
	
	private static final int DEFAULT_BACKWARD_SEASONS = 0; // except current selected season
	
	private static final String STR_CLUSTER_A = "Cluster A";
	private static final String STR_CLUSTER_B = "Cluster B";
	private static final String STR_CLUSTER_C = "Cluster C";
	private static final String STR_CLUSTER_D = "Cluster D";
	
	private static final String STR_CSV_ATTR = "csv";
	private static final String STR_CSV_PATH = "/csv/";
	private static final String STR_CSV_EXTENTION = ".csv";
	private static final String STR_CSV_PREFIX = "Export_";
	
	@SuppressWarnings("serial")
	@RequestMapping("/generate")
	public String generate(String dsiProperties, String seasonYear, String prodType, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// check params
		if (null == seasonYear || null == prodType || null == dsiProperties || dsiProperties.isEmpty()) {
			return null;
		}
		log.debug("seasonYear: " + seasonYear); // the season year might be split in the feature
		log.debug("prodType: " + prodType);
		log.debug("dsiProperties: " + dsiProperties);
		
		// start process
		long start = System.currentTimeMillis();
		
		// get DSI Properties data from DB
		String[] propsArray = dsiProperties.split(",");
		List<DSIProperties> dsiPropertiesFromDB = dsiPropertiesService.findByGroupNames(Arrays.asList(propsArray));
		
		// group by group_name
		Map<String, List<DSIProperties>> dsiPropertiesMap = dsiPropertiesFromDB.stream().collect(Collectors.groupingBy(DSIProperties::getGroupName));
		
		// final group size , default <= 800 , need to be handled on front-end
		Set<String> keySet = dsiPropertiesMap.keySet();
		Integer mapSize = keySet.stream().mapToInt(key -> dsiPropertiesMap.get(key).size()).reduce((left, right) -> left * right).getAsInt();
		log.debug("properties size: " + mapSize);
		if (333 > mapSize) {
			// TODO return to front-end 
			// 333 need to be configured on DB or properties
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
		ExecutorService threadPool =  Executors.newFixedThreadPool(DEFAULT_THREAD_POOL_SIZE);
		SeasonYear selectSeasonYear = SeasonYear.valueOf(seasonYear);
		for (int i = 0; i <= DEFAULT_BACKWARD_SEASONS; i++) {
			String[] propsArrayCopy = new String[propsArray.length];
			System.arraycopy(propsArray, 0, propsArrayCopy, 0, propsArray.length);
			threadPool.submit(new PreparedDataProcessor(SeasonYear.getByIndex(selectSeasonYear.getIndex() - i).name(), propsArrayCopy, processedList));
		}
		threadPool.shutdown();
		threadPool.awaitTermination(DEFAULT_WAIT_EXECUTOR_MINS, TimeUnit.MINUTES);
		
		// second round for clustering
		List<ExtractData> filteredList = processedList.stream().collect(ArrayList::new,
				(list, item) -> list.addAll(item.getPoints()), List::addAll);
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
		
		// process the clustered data
		Double[] sdArray = new Double[finalExtractDataList.size()];
		for (int i = 0; i < finalExtractDataList.size(); i++) {
			CentroidCluster<ExtractData> centroidCluster = finalExtractDataList.get(i);
			sdArray[i] = centroidCluster.getCenter().getPoint()[1]; // center point SD
			log.info("SD: " + i + ": "+ sdArray[i]);
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
			});
		}
		
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
			} else if (proMap1.get(key) + proMap2.get(key) + proMap3.get(key)> 0.8) {
				item.setCluster(STR_CLUSTER_C);
				item.setSd(sdArray[2]);
			} else {
				item.setCluster(STR_CLUSTER_D);
				item.setSd(sdArray[3]);
			}
			item.setSampSize(totalDataMap.get(key).size());
			item.setSalesNum(totalDataMap.get(key).stream().mapToInt(t -> t.getNetSalesUnits()).sum());
			
			//sample size < 300 case, force set Cluster C
			if (item.getSampSize() <= 300) {
				item.setCluster(STR_CLUSTER_C);
				item.setSd(sdArray[2]);
			}
		});
		
		System.out.println((System.currentTimeMillis() - start) / 1000 + "s");
		
		ExecutorService threadPool2 =  Executors.newCachedThreadPool();
		String path = request.getServletContext().getRealPath(STR_CSV_PATH);
		String fileName = STR_CSV_PREFIX + System.currentTimeMillis() + STR_CSV_EXTENTION;
		String fullPath = path + File.separator + fileName;
		CSVWriterProcessor<DSIData> csvWriterProcessor = new CSVWriterProcessor<DSIData>(outputList, fullPath);
		ColumnPositionMappingStrategy<DSIData> mapper = new ColumnPositionMappingStrategy<DSIData>();
		String[] columnMapping = new String[propsArray.length + 4];
		for (int i = 0; i < propsArray.length; i++) {
			columnMapping[i] = "property" + (i +1);
		}
		columnMapping[propsArray.length] = "cluster";
		columnMapping[propsArray.length + 1] = "sd";
		columnMapping[propsArray.length + 2] = "salesNum";
		columnMapping[propsArray.length + 3] = "sampSize";
		mapper.setType(DSIData.class);
		mapper.setColumnMapping(columnMapping);
		csvWriterProcessor.setMapper(mapper);
		threadPool2.submit(csvWriterProcessor);
		request.getSession().setAttribute(STR_CSV_ATTR, fileName);
		threadPool2.shutdown();
		
		// 0. Test use
		/*outputList.forEach(item -> {
			Integer randomInt = new Random().nextInt(500);
			item.setCluster(randomInt % 2 == 0 ? "Cluster A" : "Cluster B");
			item.setSd((double)System.nanoTime() % 100 / 33L);
			item.setSampSize(randomInt);
		});*/

		// start construct output json
		// 1. properties incidence
			// TODO call or migrate from python ???
		
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
						//clusterDisMap.put(clusterValue, clusterDisMap.get(clusterValue) + data.getSampSize());
						clusterDisMap.put(clusterValue, clusterDisMap.get(clusterValue) + data.getSalesNum());
					} else {
						//clusterDisMap.put(clusterValue, data.getSampSize());
						clusterDisMap.put(clusterValue, data.getSalesNum());
					}
				}
				clusterDisList.add(clusterDisMap);
				propSubMap.put(key, clusterDisList);
			}
		}
		
		// 4. convert output to json object for UI
		JSONObject result = new JSONObject();
        JSONArray tableOutputListJson = JSONArray.fromObject(outputList);
        JSONArray sampleDisOutputListJson = JSONArray.fromObject(sampleDisOutputList);
        JSONArray propertyDisOutputMapJson = JSONArray.fromObject(propertyDisOutputMap);
        JSONArray columnsSubJsonArray = JSONArray.fromObject(columnSet);
        JSONArray columnsJsonArray = new JSONArray();
        columnsJsonArray.add(columnsSubJsonArray);
        result.put("rows", tableOutputListJson);
        result.put("sampleDisOutputListJson", sampleDisOutputListJson);
        result.put("propertiesDisMapJson", propertyDisOutputMapJson);
        result.put("columns", columnsJsonArray);
        result.put("total", mapSize);
        ResponseUtil.write(response, result);
		return null;
	}

	@RequestMapping("getSeasonYear")
	public String getSeasonYear(HttpServletResponse response) throws Exception {
		ResponseUtil.write(response, SeasonYear.convertToJSONArray());
		return null;
	}
	
	@RequestMapping(value="/export" , method = RequestMethod.GET)
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
