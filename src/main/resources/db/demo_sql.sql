CREATE TABLE `nk_prod_master` (
  `prod_master_id` int(8) NOT NULL AUTO_INCREMENT,
  `MATL_NBR` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `SEASON` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `STYLE_CD` varchar(24) COLLATE utf8_unicode_ci NOT NULL,
  `PROD_ENGN_DESC` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `MATL_LONG_NM` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `COLOR_CD` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `COLOR_DESC` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GBL_CAT_SUM_LONG_DESC` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GBL_CAT_CORE_FOCS_LONG_DESC` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GBL_PROD_SUB_CAT_LONG_DESC` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUB_CAT_DESC` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REG_CAT_LONG_DESC_SLS_ORG` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GNDR_GROUP_NM` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Gender_Details` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KIDS_AGE` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GBL_SILH_LONG_DESC` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GBL_SILH_SHRT_DESC` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TOP_BOTTOM` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REG_MSRP` decimal(8,2) NOT NULL DEFAULT '0.00',
  `MODEL` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BM_CLASSIFICATION` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BM_CLASSIFICATION_DETAIL` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FTW_PLATFORM` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EQP_Product_Type` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REG_3PE_CAT` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OMD` date NOT NULL,
  `SILO` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BRAND_STORY_NM` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CTRY_RETAIL_SIZE_RANGE` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ICON_FRANCHISE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRIMARY_STORY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECONDARY_STORY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEASONAL_STORY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RETAIL_MATL_PRC_ZONE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`prod_master_id`),
  KEY `index_matl_nbr` (`MATL_NBR`),
  KEY `index_omd` (`OMD`),
  KEY `index_season_engn` (`SEASON`,`PROD_ENGN_DESC`)
) ENGINE=InnoDB AUTO_INCREMENT=415329 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci

