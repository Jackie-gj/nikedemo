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

public class TestRandomForest2 {

	public static void main(String[] args) {
		
		SparkSession spark = SparkSession.builder().master("local").appName("test").getOrCreate();
		
		long start = System.currentTimeMillis();
		
		Dataset<Row> data = spark.read().option("header", "true").option("mode", "DROPMALFORMED")
				.option("inferSchema", true).csv("extractData.csv");
		
		// filter useless columns
		data = data.select("cluster", "tradeZone", "storeType", "gndrGroupNm", "ctgyPtfm", "price", "colorMain");
		
		// Index labels, adding metadata to the label column.
		// Fit on whole dataset to include all labels in index.
		StringIndexer clusterIndexer = new StringIndexer().setInputCol("cluster").setOutputCol("clusterIndexLabel");
		StringIndexer tradeZoneIndexer = new StringIndexer().setInputCol("tradeZone").setOutputCol("tradeZoneIndexLabel");
		StringIndexer storeTypeIndexer = new StringIndexer().setInputCol("storeType").setOutputCol("storeTypeIndexLabel");
		StringIndexer gndrGroupNmIndexer = new StringIndexer().setInputCol("gndrGroupNm").setOutputCol("gndrGroupNmIndexLabel");
		StringIndexer ctgyPtfmIndexer = new StringIndexer().setInputCol("ctgyPtfm").setOutputCol("ctgyPtfmIndexLabel");
		StringIndexer priceIndexer = new StringIndexer().setInputCol("price").setOutputCol("priceIndexLabel");
		StringIndexer colorMainIndexer = new StringIndexer().setInputCol("colorMain").setOutputCol("colorMainIndexLabel");
		
		VectorAssembler vectorAssembler = new VectorAssembler().setInputCols(new String[] { "tradeZoneIndexLabel", "storeTypeIndexLabel", "gndrGroupNmIndexLabel", 
				"ctgyPtfmIndexLabel", "priceIndexLabel", "colorMainIndexLabel" })
				.setOutputCol("features");
		
		VectorIndexer featureIndexer = new VectorIndexer().setInputCol("features").setOutputCol("indexedFeatures")
				.setMaxCategories(6);
		
		RandomForestClassifier rf = new RandomForestClassifier().setLabelCol("clusterIndexLabel")
				.setFeaturesCol("indexedFeatures").setSeed(123).setNumTrees(100);
		
		Pipeline prepareDataPipeline = new Pipeline()
				.setStages(new PipelineStage[] { clusterIndexer, tradeZoneIndexer, storeTypeIndexer,
						gndrGroupNmIndexer, ctgyPtfmIndexer, priceIndexer, colorMainIndexer, vectorAssembler, featureIndexer, rf });
		
		// Automatically identify categorical features, and index them.
		// Set maxCategories so features with > 4 distinct values are treated as
		// continuous.

//		data = vectorAssembler.transform(data);

		// Split the data into training and test sets (30% held out for testing)
		Dataset<Row>[] splits = data.randomSplit(new double[] { 0.7, 0.3 });
		Dataset<Row> trainingData = splits[0];
		Dataset<Row> testData = splits[1];

		// Train a RandomForest model.
		
		// Convert indexed labels back to original labels.
//		IndexToString labelConverter = new IndexToString().setInputCol("prediction").setOutputCol("predictedLabel")
//				.setLabels(clusterIndexerModel.labels());

		// Chain indexers and forest in a Pipeline
//		Pipeline pipeline = new Pipeline()
//				.setStages(new PipelineStage[] { clusterIndexerModel, featureIndexerModel, rf/*, labelConverter*/ });

		// Train model. This also runs the indexers.
		PipelineModel model = prepareDataPipeline.fit(trainingData);

		// Make predictions.
//		Dataset<Row> predictions = model.transform(testData);

		// Select example rows to display.
//		predictions.select(/*"predictedLabel", */"cluster", "features").show(5);

		// Select (prediction, true label) and compute test error
/*		MulticlassClassificationEvaluator evaluator = new MulticlassClassificationEvaluator()
				.setLabelCol("clusterIndexLabel").setPredictionCol("prediction").setMetricName("accuracy");
		double accuracy = evaluator.evaluate(predictions);
		System.out.println("Test Error = " + (1.0 - accuracy));*/

		RandomForestClassificationModel rfModel = (RandomForestClassificationModel) (model.stages()[model.stages().length - 1]);
		System.out.println(rfModel.featureImportances());
		
		Vector fiVector = rfModel.featureImportances();
		for (double d : fiVector.toArray()) {
			System.out.println(d);
		}
//		System.out.println("Learned classification forest model:\n" + rfModel.toDebugString());
		
		System.out.println("Cost : " + (System.currentTimeMillis() - start) / 1000 + " ms");
	}

}
