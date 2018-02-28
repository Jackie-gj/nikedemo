package com.nike.demo.core.service;

import java.util.List;

import com.nike.demo.core.entity.PropImportance;

public interface PropImportanceService {
	int insert(PropImportance record);

	int insertSelective(PropImportance record);

	List<PropImportance> listAll();

}
