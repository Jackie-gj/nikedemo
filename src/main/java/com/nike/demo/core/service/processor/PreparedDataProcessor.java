package com.nike.demo.core.service.processor;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Vector;
import java.util.function.IntBinaryOperator;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.math3.ml.clustering.CentroidCluster;
import org.apache.commons.math3.ml.clustering.KMeansPlusPlusClusterer;
import org.apache.commons.math3.ml.distance.EuclideanDistance;
import org.apache.log4j.Logger;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.nike.demo.core.entity.ExtractData;
import com.nike.demo.core.entity.PreparedData;
import com.nike.demo.core.service.PreparedDataService;
import com.nike.demo.core.util.CamelCaseUtils;

public class PreparedDataProcessor implements Runnable {

	private String seasonYear;
	
	private String[] propsArray;

	private Vector<CentroidCluster<ExtractData>> resultList;

	private static final String DEF_COL_DELIMITER = ",";
	
	private static final Logger log = Logger.getLogger(PreparedDataProcessor.class);

	public PreparedDataProcessor(String seasonYear, String[] propsArray,
			Vector<CentroidCluster<ExtractData>> resultList) {
		this.seasonYear = seasonYear;
		this.propsArray = propsArray;
		this.resultList = resultList;
	}

	@Override
	public void run() {
		WebApplicationContext appContext = ContextLoader.getCurrentWebApplicationContext();
		PreparedDataService preparedDataService = appContext.getBean(PreparedDataService.class);

		// fetch prepared data from DB
		List<PreparedData> dataList = new ArrayList<PreparedData>();
		try {
			Map<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("quart", "'" + seasonYear + "'");
			String columns = "";
			if(null != propsArray && 0 < propsArray.length) {
				for (int i = 0; i < propsArray.length; i++) {
					propsArray[i] = CamelCaseUtils.toUnderlineName(propsArray[i]);
				}
				columns = String.join(DEF_COL_DELIMITER, propsArray);
			}
			paramMap.put("columns", columns);
			dataList = preparedDataService.findByQuart(paramMap);
		} catch (Exception e1) {
			log.error(e1);
			return;
		}

		// group by store + prod id
		List<ExtractData> extractDataList = new ArrayList<ExtractData>();
		Map<String, List<PreparedData>> map = dataList.stream()
				.collect(Collectors.groupingBy(PreparedData::getStoreProdId));

		// loop to calculate the mean/sd/diffsum
		Iterator<Entry<String, List<PreparedData>>> it = map.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<String, List<PreparedData>> preparedData = (Map.Entry<String, List<PreparedData>>) it.next();
			// MEAN
			Stream<PreparedData> pStream = preparedData.getValue().stream();
			double mean = pStream.mapToInt(p -> p.getNetSalesUnits()).average().getAsDouble();
			// SD
			Stream<PreparedData> pStream2 = preparedData.getValue().stream();
			double sd = Math.sqrt(pStream2.map(p -> Math.pow(p.getNetSalesUnits() - mean, 2.0)).mapToDouble(p -> p)
					.average().getAsDouble());
			// DIFFSUM
			Stream<PreparedData> pStream3 = preparedData.getValue().stream();
			int diffsum = pStream3.mapToInt(p -> p.getNetSalesUnits()).reduce(new IntBinaryOperator() {
				private int sum, pre, flag = 0;

				public int applyAsInt(int left, int right) {
					if (flag-- == 0) {
						sum += Math.abs(right - left);
					} else {
						sum += Math.abs(right - pre);
					}
					pre = right;
					return sum;
				}
			}).getAsInt();

			ExtractData extractData = new ExtractData();
			try {
				BeanUtils.copyProperties(extractData, preparedData.getValue().get(0));
			} catch (Exception e) {
				log.error(e);
			}
			extractData.setMean(mean);
			extractData.setSd(sd);
			extractData.setDiffsum(diffsum);
			extractDataList.add(extractData);
		}

		// first round for clustering
		KMeansPlusPlusClusterer<ExtractData> kMeansPlusPlusClusterer = new KMeansPlusPlusClusterer<ExtractData>(6, 800,
				new EuclideanDistance());
		List<CentroidCluster<ExtractData>> cluster = kMeansPlusPlusClusterer.cluster(extractDataList);
		List<CentroidCluster<ExtractData>> sortedList = cluster.stream()
				.sorted((a, b) -> a.getPoints().size() >= b.getPoints().size() ? 1 : -1).skip(3)
				.collect(Collectors.toList()); // asc

		// debug use, checking cluster, need to be deleted
		int k = 0;
		for (CentroidCluster<ExtractData> cl : sortedList) {
			String clusterName = "cluster" + k;
			System.out.println(Thread.currentThread().getName() + ": " + clusterName + ": " + cl.getPoints().size());
			k++;
		}

		resultList.addAll(sortedList);
	}

	public PreparedDataProcessor() {
	}

}
