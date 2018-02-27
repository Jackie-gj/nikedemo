package com.nike.demo.core.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<DSIProperties> findByGroupName(String groupName, String prodType) {
		Map<String, Object> paramsMap = new HashMap<String, Object>();
		paramsMap.put("groupName", groupName);
		paramsMap.put("prodType", prodType);
		return dsiPropertyDao.findByGroupName(paramsMap);
	}

	@Override
	public List<DSIProperties> findByGroupNames(List<String> groupNames, String prodType) {
		Map<String, Object> paramsMap = new HashMap<String, Object>();
		paramsMap.put("groupNames", groupNames);
		paramsMap.put("prodType", prodType);
		return dsiPropertyDao.findByGroupNames(paramsMap);
	}

}
