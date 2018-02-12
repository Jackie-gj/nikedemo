package com.nike.demo.core.service;

import java.util.List;
import java.util.Map;

import com.nike.demo.core.entity.SaleInfo;

public interface SaleInfoService {
	public List<SaleInfo> findData(Map<String, Object> map);

	public Long getTotalCount(Map<String, Object> map);

	public void add(SaleInfo saleInfo);

	public void addBatch(List<SaleInfo> saleInfos);

	public int updateByPrimaryKey(SaleInfo saleInfo);

	public int deleteByPrimaryKey(String posid);

	public SaleInfo findById(String posid);

	public void deleteAll();

	void addBatch2(List<SaleInfo> saleInfos);

}
