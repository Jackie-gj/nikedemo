package com.nike.demo.core.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.nike.demo.core.dao.DSIPropertiesDao;
import com.nike.demo.core.entity.DSIProperties;
import com.nike.demo.core.service.DSIPropertiesService;

@Service("dsiPropertiesService")
public class DSIPropertiesServiceImpl implements DSIPropertiesService {
	
	private static final Logger log = Logger.getLogger(DSIPropertiesServiceImpl.class);

	@Resource
	private DSIPropertiesDao dsiPropertyDao;

	@Override
	public int insert(DSIProperties record) {
		return dsiPropertyDao.insert(record);
	}

	@Override
	public int insertSelective(DSIProperties record) {
		return dsiPropertyDao.insert(record);
	}

	@Override
	public int updateSelective(DSIProperties record) {
		return dsiPropertyDao.updateSelective(record);
	}

	@Override
	public List<DSIProperties> findByGroupName(String groupName) {
		return dsiPropertyDao.findByGroupName(groupName);
	}

	@Override
	public List<DSIProperties> findByGroupNames(List<String> groupNames) {
		return dsiPropertyDao.findByGroupNames(groupNames);
	}

}
