package com.nike.demo.core.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.nike.demo.core.dao.PropImportanceDao;
import com.nike.demo.core.entity.PropImportance;
import com.nike.demo.core.service.PropImportanceService;

@Service
public class PropImportanceServiceImpl implements PropImportanceService {

	private static final Logger log = Logger.getLogger(PropImportanceServiceImpl.class);

	@Resource
	private PropImportanceDao propImportanceDao;

	@Override
	public int insert(PropImportance record) {
		return propImportanceDao.insert(record);
	}

	@Override
	public int insertSelective(PropImportance record) {
		return propImportanceDao.insertSelective(record);
	}

	@Override
	public List<PropImportance> listAll() {
		return propImportanceDao.listAll();
	}

}
