package com.nike.demo.core.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.nike.demo.core.entity.SaleInfo;

@Repository
public interface SaleInfoDao {
    @Delete({
        "delete from nk_sale_info",
        "where SALE_ID = #{saleId,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer saleId);

    @Insert({
        "insert into nk_sale_info (SALE_ID, STORE_POS_ID, ",
        "PROD_CODE, PROD_LONG_NAME, ",
        "NET_SALES_UNITS, NET_SALES_AMT, ",
        "EXTENDED_MSRP_SALES_AMT, REPORT_DATE)",
        "values (#{saleId,jdbcType=INTEGER}, #{storePosId,jdbcType=INTEGER}, ",
        "#{prodCode,jdbcType=VARCHAR}, #{prodLongName,jdbcType=VARCHAR}, ",
        "#{netSalesUnits,jdbcType=INTEGER}, #{netSalesAmt,jdbcType=VARCHAR}, ",
        "#{extendedMsrpSalesAmt,jdbcType=VARCHAR}, #{reportDate,jdbcType=DATE})"
    })
    int insert(SaleInfo record);

    int insertSelective(SaleInfo record);

    SaleInfo selectByPrimaryKey(Integer saleId);

    int updateByPrimaryKeySelective(SaleInfo record);

    @Update({
        "update nk_sale_info",
        "set STORE_POS_ID = #{storePosId,jdbcType=INTEGER},",
          "PROD_CODE = #{prodCode,jdbcType=VARCHAR},",
          "PROD_LONG_NAME = #{prodLongName,jdbcType=VARCHAR},",
          "NET_SALES_UNITS = #{netSalesUnits,jdbcType=INTEGER},",
          "NET_SALES_AMT = #{netSalesAmt,jdbcType=VARCHAR},",
          "EXTENDED_MSRP_SALES_AMT = #{extendedMsrpSalesAmt,jdbcType=VARCHAR},",
          "REPORT_DATE = #{reportDate,jdbcType=DATE}",
        "where SALE_ID = #{saleId,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(SaleInfo record);
    
	public List<SaleInfo> findData(Map<String, Object> map);

	public Long getTotalCount(Map<String, Object> map);

	public void deleteAll();
}