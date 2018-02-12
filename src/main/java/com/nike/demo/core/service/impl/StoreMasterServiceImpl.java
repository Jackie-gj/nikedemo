package com.nike.demo.core.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.nike.demo.core.dao.StoreMasterDao;
import com.nike.demo.core.entity.StoreMaster;
import com.nike.demo.core.service.StoreMasterService;

@Service("storeMasterService")
public class StoreMasterServiceImpl implements StoreMasterService {

	private static final Logger log = Logger.getLogger(StoreMasterServiceImpl.class);

	@Resource
	private SqlSessionFactory sqlSessionFactory;

	@Resource
	private StoreMasterDao storeMasterDao;

	@Override
	public List<StoreMaster> findData(Map<String, Object> map) {
		return storeMasterDao.findData(map);
	}

	@Override
	public Long getTotalCount(Map<String, Object> map) {
		return storeMasterDao.getTotalCount(map);
	}

	@Override
	public void add(StoreMaster storeMaster) {
		storeMasterDao.insertSelective(storeMaster);
	}

	@Override
	public void addBatch(List<StoreMaster> storeMasters) {
		// TODO Auto-generated method stub

	}

	@Override
	public int updateByPrimaryKey(StoreMaster storeMaster) {
		return storeMasterDao.updateByPrimaryKeySelective(storeMaster);
	}

	@Override
	public int deleteByPrimaryKey(String posid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public StoreMaster findById(String posid) {
		return storeMasterDao.selectByPrimaryKey(posid);
	}

	@Override
	public void deleteAll() {
		storeMasterDao.deleteAll();
	}

	@Override
	public void addBatch2(List<StoreMaster> storeMasters) {
		SqlSession batchSqlSession = sqlSessionFactory.openSession(ExecutorType.BATCH, false);
		for (StoreMaster storeMaster : storeMasters) {
			batchSqlSession.insert("com.nike.demo.core.dao.StoreMasterDao.insertSelective", storeMaster);
		}
		batchSqlSession.flushStatements();
		batchSqlSession.commit();
		batchSqlSession.clearCache();
	}

}
