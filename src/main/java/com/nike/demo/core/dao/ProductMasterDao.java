package com.nike.demo.core.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.nike.demo.core.entity.ProductMaster;

@Repository
public interface ProductMasterDao {
    int deleteByPrimaryKey(String matlNbr);

    void insertSelective(ProductMaster record);

    ProductMaster selectByPrimaryKey(String matlNbr);

    int updateByPrimaryKeySelective(ProductMaster record);

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
    
    public void deleteAll();
    
    public void insertBatch(List<ProductMaster> list);
}