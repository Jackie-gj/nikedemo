package test;

import java.util.Map;

import org.apache.spark.ml.Pipeline;
import org.apache.spark.ml.PipelineModel;
import org.apache.spark.ml.PipelineStage;
import org.apache.spark.ml.classification.RandomForestClassificationModel;
import org.apache.spark.ml.classification.RandomForestClassifier;
import org.apache.spark.ml.evaluation.MulticlassClassificationEvaluator;
import org.apache.spark.ml.feature.IndexToString;
import org.apache.spark.ml.feature.StringIndexer;
import org.apache.spark.ml.feature.StringIndexerModel;
import org.apache.spark.ml.feature.VectorAssembler;
import org.apache.spark.ml.feature.VectorIndexer;
import org.apache.spark.ml.feature.VectorIndexerModel;
import org.apache.spark.ml.linalg.Vector;
import org.apache.spark.sql.Column;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SparkSession;
import org.apache.spark.sql.catalyst.expressions.Expression;

public class TestRandomForest {

	public static void main(String[] args) {
		
		SparkSession spark = SparkSession.builder().master("local").appName("test").getOrCreate();
		
		long start = System.currentTimeMillis();
		
		Dataset<Row> data = spark.read().option("header", "true").option("mode", "DROPMALFORMED")
				.option("inferSchema", true).csv("extractData.csv");
		
		// filter useless columns
		data = data.select("cluster", "tradeZone", "storeType", "gndrGroupNm", "ctgyPtfm", "price", "colorMain");
		
		// Index labels, adding metadata to the label column.
		// Fit on whole dataset to include all labels in index.
		StringIndexerModel clusterIndexerModel = new StringIndexer().setInputCol("cluster").setOutputCol("clusterIndexLabel").fit(data);
		StringIndexerModel tradeZoneIndexerModel = new StringIndexer().setInputCol("tradeZone").setOutputCol("tradeZoneIndexLabel").fit(data);
		StringIndexerModel storeTypeIndexerModel = new StringIndexer().setInputCol("storeType").setOutputCol("storeTypeIndexLabel").fit(data);
		StringIndexerModel gndrGroupNmIndexerModel = new StringIndexer().setInputCol("gndrGroupNm").setOutputCol("gndrGroupNmIndexLabel").fit(data);
		StringIndexerModel ctgyPtfmIndexerModel = new StringIndexer().setInputCol("ctgyPtfm").setOutputCol("ctgyPtfmIndexLabel").fit(data);
		StringIndexerModel priceIndexerModel = new StringIndexer().setInputCol("price").setOutputCol("priceIndexLabel").fit(data);
		StringIndexerModel colorMainIndexerModel = new StringIndexer().setInputCol("colorMain").setOutputCol("colorMainIndexLabel").fit(data);
		
		data = tradeZoneIndexerModel.transform(data);
		data = storeTypeIndexerModel.transform(data);
		data = gndrGroupNmIndexerModel.transform(data);
		data = ctgyPtfmIndexerModel.transform(data);
		data = priceIndexerModel.transform(data);
		data = colorMainIndexerModel.transform(data);
		
		// Automatically identify categorical features, and index them.
		// Set maxCategories so features with > 4 distinct values are treated as
		// continuous.
		VectorAssembler vectorAssembler = new VectorAssembler().setInputCols(new String[] { "tradeZoneIndexLabel", "storeTypeIndexLabel", "gndrGroupNmIndexLabel", 
				"ctgyPtfmIndexLabel", "priceIndexLabel", "colorMainIndexLabel" })
				.setOutputCol("features");
		data = vectorAssembler.transform(data);
		VectorIndexerModel featureIndexerModel = new VectorIndexer().setInputCol("features").setOutputCol("indexedFeatures")
				.setMaxCategories(6).fit(data);

		// Split the data into training and test sets (30% held out for testing)
		Dataset<Row>[] splits = data.randomSplit(new double[] { 0.7, 0.3 });
		Dataset<Row> trainingData = splits[0];
		Dataset<Row> testData = splits[1];

		// Train a RandomForest model.
		RandomForestClassifier rf = new RandomForestClassifier().setLabelCol("clusterIndexLabel")
				.setFeaturesCol("indexedFeatures").setSeed(123).setNumTrees(100);

		// Convert indexed labels back to original labels.
//		IndexToString labelConverter = new IndexToString().setInputCol("prediction").setOutputCol("predictedLabel")
//				.setLabels(clusterIndexerModel.labels());

		// Chain indexers and forest in a Pipeline
		Pipeline pipeline = new Pipeline()
				.setStages(new PipelineStage[] { clusterIndexerModel, featureIndexerModel, rf/*, labelConverter*/ });

		// Train model. This also runs the indexers.
		PipelineModel model = pipeline.fit(trainingData);

		// Make predictions.
//		Dataset<Row> predictions = model.transform(testData);

		// Select example rows to display.
//		predictions.select(/*"predictedLabel", */"cluster", "features").show(5);

		// Select (prediction, true label) and compute test error
/*		MulticlassClassificationEvaluator evaluator = new MulticlassClassificationEvaluator()
				.setLabelCol("clusterIndexLabel").setPredictionCol("prediction").setMetricName("accuracy");
		double accuracy = evaluator.evaluate(predictions);
		System.out.println("Test Error = " + (1.0 - accuracy));*/

		RandomForestClassificationModel rfModel = (RandomForestClassificationModel) (model.stages()[2]);
		System.out.println(rfModel.featureImportances());
		
		Vector fiVector = rfModel.featureImportances();
		for (double d : fiVector.toArray()) {
			System.out.println(d);
		}
//		System.out.println("Learned classification forest model:\n" + rfModel.toDebugString());
		
		System.out.println("Cost : " + (System.currentTimeMillis() - start) / 1000 + " ms");
	}

}
