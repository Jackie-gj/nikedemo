package test;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

import com.nike.demo.core.service.processor.RandomForestProcessor;

public class TestRandomForest3 {

	public static void main(String[] args) throws Exception {
		RandomForestProcessor randomForestProcessor = new RandomForestProcessor(
				new String[] { "tradeZone", "storeType", "gndrGroupNm", "ctgyPtfm", "price", "colorMain" },
				"extractData.csv");
		
		ExecutorService executorService = Executors.newCachedThreadPool();
		executorService.submit(randomForestProcessor);
		executorService.shutdown();
		executorService.awaitTermination(5, TimeUnit.MINUTES);
	}

}
