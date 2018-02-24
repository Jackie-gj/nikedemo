package com.nike.demo.core.service.processor;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.spark.ml.Pipeline;
import org.apache.spark.ml.PipelineModel;
import org.apache.spark.ml.PipelineStage;
import org.apache.spark.ml.classification.RandomForestClassificationModel;
import org.apache.spark.ml.classification.RandomForestClassifier;
import org.apache.spark.ml.feature.StringIndexer;
import org.apache.spark.ml.feature.StringIndexerModel;
import org.apache.spark.ml.feature.VectorAssembler;
import org.apache.spark.ml.feature.VectorIndexer;
import org.apache.spark.ml.feature.VectorIndexerModel;
import org.apache.spark.ml.linalg.Vector;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SparkSession;

import com.nike.demo.core.spark.SparkHelper;

public class RandomForestProcessor implements Runnable {

	private String[] propertyArray;

	private String[] indexLabelArray;

	private String filename;
	
	@Resource
	private SparkHelper sparkHelper;

	private static final String DEF_CLUSTER_COL_NAME = "cluster";
	
	private static final String DEF_FEATURES_COL_NAME = "features";

	private static final String DEF_INDEX_LABEL = "IndexLabel";
	
	private static final Logger log = Logger.getLogger(RandomForestProcessor.class);

	@Override
	public void run() {
		long start = System.currentTimeMillis();
		
		// build session
		log.info("build session");
		SparkSession spark = sparkHelper.getSparkSession();
		
		// read data
		log.info("read data");
		Dataset<Row> data = spark.read().option("header", "true").option("mode", "DROPMALFORMED")
				.option("inferSchema", true).csv(filename).select(DEF_CLUSTER_COL_NAME, propertyArray);
		
		// indexers
		log.info("indexer");
		StringIndexerModel clusterIndexerModel = new StringIndexer().setInputCol(DEF_CLUSTER_COL_NAME)
				.setOutputCol(DEF_CLUSTER_COL_NAME + DEF_INDEX_LABEL).fit(data);
		for (int i = 0; i < propertyArray.length; i++) {
			indexLabelArray[i] = propertyArray[i] + DEF_INDEX_LABEL;
			data = new StringIndexer().setInputCol(propertyArray[i]).setOutputCol(indexLabelArray[i]).fit(data)
					.transform(data);
		}
		data = new VectorAssembler().setInputCols(indexLabelArray).setOutputCol(DEF_FEATURES_COL_NAME).transform(data);

		VectorIndexerModel featureIndexerModel = new VectorIndexer().setInputCol(DEF_FEATURES_COL_NAME)
				.setOutputCol(DEF_FEATURES_COL_NAME + DEF_INDEX_LABEL).setMaxCategories(6).fit(data);
		
		// Split the data into training and test sets (30% held out for testing)
		log.info("split data");
		Dataset<Row>[] splits = data.randomSplit(new double[] { 0.7, 0.3 });
		Dataset<Row> trainingData = splits[0];

		// Train a RandomForest model.
		RandomForestClassifier rf = new RandomForestClassifier().setLabelCol(DEF_CLUSTER_COL_NAME + DEF_INDEX_LABEL)
				.setFeaturesCol(DEF_FEATURES_COL_NAME + DEF_INDEX_LABEL).setSeed(123).setNumTrees(100);

		// Chain indexers and forest in a Pipeline
		Pipeline pipeline = new Pipeline()
				.setStages(new PipelineStage[] { clusterIndexerModel, featureIndexerModel, rf });
		
		// Train model. This also runs the indexers.
		System.out.println("pipeline executing");
		PipelineModel model = pipeline.fit(trainingData);

		RandomForestClassificationModel rfModel = (RandomForestClassificationModel) (model.stages()[2]);
		log.info(rfModel.featureImportances());

		Vector fiVector = rfModel.featureImportances();
		for (double d : fiVector.toArray()) {
			System.out.println(d);
			// TODO return back the data to front end
		}

		log.info("Cost : " + (System.currentTimeMillis() - start) / 1000 + " ms");
	}

	public RandomForestProcessor(String[] propertyArray, String filename) {
		this.propertyArray = propertyArray;
		this.filename = filename;
		indexLabelArray = new String[propertyArray.length];
	}

	public RandomForestProcessor() {
	}

}
