package com.nike.demo.core.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
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

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.math3.ml.clustering.CentroidCluster;
import org.apache.commons.math3.ml.clustering.KMeansPlusPlusClusterer;
import org.apache.commons.math3.ml.distance.EuclideanDistance;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.nike.demo.core.dao.DSIPropertiesDao;
import com.nike.demo.core.dao.PreparedDataDao;
import com.nike.demo.core.entity.DSIData;
import com.nike.demo.core.entity.DSIProperties;
import com.nike.demo.core.entity.ExtractData;
import com.nike.demo.core.entity.PreparedData;
import com.nike.demo.core.entity.enums.SeasonYear;
import com.nike.demo.core.service.PreparedDataService;
import com.nike.demo.core.service.processor.PreparedDataProcessor;

@Service("preparedDataService")
public class PreparedDataServiceImpl implements PreparedDataService {

	private static final Logger log = Logger.getLogger(PreparedDataServiceImpl.class);
	
	private static final String DEFAULT_STR_SEPARATOR = "_";
	
	private static final int DEFAULT_THREAD_POOL_SIZE = 4;
	
	private static final int DEFAULT_WAIT_EXECUTOR_MINS = 5;
	
	private static final int DEFAULT_BACKWARD_SEASONS = 3;
	
	private Vector<CentroidCluster<ExtractData>> processedList = new Vector<>();

	@Resource
	private DSIPropertiesDao dsiPropertiesDao;

	@Resource
	private PreparedDataDao preparedDataDao;

	@Override
	public int insert(PreparedData record) {
		return preparedDataDao.insert(record);
	}

	@Override
	public int insertSelective(PreparedData record) {
		return preparedDataDao.insertSelective(record);
	}

	@Override
	public List<PreparedData> findByQuart(String quart) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("quart", quart);
		return preparedDataDao.findByQuart(paramMap);
	}

	@Override
	public List<PreparedData> findByQuart(Map<String, String> paramMap) {
		return preparedDataDao.findByQuart(paramMap);
	}

	@Override
	public List<PreparedData> findByQuarts(List<String> quarts) {
		return preparedDataDao.findByQuarts(quarts);
	}

	@Override
	public List<DSIData> predictData(String dsiProperties, String seasonYear, String prodType) throws Exception {
		// get DSI Properties data from DB
		String[] propsArray = dsiProperties.split(",");
		Map<String, Object> paramsMap = new HashMap<String, Object>();
		paramsMap.put("groupNames", Arrays.asList(propsArray));
		paramsMap.put("prodType", prodType);
		List<DSIProperties> dsiPropertiesFromDB = dsiPropertiesDao.findByGroupNames(paramsMap);

		// group by group_name
		Map<String, List<DSIProperties>> dsiPropertiesMap = dsiPropertiesFromDB.stream()
				.collect(Collectors.groupingBy(DSIProperties::getGroupName));

		// final group size , default <= 800 , need to be handled on front-end
		Set<String> keySet = dsiPropertiesMap.keySet();
		Integer mapSize = keySet.stream().mapToInt(key -> dsiPropertiesMap.get(key).size())
				.reduce((left, right) -> left * right).getAsInt();
		log.debug("properties size: " + mapSize);

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
		outputList.stream().forEach(item -> log.debug(item));

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

		// start 4(default) thread to fetch data from db and combine into one list
		ExecutorService threadPool = Executors.newFixedThreadPool(DEFAULT_THREAD_POOL_SIZE);
		SeasonYear selectSeasonYear = SeasonYear.valueOf(seasonYear);
		for (int i = 0; i <= DEFAULT_BACKWARD_SEASONS; i++) {
			threadPool.submit(new PreparedDataProcessor(SeasonYear.getByIndex(selectSeasonYear.getIndex() - i).name(), prodType, propsArray,
					processedList));
		}
		threadPool.shutdown();
		threadPool.awaitTermination(DEFAULT_WAIT_EXECUTOR_MINS, TimeUnit.MINUTES);

		// second round for clustering
		List<ExtractData> filteredList = processedList.stream().collect(ArrayList::new,
				(list, item) -> list.addAll(item.getPoints()), List::addAll);
		KMeansPlusPlusClusterer<ExtractData> kMeansPlusPlusClusterer2 = new KMeansPlusPlusClusterer<ExtractData>(4,
				2000, new EuclideanDistance());
		List<CentroidCluster<ExtractData>> cluster2 = kMeansPlusPlusClusterer2.cluster(filteredList);
		List<CentroidCluster<ExtractData>> finalExtractDataList = cluster2.stream()
				.sorted((a, b) -> a.getPoints().size() <= b.getPoints().size() ? 1 : -1).collect(Collectors.toList());// desc

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
					log.info(key + "is not existing in the final output list");
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
				item.setCluster("Cluster A");
				item.setSd(sdArray[0]);
			} else if (proMap1.get(key) + proMap2.get(key) > 0.8) {
				item.setCluster("Cluster B");
				item.setSd(sdArray[1]);
			} else if (proMap1.get(key) + proMap2.get(key) + proMap3.get(key) > 0.8) {
				item.setCluster("Cluster C");
				item.setSd(sdArray[2]);
			} else {
				item.setCluster("Cluster D");
				item.setSd(sdArray[3]);
			}
			item.setSampSize(totalDataMap.get(key).size());

			// sample size < 300 case, force set Cluster C
			if (item.getSampSize() <= 300) {
				item.setCluster("Cluster C");
				item.setSd(sdArray[2]);
			}
		});
		
		return outputList;
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
