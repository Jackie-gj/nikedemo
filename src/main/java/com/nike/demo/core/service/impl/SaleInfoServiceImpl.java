package com.nike.demo.core.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.nike.demo.core.dao.SaleInfoDao;
import com.nike.demo.core.entity.SaleInfo;
import com.nike.demo.core.service.SaleInfoService;

@Service("saleInfoService")
public class SaleInfoServiceImpl implements SaleInfoService {

	private static final Logger log = Logger.getLogger(SaleInfoServiceImpl.class);

	@Resource
	private SqlSessionFactory sqlSessionFactory;

	@Resource
	private SaleInfoDao saleInfoDao;

	@Override
	public List<SaleInfo> findData(Map<String, Object> map) {
		return saleInfoDao.findData(map);
	}

	@Override
	public Long getTotalCount(Map<String, Object> map) {
		return saleInfoDao.getTotalCount(map);
	}

	@Override
	public void add(SaleInfo saleInfo) {
		saleInfoDao.insertSelective(saleInfo);
	}

	@Override
	public void addBatch(List<SaleInfo> saleInfos) {
		// TODO Auto-generated method stub

	}

	@Override
	public int updateByPrimaryKey(SaleInfo saleInfo) {
		return saleInfoDao.updateByPrimaryKey(saleInfo);
	}

	@Override
	public int deleteByPrimaryKey(String posid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public SaleInfo findById(String posid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteAll() {
		saleInfoDao.deleteAll();
	}

	@Override
	public void addBatch2(List<SaleInfo> saleInfos) {
		SqlSession batchSqlSession = sqlSessionFactory.openSession(ExecutorType.BATCH, false);
		for (SaleInfo saleInfo : saleInfos) {
			batchSqlSession.insert("com.nike.demo.core.dao.SaleInfoDao.insertSelective", saleInfo);
		}
		batchSqlSession.flushStatements();
		batchSqlSession.commit();
		batchSqlSession.clearCache();
	}

}
