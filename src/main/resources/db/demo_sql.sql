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
  PRIMARY KEY (`prod_master_id`)
) ENGINE=InnoDB AUTO_INCREMENT=415329 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  PRIMARY KEY (`SALE_ID`,`REPORT_DATE`),
  KEY `index_report_date` (`REPORT_DATE`)
) ENGINE=InnoDB AUTO_INCREMENT=11819549 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci
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
  `FIRST_CLC_DATE_FOR_MI` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci

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












/* ************************************* */

SELECT 
    Store_Prod_Id, SUM(WeeklySales), COUNT(Store_Prod_Id)
FROM
    (SELECT 
        CONCAT(si.STORE_POS_ID, '_', si.PROD_CODE) Store_Prod_Id,
            TIMESTAMPDIFF(WEEK, DATE '2017-06-11', si.REPORT_DATE) + 1 weekno1,
            si.STORE_POS_ID,
            si.PROD_CODE,
            si.NET_SALES_UNITS WeeklySales,
            si.NET_SALES_AMT / si.EXTENDED_MSRP_SALES_AMT discount
    FROM
        nk_sale_info si, (SELECT 
        pm.MATL_NBR, pm.PROD_ENGN_DESC, pm.season, pm.omd
    FROM
        nike.nk_prod_master pm
    WHERE
        pm.season = 'FA2017'
            AND pm.PROD_ENGN_DESC = 'FTW'
            AND pm.omd < DATE '2017-07-10'
            AND NOT EXISTS( SELECT 
                1
            FROM
                nk_quick_strike qs
            WHERE
                pm.MATL_NBR = qs.PROD_CD
                    AND qs.CCD_DT_BUS_SEASN_YR_CD = 'FA2017')) vpm, (SELECT 
        sm.POS_ID,
            sm.STORE_SUB_TYPE,
            sm.ABBREV_OWNER_GROUP_NAME,
            sm.CHINA_STORE_SUB_CHANNEL
    FROM
        nk_store_master sm
    WHERE
        LOWER(sm.STORE_SUB_TYPE) = 'wholesale'
            AND sm.CHINA_STORE_SUB_CHANNEL IS NOT NULL
            AND sm.ABBREV_OWNER_GROUP_NAME IS NOT NULL
            AND LOWER(sm.CHINA_STORE_SUB_CHANNEL) NOT IN ('clearance' , 'factory store')
            AND LOWER(sm.ABBREV_OWNER_GROUP_NAME) IN ('belle' , 'topsports', 'pousheng', 'really', 'goodbaby', 'faya', 'sanse', 'highwave sports')
            AND NOT EXISTS( SELECT 
                1
            FROM
                nk_con_adc_pos cap
            WHERE
                cap.ADC_POS_ID = sm.POS_ID)) vsm
    WHERE
        si.report_date >= DATE '2017-06-11'
            AND si.REPORT_DATE <= DATE_ADD(DATE '2017-06-11', INTERVAL 12 WEEK)
            AND si.NET_SALES_UNITS > 0
            AND si.STORE_POS_ID IS NOT NULL
            AND si.store_pos_id = vsm.POS_ID
            AND si.PROD_CODE = vpm.MATL_NBR) vdata
        LEFT JOIN
    (SELECT 
        kl.PRODUCT_CODE,
            TIMESTAMPDIFF(WEEK, '2017-06-11', kl.LAUNCH_DATE) + 1 weekno2
    FROM
        nk_key_launch kl
    WHERE
        kl.LAUNCH_DATE IS NOT NULL
            AND kl.SEASON = 'FA17') vkl ON vdata.PROD_CODE = vkl.PRODUCT_CODE
WHERE
    discount >= 0.7
        AND (weekno2 IS NULL OR weekno1 > weekno2)
GROUP BY Store_Prod_Id
HAVING COUNT(Store_Prod_Id) >= 8
    AND SUM(WeeklySales) > 0;
	
	
SELECT 
    CONCAT(si.STORE_POS_ID, '_', si.PROD_CODE) Store_Prod_Id,
    -- TIMESTAMPDIFF(WEEK, DATE '2017-06-11', si.REPORT_DATE) + 1 WEEKNO,
    si.STORE_POS_ID,
    si.NET_SALES_UNITS,
    vpm.*,
    vsm.*,
    vst.store_type,
    /* ifnull((SELECT 
		IF(cdm.GLOBAL_CONCEPT IN ('BEACON-L2 EXTENDED' , 'BEACON-L2',
				'Running Amplified',
				'NIKE RUNNING-L1',
				'NIKE RUNNING-L2',
				'KICKS LOUNGE-L1',
				'KICKS LOUNGE-L2'),
			'Key_CLC',
			'Other_CLC') type
	FROM
		nk_clc_door_master cdm
	WHERE
		UPPER(cdm.STATUS) = 'OPENED'
        and cdm.POS_ID_NEW_POS = si.STORE_POS_ID
        limit 1), 'Non-CLC') clc_status, */
    'FA17' QUART
