package com.nike.demo.core.service;

import java.util.List;

import com.nike.demo.core.entity.DSIData;
import com.nike.demo.core.entity.PreparedData;

public interface PreparedDataService {
	public int insert(PreparedData record);

	public int insertSelective(PreparedData record);
    
	public List<PreparedData> findByQuart(String quart);
	
	public List<DSIData> predictData(String dsiProperties, String seasonYear, String prodType)  throws Exception;

}
