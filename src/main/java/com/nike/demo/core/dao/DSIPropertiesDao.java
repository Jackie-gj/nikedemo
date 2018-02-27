package com.nike.demo.core.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Repository;

import com.nike.demo.core.entity.DSIProperties;

@Repository("dsiPropertyDao")
public interface DSIPropertiesDao {
    @Insert({
        "insert into nk_dsi_properties (group_name, name, ",
        "value, status, alias)",
        "values (#{groupName,jdbcType=VARCHAR}, #{name,jdbcType=VARCHAR}, ",
        "#{value,jdbcType=VARCHAR}, #{status,jdbcType=INTEGER}, #{alias,jdbcType=VARCHAR})"
    })
    int insert(DSIProperties record);

    int insertSelective(DSIProperties record);
    
    int updateSelective(DSIProperties record);
    
    public List<DSIProperties> findByGroupName(Map<String, Object> paramsMap);
    
    public List<DSIProperties> findByGroupNames(Map<String, Object> paramsMap);
}