FROM
    nk_sale_info si,
        
    (SELECT 
        pm.MATL_NBR Prod_id,
            IF(SUBSTRING_INDEX(pm.color_desc, '/', 1) IN ('BLCK' , 'BLK'), 'BLACK', IF(SUBSTRING_INDEX(pm.color_desc, '/', 1) IN ('WHT' , 'SUMMIT WHITE'), 'WHITE', 'Others')) COLOR_MAIN,
            pm.GBL_CAT_SUM_LONG_DESC,
            if (pm.GBL_CAT_SUM_LONG_DESC = 'BASKETBALL' or pm.GBL_CAT_CORE_FOCS_LONG_DESC = 'JORDAN BRAND', 'BASKETBALL/JD',
			if (pm.GBL_CAT_SUM_LONG_DESC = 'RUNNING', 'RUNNING/Non-MAX', 
			if (pm.GBL_CAT_SUM_LONG_DESC = 'NIKE SPORTSWEAR', 'NSW/Non-MAX',
			if (pm.FTW_PLATFORM = 'MAX', 'MAX', 'Others')))) Ctgy_Ptfm,
            pm.GNDR_GROUP_NM,
            pm.GBL_SILH_LONG_DESC,
            pm.REG_MSRP,
            pm.FTW_PLATFORM,
            pm.ICON_FRANCHISE
    FROM
        nike.nk_prod_master pm
    WHERE
        pm.season = 'FA2017'
            AND pm.PROD_ENGN_DESC = 'FTW'
            AND pm.omd < DATE '2017-07-10'
			and pm.GNDR_GROUP_NM in ('MENS', 'WOMENS', 'KIDS')
            AND NOT EXISTS( SELECT 
                1
            FROM
                nk_quick_strike qs
            WHERE
                pm.MATL_NBR = qs.PROD_CD
                    AND qs.CCD_DT_BUS_SEASN_YR_CD = 'FA2017')) vpm,
    (SELECT 
        sm.POS_ID,
            sm.STORE_RECORD_TYPE,
            sm.SUB_TERRITORY,
            sm.STORE_SUB_TYPE,
            sm.STORE_ENVIRONMENT_DESCRIPTION,
            sm.SALES_AREA_NAMES,
            sm.STORE_CITY_TIER_NUMBER,
            sm.STATE_PROVINCE,
            sm.CITY,
            sm.CHINA_STORE_SUB_CHANNEL,
            sm.STORE_LEAD_CATEGORY,
            if (lower(sm.ABBREV_OWNER_GROUP_NAME) = 'topsports', 'BELLE', upper(sm.ABBREV_OWNER_GROUP_NAME)) ABBREV_OWNER_GROUP_NAME
    FROM
        nk_store_master sm
    WHERE
        LOWER(sm.STORE_SUB_TYPE) = 'wholesale'
            AND sm.CHINA_STORE_SUB_CHANNEL IS NOT NULL
            AND sm.ABBREV_OWNER_GROUP_NAME IS NOT NULL
            AND LOWER(sm.CHINA_STORE_SUB_CHANNEL) NOT IN ('clearance' , 'factory store')
            AND LOWER(sm.ABBREV_OWNER_GROUP_NAME) IN ('belle' , 'topsports', 'pousheng', 'really', 'goodbaby', 'faya', 'sanse', 'highwave sports')
            AND NOT EXISTS( SELECT 
                1
            FROM
                nk_con_adc_pos cap
            WHERE
                cap.ADC_POS_ID = sm.POS_ID)) vsm,
                (SELECT 
					sii.STORE_POS_ID,
					IF(SUM(sii.NET_SALES_UNITS) > 1000,
						'Large',
						'Small') store_type
				FROM
					nk_sale_info sii
				GROUP BY sii.STORE_POS_ID) vst
WHERE
    si.report_date >= DATE '2017-06-11'
        AND si.REPORT_DATE <= DATE_ADD(DATE '2017-06-11',
        INTERVAL 12 WEEK)
        AND IFNULL(si.NET_SALES_UNITS, 0) > 0
        AND si.STORE_POS_ID IS NOT NULL
        AND si.store_pos_id = vsm.POS_ID
        AND si.PROD_CODE = vpm.Prod_id
        AND si.NET_SALES_AMT / si.EXTENDED_MSRP_SALES_AMT > 0.7
        and vst.STORE_POS_ID = si.store_pos_id
		and not exists (
		SELECT 1
    FROM
        nk_key_launch kl
    WHERE
        kl.LAUNCH_DATE IS NOT NULL
            AND kl.SEASON = 'FA17'
			and kl.PRODUCT_CODE = si.PROD_CODE
			and kl.LAUNCH_DATE > si.REPORT_DATE);

