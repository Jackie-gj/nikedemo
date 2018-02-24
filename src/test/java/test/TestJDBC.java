package test;

import java.io.FileWriter;
import java.io.Writer;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.function.IntBinaryOperator;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.dbutils.GenerousBeanProcessor;
import org.apache.commons.math3.distribution.NormalDistribution;
import org.apache.commons.math3.ml.clustering.CentroidCluster;
import org.apache.commons.math3.ml.clustering.KMeansPlusPlusClusterer;
import org.apache.commons.math3.ml.distance.EuclideanDistance;

import com.nike.demo.core.entity.ExtractData;
import com.nike.demo.core.entity.Features;
import com.nike.demo.core.entity.PreparedData;
import com.opencsv.CSVWriter;
import com.opencsv.bean.ColumnPositionMappingStrategy;
import com.opencsv.bean.StatefulBeanToCsv;
import com.opencsv.bean.StatefulBeanToCsvBuilder;

public class TestJDBC {

	public static void main(String[] args) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/nike?useUnicode=true&characterEncoding=utf8&autoReconnect=true", "root",
				"123456");
		PreparedStatement pStatement = connection.prepareStatement("select * from nk_prepared_data where quart = 'FA17'");
		ResultSet rSet = pStatement.executeQuery();
		GenerousBeanProcessor bp = new GenerousBeanProcessor();
		ArrayList<PreparedData> dataList = null;
		if (rSet.next()) {
			dataList = (ArrayList<PreparedData>) bp.toBeanList(rSet, PreparedData.class);
		}

		List<ExtractData> extractDataList = new ArrayList<ExtractData>();
		List<Features> featuresList = new ArrayList<Features>();
		Map<String, List<PreparedData>> map = dataList.stream()
				.collect(Collectors.groupingBy(PreparedData::getStoreProdId));
		Iterator<Entry<String, List<PreparedData>>> it = map.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<String, List<PreparedData>> preparedData = (Map.Entry<String, List<PreparedData>>) it.next();
			// Avg
			Stream<PreparedData> pStream = preparedData.getValue().stream();
			double avg = pStream.mapToInt(p -> p.getNetSalesUnits()).average().getAsDouble();
			// SD
			Stream<PreparedData> pStream2 = preparedData.getValue().stream();
			double sd = Math.sqrt(pStream2.map(p -> Math.pow(p.getNetSalesUnits() - avg, 2.0)).mapToDouble(p -> p)
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
			System.out.println(preparedData.getKey() + " = " + avg + ", " + sd + ", " + diffsum);

			featuresList.add(new Features(preparedData.getKey(), avg, sd, diffsum));
			
			ExtractData extractData = new ExtractData();
			BeanUtils.copyProperties(extractData, preparedData.getValue().get(0));
			extractData.setMean(avg);
			extractData.setSd(sd);
			extractData.setDiffsum(diffsum);
			extractDataList.add(extractData);
		}
		rSet.close();
		pStatement.close();
		connection.close();
		
		featuresList.sort((a, b) -> a.getStoreProdId().compareTo(b.getStoreProdId()));
		
		KMeansPlusPlusClusterer<ExtractData> kMeansPlusPlusClusterer = new KMeansPlusPlusClusterer<ExtractData>(6, 800,
				new EuclideanDistance());
		List<CentroidCluster<ExtractData>> cluster = kMeansPlusPlusClusterer.cluster(extractDataList);
		System.out.println(cluster.size());
		List<CentroidCluster<ExtractData>> sortedList = cluster.stream()
				.sorted((a, b) -> a.getPoints().size() >= b.getPoints().size() ? 1 : -1).skip(3)
				.collect(Collectors.toList());
		int i = 0;
		for (CentroidCluster<ExtractData> cl : sortedList) {
			String clusterName = "cluster" + i;
			System.out.println(clusterName + ": " + cl.getPoints().size());
			i++;
		}
		List<ExtractData> filteredList = sortedList.stream().collect(ArrayList::new,
				(list, item) -> list.addAll(item.getPoints()), List::addAll);
		System.out.println(filteredList.size());
		
		KMeansPlusPlusClusterer<ExtractData> kMeansPlusPlusClusterer2 = new KMeansPlusPlusClusterer<ExtractData>(4, 2000,
				new EuclideanDistance());
		List<CentroidCluster<ExtractData>> cluster2 = kMeansPlusPlusClusterer2.cluster(filteredList);
		i = 0;
		for (CentroidCluster<ExtractData> cl : cluster2) {
			String clusterName = "cluster" + i;
			System.out.println(clusterName + ": " + cl.getPoints().size());
			i++;
		}
		i = 0;
		List<ExtractData> extractDatas = new ArrayList<ExtractData>();
		for (CentroidCluster<ExtractData> cl : cluster2) {
			final int si = i + 1;
			extractDatas.addAll(cl.getPoints().stream().map(p -> {
				p.setCluster("Cluster" + String.valueOf(si));
				return p;
			}).collect(Collectors.toList()));
			i ++;
		}
		
		String[] columnMapping = { "storeProdId", "mean", "sd", "diffsum" };
		ColumnPositionMappingStrategy<Features> mapper = new ColumnPositionMappingStrategy<Features>();
		mapper.setType(Features.class);
		mapper.setColumnMapping(columnMapping);
		
		Writer writer = new FileWriter("extractData.csv");
		CSVWriter csvWriter = new CSVWriter(writer, CSVWriter.DEFAULT_SEPARATOR, CSVWriter.NO_QUOTE_CHARACTER,
				CSVWriter.DEFAULT_ESCAPE_CHARACTER, CSVWriter.DEFAULT_LINE_END);
		String[] header = { "storeProdId", "mean", "sd", "diffsum" };
//		csvWriter.writeNext(header);
//		StatefulBeanToCsv<Features> beanToCsv = new StatefulBeanToCsvBuilder<Features>(writer).withMappingStrategy(mapper).build();
		StatefulBeanToCsv<ExtractData> beanToCsv = new StatefulBeanToCsvBuilder<ExtractData>(writer).build();
		beanToCsv.write(extractDatas);
		csvWriter.close();
		writer.close();
		
/*		//load data
		CSVLoader loader = new CSVLoader();
        loader.setSource(new File("features.csv"));
		Instances traindata = loader.getDataSet();
		
		// Standardize
		Standardize m_standardizeFilter = new Standardize();
		m_standardizeFilter.setInputFormat(traindata);
		traindata = Filter.useFilter(traindata, m_standardizeFilter);
		
		// kmeans
		SimpleKMeans kmeans = new SimpleKMeans();
		kmeans.setNumClusters(6);
		kmeans.setDistanceFunction(new EuclideanDistance());
		kmeans.buildClusterer(traindata);
		ClusterEvaluation eval = new ClusterEvaluation();
		eval.setClusterer(kmeans);
		eval.evaluateClusterer(traindata);
		
		System.out.println(eval.clusterResultsToString());*/
		
/*		NormalDistribution normalDistributioin = new NormalDistribution(0,1); 
		double s_diffsum = normalDistributioin.cumulativeProbability(featuresList.get(0).getDiffsum());
		System.out.println("Scaled s_diffsum: " + s_diffsum);*/
	}

}
