package com.nike.demo.core.service;

import java.util.List;
import java.util.Map;

import com.nike.demo.core.entity.DSIData;
import com.nike.demo.core.entity.PreparedData;

public interface PreparedDataService {
	public int insert(PreparedData record);

	public int insertSelective(PreparedData record);
    
	@Deprecated
	public List<PreparedData> findByQuart(String quart);
	
	public List<PreparedData> findByQuart(Map<String, String> paramMap);
	
	public List<DSIData> predictData(String dsiProperties, String seasonYear, String prodType)  throws Exception;
	
	public List<PreparedData> findByQuarts(List<String> quarts);
	
	public Integer getTotalCountByQuart(String seasonYear, String prodType);

}
