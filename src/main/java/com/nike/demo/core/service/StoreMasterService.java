package com.nike.demo.core.service;

import java.util.List;
import java.util.Map;

import com.nike.demo.core.entity.StoreMaster;

public interface StoreMasterService {
	public List<StoreMaster> findData(Map<String, Object> map);

	public Long getTotalCount(Map<String, Object> map);

	public void add(StoreMaster storeMaster);

	public void addBatch(List<StoreMaster> storeMasters);

	public int updateByPrimaryKey(StoreMaster storeMaster);

	public int deleteByPrimaryKey(String posid);

	public StoreMaster findById(String posid);

	public void deleteAll();

	void addBatch2(List<StoreMaster> storeMasters);

}
