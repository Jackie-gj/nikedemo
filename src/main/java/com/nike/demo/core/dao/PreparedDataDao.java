package com.nike.demo.core.dao;

import com.nike.demo.core.entity.PreparedData;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

@Repository("preparedDataDao")
//@Scope("prototype")
public interface PreparedDataDao {
    @Insert({
        "insert into nk_prepared_data (Store_Prod_Id, WEEKNO, ",
        "NET_SALES_UNITS, Prod_id, ",
        "COLOR_MAIN, GBL_CAT_SUM_LONG_DESC, ",
        "Ctgy_Ptfm, GNDR_GROUP_NM, ",
        "GBL_SILH_LONG_DESC, REG_MSRP, ",
        "FTW_PLATFORM, ICON_FRANCHISE, ",
        "POS_ID, STORE_RECORD_TYPE, ",
        "SUB_TERRITORY, STORE_ENVIRONMENT_DESCRIPTION, ",
        "SALES_AREA_NAMES, STORE_CITY_TIER_NUMBER, ",
        "STORE_LEAD_CATEGORY, ABBREV_OWNER_GROUP_NAME, ",
        "trade_zone, store_type, ",
        "clc_status, quart, prod_engn_desc)",
        "values (#{storeProdId,jdbcType=VARCHAR}, #{weekno,jdbcType=BIGINT}, ",
        "#{netSalesUnits,jdbcType=INTEGER}, #{prodId,jdbcType=VARCHAR}, ",
        "#{colorMain,jdbcType=VARCHAR}, #{gblCatSumLongDesc,jdbcType=VARCHAR}, ",
        "#{ctgyPtfm,jdbcType=VARCHAR}, #{gndrGroupNm,jdbcType=VARCHAR}, ",
        "#{gblSilhLongDesc,jdbcType=VARCHAR}, #{regMsrp,jdbcType=DECIMAL}, ",
        "#{ftwPlatform,jdbcType=VARCHAR}, #{iconFranchise,jdbcType=VARCHAR}, ",
        "#{posId,jdbcType=INTEGER}, #{storeRecordType,jdbcType=VARCHAR}, ",
        "#{subTerritory,jdbcType=VARCHAR}, #{storeEnvironmentDescription,jdbcType=VARCHAR}, ",
        "#{salesAreaNames,jdbcType=VARCHAR}, #{storeCityTierNumber,jdbcType=INTEGER}, ",
        "#{storeLeadCategory,jdbcType=VARCHAR}, #{abbrevOwnerGroupName,jdbcType=VARCHAR}, ",
        "#{tradeZone,jdbcType=VARCHAR}, #{storeType,jdbcType=VARCHAR}, ",
        "#{clcStatus,jdbcType=VARCHAR}, #{quart,jdbcType=VARCHAR}, #{prodType,jdbcType=VARCHAR})"
    })
    int insert(PreparedData record);

    int insertSelective(PreparedData record);
    
    List<PreparedData> findByQuart(Map<String, String> paramMap);
    
    List<PreparedData> findByQuarts(List<String> quarts);
}