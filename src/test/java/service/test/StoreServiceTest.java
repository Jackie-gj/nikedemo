package service.test;

import java.util.Vector;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

import org.apache.commons.math3.ml.clustering.CentroidCluster;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.nike.demo.core.dao.PreparedDataDao;
import com.nike.demo.core.entity.ExtractData;
import com.nike.demo.core.entity.enums.SeasonYear;
import com.nike.demo.core.service.PreparedDataService;

@RunWith(SpringJUnit4ClassRunner.class) // 指定测试用例的运行器 这里是指定了Junit4
@ContextConfiguration("classpath:spring-context.xml")
// @TransactionConfiguration(transactionManager = "transactionManager",
// defaultRollback = true)
// 不添加此设置,测试service层的事务管理
// service层与dao层的测试时相同的,不同之处,在于service多数都在配置文件中配置了spring的事务管理
public class StoreServiceTest {
	@Autowired
	private PreparedDataService preparedDataService;

	@Autowired
	private PreparedDataDao preparedDataDao;

	Vector<CentroidCluster<ExtractData>> processedList = new Vector<CentroidCluster<ExtractData>>();

	@Test
	public void insertStoreTest() throws Exception {

		ExecutorService threadPool = Executors.newFixedThreadPool(4);
		SeasonYear selectSeasonYear = SeasonYear.valueOf("FA17");

		long start = System.currentTimeMillis();
		for (int i = 0; i <= 3; i++) {
			threadPool.submit(new SubProcessor(SeasonYear.getByIndex(selectSeasonYear.getIndex() - i).name(),
					processedList, preparedDataDao));
		}
		threadPool.shutdown();
		threadPool.awaitTermination(60, TimeUnit.MINUTES);

		System.out.println((System.currentTimeMillis() - start) / 1000 + " s");
	}

}

class SubProcessor implements Runnable {

	private String seasonYear;

	private Vector<CentroidCluster<ExtractData>> resultList;

	private PreparedDataDao preparedDataDao;

	public void run() {
		preparedDataDao.findByQuart(seasonYear);
		System.out.println(Thread.currentThread().getName() + " is done.");
	}

	public SubProcessor(String seasonYear, Vector<CentroidCluster<ExtractData>> resultList,
			PreparedDataDao preparedDataDao) {
		super();
		this.seasonYear = seasonYear;
		this.resultList = resultList;
		this.preparedDataDao = preparedDataDao;
	}

}
