package com.nike.demo.core.dao;

import com.nike.demo.core.entity.PropImportance;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Repository;

@Repository
public interface PropImportanceDao {
    @Insert({
        "insert into nk_prop_importance (property, importance)",
        "values (#{property,jdbcType=VARCHAR}, #{importance,jdbcType=DECIMAL})"
    })
    int insert(PropImportance record);

    int insertSelective(PropImportance record);
    
    List<PropImportance> listAll();
}