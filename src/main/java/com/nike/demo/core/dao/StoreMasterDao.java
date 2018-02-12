package com.nike.demo.core.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.nike.demo.core.entity.StoreMaster;

@Repository
public interface StoreMasterDao {

	int insertSelective(StoreMaster record);

	int updateByPrimaryKeySelective(StoreMaster record);

	public List<StoreMaster> findData(Map<String, Object> map);

	public Long getTotalCount(Map<String, Object> map);

	public void deleteAll();
	
	StoreMaster selectByPrimaryKey(String posid);

}