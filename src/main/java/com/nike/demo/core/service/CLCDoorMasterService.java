package com.nike.demo.core.service;

import java.util.List;
import java.util.Map;

import com.nike.demo.core.entity.CLCDoorMaster;

public interface CLCDoorMasterService {
	public List<CLCDoorMaster> findData(Map<String, Object> map);

	public Long getTotalCount(Map<String, Object> map);

	public void add(CLCDoorMaster clcDoorMaster);

	public void addBatch(List<CLCDoorMaster> clcDoorMasters);

	public int updateByPrimaryKey(CLCDoorMaster clcDoorMaster);

	public int deleteByPrimaryKey(String clcDoorId);

	public CLCDoorMaster findById(String clcDoorId);

	public void deleteAll();

	void addBatch2(List<CLCDoorMaster> clcDoorMasters);

}
