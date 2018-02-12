package com.nike.demo.core.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.nike.demo.core.entity.CLCDoorMaster;

@Repository
public interface CLCDoorMasterDao {
    @Delete({
        "delete from nk_clc_door_master",
        "where CLC_DOOR_ID = #{clcDoorId,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(String clcDoorId);

    @Insert({
        "insert into nk_clc_door_master (CLC_DOOR_CODE, STATUS, ",
        "RBP_PROGRESS, TERRITORY, ",
        "NEW_CONCEPT, GLOBAL_CONCEPT, ",
        "PROJECT_TYPE, EXECUTION_FLOW, ",
        "EXECUTION_WEEK_SUNDAY, EXECUTION_MONTH, ",
        "EXECUTION_SEASON, AREA, ",
        "PROVINCE, LOCAL_CITY, ",
        "CITY, CITY_TIER, ",
        "CITY_GROUP, TZ_ID, ",
        "TZ_NAME, TZ_GROUP, ",
        "TTL_SPACE_AFT_CLC, FOH_AFT_CLC, ",
        "BOH_AFT_CLC, EXTRA_BOH_AFT_CLC, ",
        "DISTANCE_EXTRA_BOH_TO_STORE_METER, POS_ID_OLD, ",
        "POS_ID_NEW_POS, NAME_LOCAL, ",
        "STORE_NAME_ENGLISH, STORE_ADDRESS, ",
        "ACCOUNT, ACCOUNT_GROUP, ",
        "STORE_ENVIRONMENT, LEAD_CATEGORY, ",
        "SECONDARY_CATEGORY, SUPPORTING_CATEGORY, ",
        "FIRST_ASSORMTNET_SEASON, ASSORTMENT_TYPE, ",
        "ASSORTMENT_REV_CLUSTER, LEASING_EXPIRING_DATE, ",
        "REV_FCST, HISTORICAL_MONTHLY_REV, ",
        "FCST_VS_HISTORICAL, TTL_SPACE_BF_CLC, ",
        "FOH_BF_CLC, FORMAT_BF_CLC, ",
        "FIXTURE_AF_CLC, BOC_ATTACK_PVD, ",
        "FA17_ORDER_WRITE, HO17_ORDER_WRITE, ",
        "STORE_COUNT, STORE_COUNT_CHECK, ",
        "FA15, HO15, SP16, ",
        "SU16, FA16, HO16, ",
        "SP17, SU17, FA17, ",
        "HO17, SP18, SU18, ",
        "FIRST_RPO_DATE_OR_FROM_SEP12, DELAY_DAY, ",
        "CHANGE_COUNTER_FROM_SEP12, LONGITUDE, ",
        "LATITUDE, ADDRESS_MATCH_TYPE, ",
        "FY_QUARTER, SUPPORT_RATE, ",
        "CHANGE_TYPE, UPDATED_EXECUTION_FLOW, ",
        "REASON_DESCRIPTION, KEY_CATEGORIZATION_OF_DELAY_REASONS, ",
        "REQUESTER, DATE_OF_CHANGE_REQUEST, ",
        "END, THIS_WEEK_OPENED, ",
        "FORMAT, AE_NAME, ",
        "PROJECT_FROM, PROJECT_TO, ",
        "FIRST_CLC_DATE_FOR_MI)",
        "values (#{clcDoorCode,jdbcType=VARCHAR}, #{status,jdbcType=VARCHAR}, ",
        "#{rbpProgress,jdbcType=VARCHAR}, #{territory,jdbcType=VARCHAR}, ",
        "#{newConcept,jdbcType=VARCHAR}, #{globalConcept,jdbcType=VARCHAR}, ",
        "#{projectType,jdbcType=VARCHAR}, #{executionFlow,jdbcType=VARCHAR}, ",
        "#{executionWeekSunday,jdbcType=VARCHAR}, #{executionMonth,jdbcType=VARCHAR}, ",
        "#{executionSeason,jdbcType=VARCHAR}, #{area,jdbcType=VARCHAR}, ",
        "#{province,jdbcType=VARCHAR}, #{localCity,jdbcType=VARCHAR}, ",
        "#{city,jdbcType=VARCHAR}, #{cityTier,jdbcType=VARCHAR}, ",
        "#{cityGroup,jdbcType=VARCHAR}, #{tzId,jdbcType=VARCHAR}, ",
        "#{tzName,jdbcType=VARCHAR}, #{tzGroup,jdbcType=VARCHAR}, ",
        "#{ttlSpaceAftClc,jdbcType=INTEGER}, #{fohAftClc,jdbcType=INTEGER}, ",
        "#{bohAftClc,jdbcType=INTEGER}, #{extraBohAftClc,jdbcType=INTEGER}, ",
        "#{distanceExtraBohToStoreMeter,jdbcType=INTEGER}, #{posIdOld,jdbcType=VARCHAR}, ",
        "#{posIdNewPos,jdbcType=VARCHAR}, #{nameLocal,jdbcType=VARCHAR}, ",
        "#{storeNameEnglish,jdbcType=VARCHAR}, #{storeAddress,jdbcType=VARCHAR}, ",
        "#{account,jdbcType=VARCHAR}, #{accountGroup,jdbcType=VARCHAR}, ",
        "#{storeEnvironment,jdbcType=VARCHAR}, #{leadCategory,jdbcType=VARCHAR}, ",
        "#{secondaryCategory,jdbcType=VARCHAR}, #{supportingCategory,jdbcType=VARCHAR}, ",
        "#{firstAssormtnetSeason,jdbcType=VARCHAR}, #{assortmentType,jdbcType=VARCHAR}, ",
        "#{assortmentRevCluster,jdbcType=VARCHAR}, #{leasingExpiringDate,jdbcType=VARCHAR}, ",
        "#{revFcst,jdbcType=INTEGER}, #{historicalMonthlyRev,jdbcType=INTEGER}, ",
        "#{fcstVsHistorical,jdbcType=DECIMAL}, #{ttlSpaceBfClc,jdbcType=VARCHAR}, ",
        "#{fohBfClc,jdbcType=VARCHAR}, #{formatBfClc,jdbcType=VARCHAR}, ",
        "#{fixtureAfClc,jdbcType=VARCHAR}, #{bocAttackPvd,jdbcType=VARCHAR}, ",
        "#{fa17OrderWrite,jdbcType=VARCHAR}, #{ho17OrderWrite,jdbcType=VARCHAR}, ",
        "#{storeCount,jdbcType=INTEGER}, #{storeCountCheck,jdbcType=INTEGER}, ",
        "#{fa15,jdbcType=VARCHAR}, #{ho15,jdbcType=VARCHAR}, #{sp16,jdbcType=VARCHAR}, ",
        "#{su16,jdbcType=VARCHAR}, #{fa16,jdbcType=VARCHAR}, #{ho16,jdbcType=VARCHAR}, ",
        "#{sp17,jdbcType=VARCHAR}, #{su17,jdbcType=VARCHAR}, #{fa17,jdbcType=VARCHAR}, ",
        "#{ho17,jdbcType=VARCHAR}, #{sp18,jdbcType=VARCHAR}, #{su18,jdbcType=VARCHAR}, ",
        "#{firstRpoDateOrFromSep12,jdbcType=VARCHAR}, #{delayDay,jdbcType=INTEGER}, ",
        "#{changeCounterFromSep12,jdbcType=DECIMAL}, #{longitude,jdbcType=DECIMAL}, ",
        "#{latitude,jdbcType=DECIMAL}, #{addressMatchType,jdbcType=VARCHAR}, ",
        "#{fyQuarter,jdbcType=VARCHAR}, #{supportRate,jdbcType=VARCHAR}, ",
        "#{changeType,jdbcType=VARCHAR}, #{updatedExecutionFlow,jdbcType=VARCHAR}, ",
        "#{reasonDescription,jdbcType=VARCHAR}, #{keyCategorizationOfDelayReasons,jdbcType=VARCHAR}, ",
        "#{requester,jdbcType=VARCHAR}, #{dateOfChangeRequest,jdbcType=DATE}, ",
        "#{end,jdbcType=VARCHAR}, #{thisWeekOpened,jdbcType=VARCHAR}, ",
        "#{format,jdbcType=VARCHAR}, #{aeName,jdbcType=VARCHAR}, ",
        "#{projectFrom,jdbcType=VARCHAR}, #{projectTo,jdbcType=VARCHAR}, ",
        "#{firstClcDateForMi,jdbcType=DATE})"
    })
    int insert(CLCDoorMaster record);

    int insertSelective(CLCDoorMaster record);

    CLCDoorMaster selectByPrimaryKey(String clcDoorId);

    int updateByPrimaryKeySelective(CLCDoorMaster record);

    @Update({
        "update nk_clc_door_master",
        "set STATUS = #{status,jdbcType=VARCHAR},",
          "RBP_PROGRESS = #{rbpProgress,jdbcType=VARCHAR},",
          "TERRITORY = #{territory,jdbcType=VARCHAR},",
          "NEW_CONCEPT = #{newConcept,jdbcType=VARCHAR},",
          "GLOBAL_CONCEPT = #{globalConcept,jdbcType=VARCHAR},",
          "PROJECT_TYPE = #{projectType,jdbcType=VARCHAR},",
          "EXECUTION_FLOW = #{executionFlow,jdbcType=VARCHAR},",
          "EXECUTION_WEEK_SUNDAY = #{executionWeekSunday,jdbcType=VARCHAR},",
          "EXECUTION_MONTH = #{executionMonth,jdbcType=VARCHAR},",
          "EXECUTION_SEASON = #{executionSeason,jdbcType=VARCHAR},",
          "AREA = #{area,jdbcType=VARCHAR},",
          "PROVINCE = #{province,jdbcType=VARCHAR},",
          "LOCAL_CITY = #{localCity,jdbcType=VARCHAR},",
          "CITY = #{city,jdbcType=VARCHAR},",
          "CITY_TIER = #{cityTier,jdbcType=VARCHAR},",
          "CITY_GROUP = #{cityGroup,jdbcType=VARCHAR},",
          "TZ_ID = #{tzId,jdbcType=VARCHAR},",
          "TZ_NAME = #{tzName,jdbcType=VARCHAR},",
          "TZ_GROUP = #{tzGroup,jdbcType=VARCHAR},",
          "TTL_SPACE_AFT_CLC = #{ttlSpaceAftClc,jdbcType=INTEGER},",
          "FOH_AFT_CLC = #{fohAftClc,jdbcType=INTEGER},",
          "BOH_AFT_CLC = #{bohAftClc,jdbcType=INTEGER},",
          "EXTRA_BOH_AFT_CLC = #{extraBohAftClc,jdbcType=INTEGER},",
          "DISTANCE_EXTRA_BOH_TO_STORE_METER = #{distanceExtraBohToStoreMeter,jdbcType=INTEGER},",
          "POS_ID_OLD = #{posIdOld,jdbcType=VARCHAR},",
          "POS_ID_NEW_POS = #{posIdNewPos,jdbcType=VARCHAR},",
          "NAME_LOCAL = #{nameLocal,jdbcType=VARCHAR},",
          "STORE_NAME_ENGLISH = #{storeNameEnglish,jdbcType=VARCHAR},",
          "STORE_ADDRESS = #{storeAddress,jdbcType=VARCHAR},",
          "ACCOUNT = #{account,jdbcType=VARCHAR},",
          "ACCOUNT_GROUP = #{accountGroup,jdbcType=VARCHAR},",
          "STORE_ENVIRONMENT = #{storeEnvironment,jdbcType=VARCHAR},",
          "LEAD_CATEGORY = #{leadCategory,jdbcType=VARCHAR},",
          "SECONDARY_CATEGORY = #{secondaryCategory,jdbcType=VARCHAR},",
          "SUPPORTING_CATEGORY = #{supportingCategory,jdbcType=VARCHAR},",
          "FIRST_ASSORMTNET_SEASON = #{firstAssormtnetSeason,jdbcType=VARCHAR},",
          "ASSORTMENT_TYPE = #{assortmentType,jdbcType=VARCHAR},",
          "ASSORTMENT_REV_CLUSTER = #{assortmentRevCluster,jdbcType=VARCHAR},",
          "LEASING_EXPIRING_DATE = #{leasingExpiringDate,jdbcType=VARCHAR},",
          "REV_FCST = #{revFcst,jdbcType=INTEGER},",
          "HISTORICAL_MONTHLY_REV = #{historicalMonthlyRev,jdbcType=INTEGER},",
          "FCST_VS_HISTORICAL = #{fcstVsHistorical,jdbcType=DECIMAL},",
          "TTL_SPACE_BF_CLC = #{ttlSpaceBfClc,jdbcType=VARCHAR},",
          "FOH_BF_CLC = #{fohBfClc,jdbcType=VARCHAR},",
          "FORMAT_BF_CLC = #{formatBfClc,jdbcType=VARCHAR},",
          "FIXTURE_AF_CLC = #{fixtureAfClc,jdbcType=VARCHAR},",
          "BOC_ATTACK_PVD = #{bocAttackPvd,jdbcType=VARCHAR},",
          "FA17_ORDER_WRITE = #{fa17OrderWrite,jdbcType=VARCHAR},",
          "HO17_ORDER_WRITE = #{ho17OrderWrite,jdbcType=VARCHAR},",
          "STORE_COUNT = #{storeCount,jdbcType=INTEGER},",
          "STORE_COUNT_CHECK = #{storeCountCheck,jdbcType=INTEGER},",
          "FA15 = #{fa15,jdbcType=VARCHAR},",
          "HO15 = #{ho15,jdbcType=VARCHAR},",
          "SP16 = #{sp16,jdbcType=VARCHAR},",
          "SU16 = #{su16,jdbcType=VARCHAR},",
          "FA16 = #{fa16,jdbcType=VARCHAR},",
          "HO16 = #{ho16,jdbcType=VARCHAR},",
          "SP17 = #{sp17,jdbcType=VARCHAR},",
          "SU17 = #{su17,jdbcType=VARCHAR},",
          "FA17 = #{fa17,jdbcType=VARCHAR},",
          "HO17 = #{ho17,jdbcType=VARCHAR},",
          "SP18 = #{sp18,jdbcType=VARCHAR},",
          "SU18 = #{su18,jdbcType=VARCHAR},",
          "FIRST_RPO_DATE_OR_FROM_SEP12 = #{firstRpoDateOrFromSep12,jdbcType=VARCHAR},",
          "DELAY_DAY = #{delayDay,jdbcType=INTEGER},",
          "CHANGE_COUNTER_FROM_SEP12 = #{changeCounterFromSep12,jdbcType=DECIMAL},",
          "LONGITUDE = #{longitude,jdbcType=DECIMAL},",
          "LATITUDE = #{latitude,jdbcType=DECIMAL},",
          "ADDRESS_MATCH_TYPE = #{addressMatchType,jdbcType=VARCHAR},",
          "FY_QUARTER = #{fyQuarter,jdbcType=VARCHAR},",
          "SUPPORT_RATE = #{supportRate,jdbcType=VARCHAR},",
          "CHANGE_TYPE = #{changeType,jdbcType=VARCHAR},",
          "UPDATED_EXECUTION_FLOW = #{updatedExecutionFlow,jdbcType=VARCHAR},",
          "REASON_DESCRIPTION = #{reasonDescription,jdbcType=VARCHAR},",
          "KEY_CATEGORIZATION_OF_DELAY_REASONS = #{keyCategorizationOfDelayReasons,jdbcType=VARCHAR},",
          "REQUESTER = #{requester,jdbcType=VARCHAR},",
          "DATE_OF_CHANGE_REQUEST = #{dateOfChangeRequest,jdbcType=DATE},",
          "END = #{end,jdbcType=VARCHAR},",
          "THIS_WEEK_OPENED = #{thisWeekOpened,jdbcType=VARCHAR},",
          "FORMAT = #{format,jdbcType=VARCHAR},",
          "AE_NAME = #{aeName,jdbcType=VARCHAR},",
          "PROJECT_FROM = #{projectFrom,jdbcType=VARCHAR},",
          "PROJECT_TO = #{projectTo,jdbcType=VARCHAR},",
          "FIRST_CLC_DATE_FOR_MI = #{firstClcDateForMi,jdbcType=DATE}",
        "where CLC_DOOR_ID = #{clcDoorId,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(CLCDoorMaster record);
    
	public List<CLCDoorMaster> findData(Map<String, Object> map);

	public Long getTotalCount(Map<String, Object> map);

	public void deleteAll();
}