SELECT 
    CONCAT(si.STORE_POS_ID, '_', si.PROD_CODE) Store_Prod_Id,
    TIMESTAMPDIFF(WEEK,
        DATE '2017-06-11',
        si.REPORT_DATE) + 1 WEEKNO,
    si.STORE_POS_ID,
    si.NET_SALES_UNITS,
    vpm.*,
    vsm.*,
    vst.store_type,
    'FA17' QUART
FROM
    nk_sale_info si,
    (SELECT 
        pm.MATL_NBR Prod_id,
            IF(SUBSTRING_INDEX(pm.color_desc, '/', 1) IN ('BLCK' , 'BLK'), 'BLACK', IF(SUBSTRING_INDEX(pm.color_desc, '/', 1) IN ('WHT' , 'SUMMIT WHITE'), 'WHITE', 'Others')) COLOR_MAIN,
            pm.GBL_CAT_SUM_LONG_DESC,
            IF(pm.GBL_CAT_SUM_LONG_DESC = 'BASKETBALL'
                OR pm.GBL_CAT_CORE_FOCS_LONG_DESC = 'JORDAN BRAND', 'BASKETBALL/JD', IF(pm.GBL_CAT_SUM_LONG_DESC = 'RUNNING', 'RUNNING/Non-MAX', IF(pm.GBL_CAT_SUM_LONG_DESC = 'NIKE SPORTSWEAR', 'NSW/Non-MAX', IF(pm.FTW_PLATFORM = 'MAX', 'MAX', 'Others')))) Ctgy_Ptfm,
            pm.GNDR_GROUP_NM,
            pm.GBL_SILH_LONG_DESC,
            pm.REG_MSRP,
            pm.FTW_PLATFORM,
            pm.ICON_FRANCHISE
    FROM
        nike.nk_prod_master pm
    WHERE
        pm.season = 'FA2017'
            AND pm.PROD_ENGN_DESC = 'FTW'
            AND pm.omd < DATE '2017-07-10'
            AND pm.GNDR_GROUP_NM IN ('MENS' , 'WOMENS', 'KIDS')
            AND NOT EXISTS( SELECT 
                1
            FROM
                nk_quick_strike qs
            WHERE
                pm.MATL_NBR = qs.PROD_CD
                    AND qs.CCD_DT_BUS_SEASN_YR_CD = 'FA2017')) vpm,
    (SELECT 
        sm.POS_ID,
            sm.STORE_RECORD_TYPE,
            sm.SUB_TERRITORY,
            sm.STORE_ENVIRONMENT_DESCRIPTION,
            sm.SALES_AREA_NAMES,
            sm.STORE_CITY_TIER_NUMBER,
            sm.STORE_LEAD_CATEGORY,
            IF(LOWER(sm.ABBREV_OWNER_GROUP_NAME) = 'topsports', 'BELLE', UPPER(sm.ABBREV_OWNER_GROUP_NAME)) ABBREV_OWNER_GROUP_NAME
    FROM
        nk_store_master sm
    WHERE
        LOWER(sm.STORE_SUB_TYPE) = 'wholesale'
            AND sm.CHINA_STORE_SUB_CHANNEL IS NOT NULL
            AND sm.ABBREV_OWNER_GROUP_NAME IS NOT NULL
            AND LOWER(sm.CHINA_STORE_SUB_CHANNEL) NOT IN ('clearance' , 'factory store')
            AND LOWER(sm.ABBREV_OWNER_GROUP_NAME) IN ('belle' , 'topsports', 'pousheng', 'really', 'goodbaby', 'faya', 'sanse', 'highwave sports')
            AND NOT EXISTS( SELECT 
                1
            FROM
                nk_con_adc_pos cap
            WHERE
                cap.ADC_POS_ID = sm.POS_ID)) vsm,
    (SELECT 
        sii.STORE_POS_ID,
            IF(SUM(sii.NET_SALES_UNITS) > 1000, 'Large', 'Small') store_type
    FROM
        nk_sale_info sii
    GROUP BY sii.STORE_POS_ID) vst
WHERE
    si.report_date >= DATE '2017-06-11'
        AND si.REPORT_DATE <= DATE_ADD(DATE '2017-06-11',
        INTERVAL 12 WEEK)
        AND IFNULL(si.NET_SALES_UNITS, 0) > 0
        AND si.STORE_POS_ID IS NOT NULL
        AND si.store_pos_id = vsm.POS_ID
        AND si.PROD_CODE = vpm.Prod_id
        AND si.NET_SALES_AMT / si.EXTENDED_MSRP_SALES_AMT > 0.7
        AND vst.STORE_POS_ID = si.store_pos_id
        AND NOT EXISTS( SELECT 
            1
        FROM
            nk_key_launch kl
        WHERE
            kl.LAUNCH_DATE IS NOT NULL
                AND kl.SEASON = 'FA17'
                AND kl.PRODUCT_CODE = si.PROD_CODE
                AND kl.LAUNCH_DATE > si.REPORT_DATE);