package com.nike.demo.core.spark;

import org.apache.spark.sql.SparkSession;
import org.springframework.stereotype.Component;

@Component
public class SparkHelper {

	private SparkSession sparkSession;

	private SparkHelper() {
		init();
	}

	private void init() {
		System.out.println("start init spark");
		sparkSession = SparkSession.builder().master("local").appName("nikedemo").getOrCreate();
		System.out.println("finished init spark");
	}

	public SparkSession getSparkSession() {
		return sparkSession;
	}
}
