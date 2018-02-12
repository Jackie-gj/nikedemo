package com.nike.demo.core.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nike.demo.core.dao.CLCDoorMasterDao;
import com.nike.demo.core.entity.CLCDoorMaster;
import com.nike.demo.core.service.CLCDoorMasterService;

@Service("clcDoorMasterService")
public class CLCDoorMasterServiceImpl implements CLCDoorMasterService {

	private static final Logger log = Logger.getLogger(CLCDoorMasterServiceImpl.class);

	@Autowired
	private SqlSessionFactory sqlSessionFactory;

	@Autowired
	private CLCDoorMasterDao clcDoorMasterDao;
	
	@Override
	public List<CLCDoorMaster> findData(Map<String, Object> map) {
		return clcDoorMasterDao.findData(map);
	}

	@Override
	public Long getTotalCount(Map<String, Object> map) {
		return clcDoorMasterDao.getTotalCount(map);
	}

	@Override
	public void add(CLCDoorMaster clcDoorMaster) {
		clcDoorMasterDao.insertSelective(clcDoorMaster);
	}

	@Override
	public void addBatch(List<CLCDoorMaster> clcDoorMasters) {
		// TODO Auto-generated method stub

	}

	@Override
	public int updateByPrimaryKey(CLCDoorMaster clcDoorMaster) {
		return clcDoorMasterDao.updateByPrimaryKey(clcDoorMaster);
	}

	@Override
	public int deleteByPrimaryKey(String clcDoorId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CLCDoorMaster findById(String clcDoorId) {
		return clcDoorMasterDao.selectByPrimaryKey(clcDoorId);
	}

	@Override
	public void deleteAll() {
		clcDoorMasterDao.deleteAll();
	}

	@Override
	public void addBatch2(List<CLCDoorMaster> clcDoorMasters) {
		SqlSession batchSqlSession = sqlSessionFactory.openSession(ExecutorType.BATCH, false);
		for (CLCDoorMaster clcDoorMaster : clcDoorMasters) {
			batchSqlSession.insert("com.nike.demo.core.dao.CLCDoorMasterDao.insertSelective", clcDoorMaster);
		}
		batchSqlSession.flushStatements();
		batchSqlSession.commit();
		batchSqlSession.clearCache();
	}

}
