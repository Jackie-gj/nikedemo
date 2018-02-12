package com.nike.demo.core.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.nike.demo.core.dao.ProductMasterDao;
import com.nike.demo.core.entity.ProductMaster;
import com.nike.demo.core.service.ProductMasterService;

@Service("productMasterService")
public class ProductMasterServiceImpl implements ProductMasterService {
	private static final Logger log = Logger.getLogger(ProductMasterServiceImpl.class);
	
	@Resource
	private SqlSessionFactory sqlSessionFactory;
	
    @Resource
    private ProductMasterDao productMasterDao;

    @Override
    public List<ProductMaster> findData(Map<String, Object> map) {
        return productMasterDao.findData(map);
    }

    @Override
    public Long getTotalCount(Map<String, Object> map) {
        return productMasterDao.getTotalCount(map);
    }

    @Override
    public void add(ProductMaster productMaster) {
        productMasterDao.insertSelective(productMaster);
    }

    @Override
    public int updateByPrimaryKey(ProductMaster productMaster) {
        return productMasterDao.updateByPrimaryKeySelective(productMaster);
    }

    @Override
    public int deleteByPrimaryKey(String matlNbr) {
        return productMasterDao.deleteByPrimaryKey(matlNbr);
    }

    @Override
    public ProductMaster findById(String matlNbr) {
        return productMasterDao.selectByPrimaryKey(matlNbr);
    }

	@Override
	public void addBatch(List<ProductMaster> productMasterList) {
		SqlSession batchSqlSession = sqlSessionFactory.openSession(ExecutorType.BATCH, false);
		int result = 1;
		int batchCount = 1000;// 每批commit的个数
		int batchLastIndex = batchCount;// 每批最后一个的下标
		for (int index = 0; index < productMasterList.size();) {
			if (batchLastIndex >= productMasterList.size()) {
				batchLastIndex = productMasterList.size();
				result = result * batchSqlSession.insert("com.nike.demo.core.dao.ProductMasterDao.insertBatch",
						productMasterList.subList(index, batchLastIndex));
				batchSqlSession.commit();
				log.debug("index:" + index + " batchLastIndex:" + batchLastIndex);
				break;// 数据插入完毕，退出循环
			} else {
				result = result * batchSqlSession.insert("com.nike.demo.core.dao.ProductMasterDao.insertBatch",
						productMasterList.subList(index, batchLastIndex));
				batchSqlSession.commit();
				log.debug("index:" + index + " batchLastIndex:" + batchLastIndex);
				index = batchLastIndex;// 设置下一批下标
				batchLastIndex = index + (batchCount - 1);
			}
		}
		batchSqlSession.commit();
		//productMasterDao.insertBatch(productMasterList);
	}
	
	@Override
	public void addBatch2(List<ProductMaster> productMasterList) {
		SqlSession batchSqlSession = sqlSessionFactory.openSession(ExecutorType.BATCH, false);
		for (ProductMaster productMaster : productMasterList) {
			batchSqlSession.insert("com.nike.demo.core.dao.ProductMasterDao.insertSelective", productMaster);
		}
		batchSqlSession.flushStatements();
		batchSqlSession.commit();
		batchSqlSession.clearCache();
	}

	@Override
	public void deleteAll() {
		productMasterDao.deleteAll();
	}

}
