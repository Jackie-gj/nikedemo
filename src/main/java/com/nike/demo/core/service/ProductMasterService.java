package com.nike.demo.core.service;

import java.util.List;
import java.util.Map;

import com.nike.demo.core.entity.ProductMaster;

public interface ProductMasterService {
	/**
	 * 返回相应的数据集合
	 * 
	 * @param map
	 * @return
	 */
	public List<ProductMaster> findData(Map<String, Object> map);

	/**
	 * 数据数目
	 * 
	 * @param map
	 * @return
	 */
	public Long getTotalCount(Map<String, Object> map);

	/**
	 * 添加
	 * 
	 * @param picture
	 * @return
	 */
	public void add(ProductMaster productMaster);

	/**
	 * 添加
	 * 
	 * @param picture
	 * @return
	 */
	public void addBatch(List<ProductMaster> productMasterList);

	
	/**
	 * 修改
	 * 
	 * @param picture
	 * @return
	 */
	public int updateByPrimaryKey(ProductMaster productMaster);

	/**
	 * 删除
	 * 
	 * @param id
	 * @return
	 */
	public int deleteByPrimaryKey(String matlNbr);

	/**
	 * 根据id查找
	 * 
	 * @param id
	 * @return
	 */
	public ProductMaster findById(String matlNbr);
	
	public void deleteAll();

	void addBatch2(List<ProductMaster> productMasterList);
	
}