CREATE TABLE `nk_store_master` (
  `POS_ID` int(16) NOT NULL,
  `ORIGINAL_POS_ID` int(16) DEFAULT NULL,
  `STORE_CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `STORE_STATUS` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `ABBREV_OWNER_GROUP_NAME` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `SUB_TERRITORY` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `LOCAL_STORE_NAME` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `STORE_STORE_NAME` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `STORE_STREET_ADDRESS_1` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `ENGLISH_STORE_STREET_ADDRESS_1` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `TEMPORARY_STORE` int(4) NOT NULL DEFAULT '0',
  `STORE_SUBPARTNER_INDICATOR` int(4) NOT NULL DEFAULT '0',
  `STORE_RECORD_TYPE` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `GLOBAL_STORE_CHANNEL_CLASS` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `STORE_SUB_TYPE` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `CHINA_STORE_SUB_CHANNEL` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `STATE_PROVINCE` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `LOCAL_PROVINCE` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `CITY` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `LOCAL_CITY` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `STORE_CITY_TIER_NUMBER` int(4) NOT NULL DEFAULT '0',
  `LOCAL_SALES_AREA_NAMES` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `SALES_AREA_NAMES` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `CHINA_TRADE_ZONE` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HOTSPOT_CLUSTER` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STORE_HOTSPOT_TIER` int(4) DEFAULT NULL,
  `STORE_ENVIRONMENT_DESCRIPTION` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONSUMER_LED_CONCEPT_STORE` int(4) DEFAULT NULL,
  `MPT_STORE` int(4) DEFAULT NULL,
  `SOLD_TO_NUMBER` int(16) DEFAULT NULL,
  `SHIP_TO_NUMBER` int(16) DEFAULT NULL,
  `CUSTOMER_SOLD_TO` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APPLICATION_REASON` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISTRIBUTION_TYPE` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STORE_FIRST_OPEN_DATE` date DEFAULT NULL,
  `STORE_LAST_OPEN_DATE` date DEFAULT NULL,
  `STORE_LAST_RENOVATION_DATE` date DEFAULT NULL,
  `STORE_CLOSE_DATE` date DEFAULT NULL,
  `CLOSE_REASON_PICKLIST` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STORE_TOTAL_SPACE_SIZE` int(8) DEFAULT NULL,
  `STORE_SELLING_SPACE_SIZE` int(8) DEFAULT NULL,
  `FLOOR_NUMBER` int(4) DEFAULT NULL,
  `TOTAL_STORIES` int(4) DEFAULT NULL,
  `CHINA_STORE_DISTRIBUTION_TIER` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLC_STATUS` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLC_TARGET_DATE` int(16) DEFAULT NULL,
  `REAL_ESTATE_CATEGORY` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CUSTOMER_DISTRIBUTION_TIER` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STORE_TIER` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STORE_LEAD_CATEGORY` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIXTURE_PROGRAM` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LONGITUDE` decimal(12,6) DEFAULT NULL,
  `LATITUDE` decimal(12,6) DEFAULT NULL,
  `INC` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADDRESS_MATCH_TYPE` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TRADE_ZONE` varchar(16) COLLATE utf8_unicode_ci DEFAULT '#N/A',
  PRIMARY KEY (`POS_ID`),
  KEY `index_ab_own_name` (`ABBREV_OWNER_GROUP_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci

CREATE TABLE `nk_quick_strike` (
  `CCD_DT_BUS_SEASN_YR_CD` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `PROD_CD` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  KEY `index_prod_cd` (`PROD_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci

CREATE TABLE `nk_con_adc_pos` (
  `ADC_POS_ID` int(10) NOT NULL,
  `ACCOUNT` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  KEY `index_adc_pos_id` (`ADC_POS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci

CREATE TABLE `nk_sale_info` (
  `SALE_ID` int(12) NOT NULL AUTO_INCREMENT,
  `STORE_POS_ID` int(12) DEFAULT NULL,
  `PROD_CODE` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROD_LONG_NAME` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NET_SALES_UNITS` int(10) DEFAULT NULL,
  `NET_SALES_AMT` int(10) DEFAULT NULL,
  `EXTENDED_MSRP_SALES_AMT` int(10) DEFAULT NULL,
  `REPORT_DATE` date NOT NULL,
  `STORE_PROD_ID` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISCOUNT` decimal(8,4) DEFAULT NULL,
  PRIMARY KEY (`SALE_ID`,`REPORT_DATE`),
  KEY `index_prod_pos` (`PROD_CODE`,`STORE_POS_ID`),
  KEY `INDEX_STORE_PROD_ID` (`STORE_PROD_ID`,`DISCOUNT`)
) ENGINE=InnoDB AUTO_INCREMENT=29684889 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci
/*!50100 PARTITION BY RANGE (to_days(report_date))
(PARTITION p160601 VALUES LESS THAN (736481) ENGINE = InnoDB,
 PARTITION p160701 VALUES LESS THAN (736511) ENGINE = InnoDB,
 PARTITION p160801 VALUES LESS THAN (736542) ENGINE = InnoDB,
 PARTITION p160901 VALUES LESS THAN (736573) ENGINE = InnoDB,
 PARTITION p161001 VALUES LESS THAN (736603) ENGINE = InnoDB,
 PARTITION p161101 VALUES LESS THAN (736634) ENGINE = InnoDB,
 PARTITION p161201 VALUES LESS THAN (736664) ENGINE = InnoDB,
 PARTITION p170101 VALUES LESS THAN (736695) ENGINE = InnoDB,
 PARTITION p170201 VALUES LESS THAN (736726) ENGINE = InnoDB,
 PARTITION p170301 VALUES LESS THAN (736754) ENGINE = InnoDB,
 PARTITION p170401 VALUES LESS THAN (736785) ENGINE = InnoDB,
 PARTITION p170501 VALUES LESS THAN (736815) ENGINE = InnoDB,
 PARTITION p170601 VALUES LESS THAN (736846) ENGINE = InnoDB,
 PARTITION p170701 VALUES LESS THAN (736876) ENGINE = InnoDB,
 PARTITION p170801 VALUES LESS THAN (736907) ENGINE = InnoDB,
 PARTITION p170901 VALUES LESS THAN (736938) ENGINE = InnoDB,
 PARTITION p171001 VALUES LESS THAN (736968) ENGINE = InnoDB,
 PARTITION pnow VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */

/* ALTER TABLE nk_sale_info 
PARTITION BY RANGE(to_days(report_date)) (
    PARTITION p160601 VALUES LESS THAN (to_days('2016-06-01')), 
    PARTITION p160701 VALUES LESS THAN (to_days('2016-07-01')),
    PARTITION p160801 VALUES LESS THAN (to_days('2016-08-01')),
    PARTITION p160901 VALUES LESS THAN (to_days('2016-09-01')),
    PARTITION p161001 VALUES LESS THAN (to_days('2016-10-01')),
    PARTITION p161101 VALUES LESS THAN (to_days('2016-11-01')),
    PARTITION p161201 VALUES LESS THAN (to_days('2016-12-01')),
    PARTITION p170101 VALUES LESS THAN (to_days('2017-01-01')),
    PARTITION p170201 VALUES LESS THAN (to_days('2017-02-01')),
    PARTITION p170301 VALUES LESS THAN (to_days('2017-03-01')),
    PARTITION p170401 VALUES LESS THAN (to_days('2017-04-01')),
    PARTITION p170501 VALUES LESS THAN (to_days('2017-05-01')),
    PARTITION p170601 VALUES LESS THAN (to_days('2017-06-01')),
    PARTITION p170701 VALUES LESS THAN (to_days('2017-07-01')),
    PARTITION p170801 VALUES LESS THAN (to_days('2017-08-01')),
    PARTITION p170901 VALUES LESS THAN (to_days('2017-09-01')),
    PARTITION p171001 VALUES LESS THAN (to_days('2017-10-01')),
    PARTITION pnow VALUES LESS THAN (MAXVALUE)
);
*/

-- (.*),([a-zA-Z0-9]+-\d+),(\d+\/\d+\/\d+)
-- insert into NK_KEY_LAUNCH values\('\1','\2', str_to_date\('\3','%Y/%m/%d'\)\);
-- (.*),([a-zA-Z0-9]+-\d+),(#N\/A)
-- insert into NK_KEY_LAUNCH values\('\1','\2', null\);
CREATE TABLE `nk_key_launch` (
  `SEASON` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `PRODUCT_CODE` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `LAUNCH_DATE` date DEFAULT NULL,
  KEY `index_prod_code` (`PRODUCT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci

CREATE TABLE `nk_clc_door_master` (
  `CLC_DOOR_ID` int(12) NOT NULL AUTO_INCREMENT,
  `CLC_DOOR_CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `STATUS` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `RBP_PROGRESS` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TERRITORY` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NEW_CONCEPT` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GLOBAL_CONCEPT` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROJECT_TYPE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXECUTION_FLOW` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXECUTION_WEEK_SUNDAY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXECUTION_MONTH` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXECUTION_SEASON` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AREA` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROVINCE` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOCAL_CITY` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CITY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CITY_TIER` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CITY_GROUP` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TZ_ID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TZ_NAME` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TZ_GROUP` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TTL_SPACE_AFT_CLC` int(8) DEFAULT NULL,
  `FOH_AFT_CLC` int(8) DEFAULT NULL,
  `BOH_AFT_CLC` int(8) DEFAULT NULL,
  `EXTRA_BOH_AFT_CLC` int(8) DEFAULT NULL,
  `DISTANCE_EXTRA_BOH_TO_STORE_METER` int(8) DEFAULT NULL,
  `POS_ID_OLD` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `POS_ID_NEW_POS` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME_LOCAL` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STORE_NAME_ENGLISH` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STORE_ADDRESS` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCOUNT` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCOUNT_GROUP` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STORE_ENVIRONMENT` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LEAD_CATEGORY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECONDARY_CATEGORY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUPPORTING_CATEGORY` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIRST_ASSORMTNET_SEASON` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ASSORTMENT_TYPE` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ASSORTMENT_REV_CLUSTER` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LEASING_EXPIRING_DATE` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REV_FCST` int(8) DEFAULT NULL,
  `HISTORICAL_MONTHLY_REV` int(8) DEFAULT NULL,
  `FCST_VS_HISTORICAL` decimal(10,0) DEFAULT NULL,
  `TTL_SPACE_BF_CLC` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FOH_BF_CLC` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_BF_CLC` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIXTURE_AF_CLC` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BOC_ATTACK_PVD` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FA17_ORDER_WRITE` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HO17_ORDER_WRITE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STORE_COUNT` int(4) DEFAULT NULL,
  `STORE_COUNT_CHECK` int(4) DEFAULT NULL,
  `FA15` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HO15` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SP16` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SU16` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FA16` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HO16` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SP17` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SU17` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FA17` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HO17` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SP18` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SU18` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIRST_RPO_DATE_OR_FROM_SEP12` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DELAY_DAY` int(8) DEFAULT NULL,
  `CHANGE_COUNTER_FROM_SEP12` decimal(10,0) DEFAULT NULL,
  `LONGITUDE` decimal(10,0) DEFAULT NULL,
  `LATITUDE` decimal(10,0) DEFAULT NULL,
  `ADDRESS_MATCH_TYPE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FY_QUARTER` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUPPORT_RATE` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CHANGE_TYPE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UPDATED_EXECUTION_FLOW` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REASON_DESCRIPTION` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEY_CATEGORIZATION_OF_DELAY_REASONS` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUESTER` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_OF_CHANGE_REQUEST` date DEFAULT NULL,
  `END` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `THIS_WEEK_OPENED` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AE_NAME` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROJECT_FROM` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROJECT_TO` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIRST_CLC_DATE_FOR_MI` date DEFAULT NULL,
  PRIMARY KEY (`CLC_DOOR_ID`),
  KEY `index_pos_id` (`POS_ID_NEW_POS`)
) ENGINE=InnoDB AUTO_INCREMENT=8290 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci

CREATE TABLE `nk_prepared_data` (
  `Store_Prod_Id` varchar(29) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEKNO` bigint(22) DEFAULT NULL,
  `NET_SALES_UNITS` int(10) DEFAULT NULL,
  `Prod_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `COLOR_MAIN` varchar(6) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `GBL_CAT_SUM_LONG_DESC` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Ctgy_Ptfm` varchar(15) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `GNDR_GROUP_NM` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GBL_SILH_LONG_DESC` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REG_MSRP` decimal(8,2) NOT NULL DEFAULT '0.00',
  `PRICE` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT '中',
  `FTW_PLATFORM` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ICON_FRANCHISE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `POS_ID` int(16) NOT NULL,
  `STORE_RECORD_TYPE` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `SUB_TERRITORY` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `STORE_ENVIRONMENT_DESCRIPTION` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SALES_AREA_NAMES` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `STORE_CITY_TIER_NUMBER` int(4) NOT NULL DEFAULT '0',
  `STORE_LEAD_CATEGORY` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ABBREV_OWNER_GROUP_NAME` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trade_zone` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `store_type` varchar(5) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `clc_status` varchar(9) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `quart` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `index_quarter` (`quart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci

CREATE TABLE `nk_dsi_properties` (
  `group_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) DEFAULT '1',
  `alias` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `column_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `column_width` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci

insert into nk_dsi_properties(group_name, name, value, column_name,column_width) values('storeType', '大', '1000', '店铺大小', 15);
insert into nk_dsi_properties(group_name, name, value, column_name,column_width) values('storeType', '小', '0', '店铺大小', 15);
insert into nk_dsi_properties(group_name, name, value, column_name,column_width) values('tradeZone', '大', 'MW', '店铺商圈', 15);
insert into nk_dsi_properties(group_name, name, value, column_name,column_width) values('tradeZone', '中', 'CA,LP', '店铺商圈', 15);
insert into nk_dsi_properties(group_name, name, value, column_name,column_width) values('tradeZone', '小', 'default', '店铺商圈', 15);
insert into nk_dsi_properties(group_name, name, value, column_name,column_width) values('gndrGroupNm', '男', 'MENS', '性别', 15);
insert into nk_dsi_properties(group_name, name, value, column_name,column_width) values('gndrGroupNm', '女', 'WOMENS', '性别', 15);
insert into nk_dsi_properties(group_name, name, value, status, column_name,column_width) values('gndrGroupNm', '儿童', 'KIDS', 0, '性别', 15);
insert into nk_dsi_properties(group_name, name, value, column_name,column_width) values('price', '高', '899', '价格高低', 15);
insert into nk_dsi_properties(group_name, name, value, column_name,column_width) values('price', '低', '600', '价格高低', 15);
insert into nk_dsi_properties(group_name, name, value, column_name,column_width) values('price', '中', 'default', '价格高低', 15);
insert into nk_dsi_properties(group_name, name, value, column_name,column_width) values('colorMain', '黑', 'BLACK', '颜色', 15);
insert into nk_dsi_properties(group_name, name, value, status, column_name,column_width) values('colorMain', '白', 'WHITE', 0, '颜色', 15);
insert into nk_dsi_properties(group_name, name, value, column_name,column_width) values('colorMain', '其它', 'OTHERS', '颜色', 15);
insert into nk_dsi_properties(group_name, name, value, column_name,column_width) values('ctgyPtfm', 'BASKETBALL/JD', 'BASKETBALL/JD', '商品类别', 40);
insert into nk_dsi_properties(group_name, name, value, column_name,column_width) values('ctgyPtfm', 'RUNNING/Non-MAX', 'RUNNING/Non-MAX', '商品类别', 40);
insert into nk_dsi_properties(group_name, name, value, column_name,column_width) values('ctgyPtfm', 'NSW/Non-MAX', 'NSW/Non-MAX', '商品类别', 40);
insert into nk_dsi_properties(group_name, name, value, column_name,column_width) values('ctgyPtfm', 'MAX', 'MAX', '商品类别', 40);
insert into nk_dsi_properties(group_name, name, value, column_name,column_width) values('ctgyPtfm', 'Others', 'Others', '商品类别', 40);
insert into nk_dsi_properties(group_name, name, value, column_name,column_width) values('salesAreaNames', '东北', 'Heiji,Liaoning', '地区', 20);
insert into nk_dsi_properties(group_name, name, value, column_name,column_width) values('salesAreaNames', '华北', 'Huabei,Luyu,Jingjin', '地区', 20);
insert into nk_dsi_properties(group_name, name, value, column_name,column_width) values('salesAreaNames', '西北', 'Xibei', '地区', 20);
insert into nk_dsi_properties(group_name, name, value, column_name,column_width) values('salesAreaNames', '华东', 'JiangsuAnhui,Zhejiang,Shanghai,HunanHubei', '地区', 20);
insert into nk_dsi_properties(group_name, name, value, column_name,column_width) values('salesAreaNames', '华南', 'FujianJiangxi,Guangzhou,Guangdong,GuangxiHainan', '地区', 20);
insert into nk_dsi_properties(group_name, name, value, column_name,column_width) values('salesAreaNames', '西南', 'Chuanyu,Yungui', '地区', 20);
insert into nk_dsi_properties(group_name, name, value, column_name,column_width) values('city', '上海', '上海', '城市', 40);
insert into nk_dsi_properties(group_name, name, value, column_name,column_width) values('city', '浙江', '杭州,宁波,绍兴,嘉兴,台州', '城市', 40);
insert into nk_dsi_properties(group_name, name, value, column_name,column_width) values('city', '北京', '北京', '城市', 40);
insert into nk_dsi_properties(group_name, name, value, column_name,column_width) values('storeRecordType', 'Nike Only Store', 'Nike Only Store', '店铺类型', 40);
insert into nk_dsi_properties(group_name, name, value, column_name,column_width) values('storeRecordType', 'Wholesale / Multi-Brand', 'Wholesale / Multi-Brand', '店铺类型', 40);


