package com.nike.demo.core.service;

import java.util.List;

import com.nike.demo.core.entity.DSIProperties;

public interface DSIPropertiesService {
	public int insert(DSIProperties record);

	public int insertSelective(DSIProperties record);
    
	public int updateSelective(DSIProperties record);
    
    public List<DSIProperties> findByGroupName(String groupName);
    
    public List<DSIProperties> findByGroupNames(List<String> groupNames);

}
