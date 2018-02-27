-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: nike
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `nk_clc_door_master`
--

DROP TABLE IF EXISTS `nk_clc_door_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8290 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nk_con_adc_pos`
--

DROP TABLE IF EXISTS `nk_con_adc_pos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nk_con_adc_pos` (
  `ADC_POS_ID` int(10) NOT NULL,
  `ACCOUNT` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  KEY `index_adc_pos_id` (`ADC_POS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nk_dsi_properties`
--

DROP TABLE IF EXISTS `nk_dsi_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nk_dsi_properties` (
  `group_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) DEFAULT '1',
  `alias` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `column_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `column_width` int(4) DEFAULT NULL,
  `prod_engn_desc` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'FTW'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nk_key_launch`
--

DROP TABLE IF EXISTS `nk_key_launch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nk_key_launch` (
  `SEASON` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `PRODUCT_CODE` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `LAUNCH_DATE` date DEFAULT NULL,
  KEY `index_prod_code` (`PRODUCT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nk_prepared_data`
--

DROP TABLE IF EXISTS `nk_prepared_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nk_prepared_data` (
  `Store_Prod_Id` varchar(29) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEKNO` bigint(22) DEFAULT NULL,
  `NET_SALES_UNITS` int(10) DEFAULT NULL,
  `Prod_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `COLOR_MAIN` varchar(6) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `GBL_CAT_SUM_LONG_DESC` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Ctgy_Ptfm` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
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
  `prod_engn_desc` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `index_quarter` (`quart`),
  KEY `index_prod_quarter` (`quart`,`prod_engn_desc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nk_prod_master`
--

DROP TABLE IF EXISTS `nk_prod_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=415329 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nk_quick_strike`
--

DROP TABLE IF EXISTS `nk_quick_strike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nk_quick_strike` (
  `CCD_DT_BUS_SEASN_YR_CD` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `PROD_CD` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  KEY `index_prod_cd` (`PROD_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nk_sale_info`
--

DROP TABLE IF EXISTS `nk_sale_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
 PARTITION pnow VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nk_store_master`
--

DROP TABLE IF EXISTS `nk_store_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nk_user`
--

DROP TABLE IF EXISTS `nk_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nk_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_name` varchar(100) NOT NULL DEFAULT '' COMMENT '登录名',
  `password` varchar(100) NOT NULL DEFAULT '' COMMENT '加密后的密码字段',
  `role_name` varchar(20) NOT NULL DEFAULT '普通管理员' COMMENT '用户角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'nike'
--
/*!50003 DROP PROCEDURE IF EXISTS `proc_nk_prepare_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_nk_prepare_data`(in season VARCHAR(8), in in_prod_engn_desc varchar(6))
Label_Outer : BEGIN 
DECLARE start_date DATE;
DECLARE short_season varchar(4);
DECLARE long_season varchar(6);
DECLARE t_error INTEGER DEFAULT 0;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;

if season = 'FA17' or season = 'FA2017' then
	set start_date = DATE '2017-06-11';
    set short_season = 'FA17';
    set long_season = 'FA2017';
elseif season = 'SU17' or season = 'SU2017' then
	set start_date = DATE '2017-03-11';
    set short_season = 'SU17';
    set long_season = 'SU2017';
elseif season = 'SP17' or season = 'SP2017' then
	set start_date = DATE '2016-12-11';
    set short_season = 'SP17';
    set long_season = 'SP2017';
elseif season = 'HO16' or season = 'HO2016' then
	set start_date = DATE '2016-09-11';
    set short_season = 'HO16';
    set long_season = 'HO2016';
elseif season = 'FA16' or season = 'FA2016' then
	set start_date = DATE '2016-06-12';
    set short_season = 'FA16';
    set long_season = 'FA2016';
ELSE
	LEAVE Label_Outer;
END IF;

call proc_nk_prepare_vpm(start_date, long_season, in_prod_engn_desc);

call proc_nk_prepare_vcd();

call proc_nk_prepare_vsm(in_prod_engn_desc);

call proc_nk_prepare_vst(start_date, in_prod_engn_desc);

call proc_nk_prepare_vsd(start_date);

-- firstly for 17FA only
DROP TEMPORARY TABLE IF EXISTS tmp_filter_data_table;

CREATE TEMPORARY TABLE tmp_filter_data_table ENGINE = MEMORY SELECT 
    si.Store_Prod_Id,
    TIMESTAMPDIFF(WEEK,
        start_date,
        si.REPORT_DATE) + 1 WEEKNO,
    si.NET_SALES_UNITS,
    vpm.Prod_id,
    vpm.COLOR_MAIN,
    vpm.GBL_CAT_SUM_LONG_DESC,
    vpm.Ctgy_Ptfm,
    vpm.GNDR_GROUP_NM,
    vpm.GBL_SILH_LONG_DESC,
    vpm.REG_MSRP,
    vpm.PRICE,
    vpm.FTW_PLATFORM,
    vpm.ICON_FRANCHISE,
    vsm.POS_ID,
    vsm.STORE_RECORD_TYPE,
    vsm.SUB_TERRITORY,
    vsm.STORE_ENVIRONMENT_DESCRIPTION,
    vsm.SALES_AREA_NAMES,
    vsm.STORE_CITY_TIER_NUMBER,
    vsm.STORE_LEAD_CATEGORY,
    vsm.ABBREV_OWNER_GROUP_NAME,
    vsm.trade_zone,
    vst.store_type,
    vsm.clc_status
FROM
    nk_sale_info si,
    tmp_vpm vpm,
    tmp_vsm vsm,
    tmp_vst vst
WHERE
    si.report_date >= start_date
        AND si.REPORT_DATE <= DATE_ADD(start_date, INTERVAL 12 WEEK)
        AND si.store_pos_id = vsm.POS_ID
        AND si.PROD_CODE = vpm.Prod_id
        AND vst.STORE_POS_ID = si.store_pos_id
        AND NOT EXISTS( SELECT 
            1
        FROM
            tmp_vsd vsd
        WHERE
            si.Store_Prod_Id = vsd.Store_Prod_Id)
        AND NOT EXISTS( SELECT 
            1
        FROM
            nk_key_launch kl
        WHERE
            kl.LAUNCH_DATE IS NOT NULL
                AND kl.SEASON = short_season
                AND kl.PRODUCT_CODE = si.PROD_CODE
                AND kl.LAUNCH_DATE > si.REPORT_DATE);
                
alter table tmp_filter_data_table add index index_pos_id (pos_id asc);

START TRANSACTION;

-- truncate table nk_prepared_data;
DELETE FROM nk_prepared_data 
WHERE
    quart = short_season
    and prod_engn_desc = in_prod_engn_desc;

insert into nk_prepared_data select t1.*, short_season, in_prod_engn_desc from tmp_filter_data_table t1;

iF t_error = 1 THEN
	ROLLBACK;
ELSE
	COMMIT;
END IF;

END Label_Outer ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_nk_prepare_vcd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_nk_prepare_vcd`()
BEGIN 

DECLARE t_error INTEGER DEFAULT 0;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;

DROP TEMPORARY TABLE IF EXISTS tmp_vcd;

CREATE TEMPORARY TABLE tmp_vcd ENGINE = MEMORY SELECT 
    cdm.POS_ID_NEW_POS POS_ID,
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
    UPPER(cdm.STATUS) = 'OPENED';

alter table tmp_vcd add index index_pos_id (POS_ID asc);

iF t_error = 1 THEN
	ROLLBACK;
ELSE
	COMMIT;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_nk_prepare_vpm` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_nk_prepare_vpm`(in start_date DATE, in long_season varchar(6), in in_prod_engn_desc varchar(6))
BEGIN 
DECLARE omd_startdate DATE;
DECLARE t_error INTEGER DEFAULT 0;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;

set omd_startdate = str_to_date(concat(date_format(DATE_ADD(start_date, INTERVAL 1 month),'%Y-%m-'),'10'), '%Y-%m-%d');

DROP TEMPORARY TABLE IF EXISTS tmp_vpm;

IF in_prod_engn_desc = 'FTW' THEN
CREATE TEMPORARY TABLE tmp_vpm ENGINE = MEMORY SELECT 
    pm.MATL_NBR Prod_id,
    IFNULL((SELECT 
                    name
                FROM
                    nk_dsi_properties
                WHERE
                    group_name = 'colorMain' AND status = 1 AND prod_engn_desc = in_prod_engn_desc
                        AND value = (IF(upper(SUBSTRING_INDEX(pm.color_desc, '/', 1)) IN ('BLCK' , 'BLK', 'BLACK'),
                        'BLACK',
                        IF(upper(SUBSTRING_INDEX(pm.color_desc, '/', 1)) IN ('WHT' , 'SUMMIT WHITE', 'WHITE'),
                            'WHITE',
                            'OTHERS')))),
            (SELECT 
                    name
                FROM
                    nk_dsi_properties
                WHERE
                    group_name = 'colorMain' AND status = 1 AND prod_engn_desc = in_prod_engn_desc
                        AND value = 'OTHERS')) COLOR_MAIN,
    pm.GBL_CAT_SUM_LONG_DESC,
    IF(pm.GBL_CAT_SUM_LONG_DESC = 'BASKETBALL'
            OR pm.GBL_CAT_CORE_FOCS_LONG_DESC = 'JORDAN BRAND',
        'BASKETBALL/JD',
        IF(pm.GBL_CAT_SUM_LONG_DESC = 'RUNNING',
            'RUNNING/Non-MAX',
            IF(pm.GBL_CAT_SUM_LONG_DESC = 'NIKE SPORTSWEAR',
                'NSW/Non-MAX',
                IF(pm.FTW_PLATFORM = 'MAX',
                    'MAX',
                    'Others')))) Ctgy_Ptfm,
    ifnull((select name from nk_dsi_properties where group_name = 'gndrGroupNm' and value = pm.GNDR_GROUP_NM AND prod_engn_desc = in_prod_engn_desc), '') GNDR_GROUP_NM,
    pm.GBL_SILH_LONG_DESC,
    pm.REG_MSRP,
    IF(pm.REG_MSRP > (SELECT 
                value
            FROM
                nk_dsi_properties
            WHERE
                group_name = 'price' AND status = 1 AND prod_engn_desc = in_prod_engn_desc
                AND value > 0
            ORDER BY value DESC
            LIMIT 1),
        (SELECT 
                name
            FROM
                nk_dsi_properties
            WHERE
                group_name = 'price' AND status = 1 AND prod_engn_desc = in_prod_engn_desc
                AND value > 0
            ORDER BY value DESC
            LIMIT 1),
        IF(pm.REG_MSRP < (SELECT 
                    value
                FROM
                    nk_dsi_properties
                WHERE
                    group_name = 'price' AND status = 1 AND prod_engn_desc = in_prod_engn_desc
                    AND value > 0
                ORDER BY value ASC
                LIMIT 1),
            (SELECT 
                    name
                FROM
                    nk_dsi_properties
                WHERE
                    group_name = 'price' AND status = 1 AND prod_engn_desc = in_prod_engn_desc
                    AND value > 0
                ORDER BY value ASC
                LIMIT 1),
            (SELECT 
                    name
                FROM
                    nk_dsi_properties
                WHERE
                    group_name = 'price' AND status = 1 AND prod_engn_desc = in_prod_engn_desc
                    AND value < 0))) PRICE,
    pm.FTW_PLATFORM,
    pm.ICON_FRANCHISE
FROM
    nike.nk_prod_master pm
WHERE
    pm.season = long_season
        AND pm.PROD_ENGN_DESC = in_prod_engn_desc
        AND pm.omd < omd_startdate
        AND pm.GNDR_GROUP_NM IN (SELECT 
    value
FROM
    nk_dsi_properties
WHERE
    group_name = 'gndrGroupNm' AND prod_engn_desc = in_prod_engn_desc)
        AND NOT EXISTS( SELECT 
            1
        FROM
            nk_quick_strike qs
        WHERE
            pm.MATL_NBR = qs.PROD_CD
                AND qs.CCD_DT_BUS_SEASN_YR_CD = long_season);

ELSEIF in_prod_engn_desc = 'APP' THEN
CREATE TEMPORARY TABLE tmp_vpm ENGINE = MEMORY SELECT 
    pm.MATL_NBR Prod_id,
    IFNULL((SELECT 
                    name
                FROM
                    nk_dsi_properties
                WHERE
                    group_name = 'colorMain' AND status = 1 AND prod_engn_desc = in_prod_engn_desc
                        AND value = (IF(upper(SUBSTRING_INDEX(pm.color_desc, '/', 1)) IN ('BLCK' , 'BLK', 'BLACK'),
                        'BLACK',
                        IF(upper(SUBSTRING_INDEX(pm.color_desc, '/', 1)) IN ('WHT' , 'SUMMIT WHITE', 'WHITE'),
                            'WHITE',
                            'OTHERS')))),
            (SELECT 
                    name
                FROM
                    nk_dsi_properties
                WHERE
                    group_name = 'colorMain' AND status = 1 AND prod_engn_desc = in_prod_engn_desc
                        AND value = 'OTHERS')) COLOR_MAIN,
    pm.GBL_CAT_SUM_LONG_DESC,
    IF((pm.GBL_CAT_SUM_LONG_DESC IN ('NIKE SPORTSWEAR', 'BASKETBALL')
            OR pm.GBL_CAT_CORE_FOCS_LONG_DESC = 'JORDAN BRAND') AND PM.REG_3PE_CAT = 'BOTTOMS',
        'NSW/BKB BOTTOMS',
        IF(pm.REG_3PE_CAT IN ('FLEECE','JKT','OTW'),
            'FLEECE/JKT/OTW',
            IF(pm.GBL_CAT_SUM_LONG_DESC IN ('RUNNING','WOMEN TRAINING','FOOTBALL, BASEBALL, AT') 
				AND pm.REG_3PE_CAT IN ('PERF TOP','BOTTOMS','BASELAYER'),
                'RN/WT/FT,PT/BT/BL',
                IF(pm.REG_3PE_CAT IN ('TEE','POLO'),
                    'TEE/POLO',
                    'Others')))) Ctgy_Ptfm,
    ifnull((select name from nk_dsi_properties where group_name = 'gndrGroupNm' and value = pm.GNDR_GROUP_NM AND prod_engn_desc = in_prod_engn_desc), '') GNDR_GROUP_NM,
    pm.GBL_SILH_LONG_DESC,
    pm.REG_MSRP,
    IF(pm.REG_MSRP > (SELECT 
                value
            FROM
                nk_dsi_properties
            WHERE
                group_name = 'price' AND status = 1 AND prod_engn_desc = in_prod_engn_desc
                AND value > 0
            ORDER BY value DESC
            LIMIT 1),
        (SELECT 
                name
            FROM
                nk_dsi_properties
            WHERE
                group_name = 'price' AND status = 1 AND prod_engn_desc = in_prod_engn_desc
                AND value > 0
            ORDER BY value DESC
            LIMIT 1),
        IF(pm.REG_MSRP < (SELECT 
                    value
                FROM
                    nk_dsi_properties
                WHERE
                    group_name = 'price' AND status = 1 AND prod_engn_desc = in_prod_engn_desc
                    AND value > 0
                ORDER BY value ASC
                LIMIT 1),
            (SELECT 
                    name
                FROM
                    nk_dsi_properties
                WHERE
                    group_name = 'price' AND status = 1 AND prod_engn_desc = in_prod_engn_desc
                    AND value > 0
                ORDER BY value ASC
                LIMIT 1),
            (SELECT 
                    name
                FROM
                    nk_dsi_properties
                WHERE
                    group_name = 'price' AND status = 1 AND prod_engn_desc = in_prod_engn_desc
                    AND value < 0))) PRICE,
    pm.FTW_PLATFORM,
    pm.ICON_FRANCHISE
FROM
    nike.nk_prod_master pm
WHERE
    pm.season = long_season
        AND pm.PROD_ENGN_DESC = in_prod_engn_desc
        AND pm.omd < omd_startdate
        AND pm.GNDR_GROUP_NM IN (SELECT 
    value
FROM
    nk_dsi_properties
WHERE
    group_name = 'gndrGroupNm' AND prod_engn_desc = in_prod_engn_desc)
        AND NOT EXISTS( SELECT 
            1
        FROM
            nk_quick_strike qs
        WHERE
            pm.MATL_NBR = qs.PROD_CD
                AND qs.CCD_DT_BUS_SEASN_YR_CD = long_season);
END IF;
alter table tmp_vpm add index index_prod_id (prod_id asc);

iF t_error = 1 THEN
	ROLLBACK;
ELSE
	COMMIT;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_nk_prepare_vsd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_nk_prepare_vsd`(in start_date DATE)
BEGIN 
DECLARE t_error INTEGER DEFAULT 0;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;

DROP TEMPORARY TABLE IF EXISTS tmp_vsd;

/*
CREATE TEMPORARY TABLE tmp_vsd ENGINE = MEMORY SELECT 
    si.Store_Prod_Id
FROM
    nk_sale_info si
WHERE
    si.report_date >= start_date
        AND si.REPORT_DATE <= DATE_ADD(start_date,
        INTERVAL 12 WEEK)
        AND si.STORE_POS_ID IS NOT NULL
        AND si.DISCOUNT < 0.7
GROUP BY si.Store_Prod_Id
HAVING COUNT(si.Store_Prod_Id) > 5;

alter table tmp_vsd add index index_store_prod_id (Store_Prod_Id asc);
*/

CREATE TEMPORARY TABLE tmp_vsd1 ENGINE = MEMORY SELECT 
    sii.store_prod_id, COUNT(sii.Store_Prod_Id) cnt
FROM
    nk_sale_info sii
WHERE
    sii.report_date >= start_date
        AND sii.REPORT_DATE <= DATE_ADD(start_date,
        INTERVAL 12 WEEK)
        AND sii.discount < 0.7
GROUP BY sii.Store_Prod_Id;

CREATE TEMPORARY TABLE tmp_vsd2 ENGINE = MEMORY SELECT 
    sii.store_prod_id, count(sii.store_prod_id) cnt
FROM
    nk_sale_info sii
WHERE
    sii.report_date >= start_date
        AND sii.REPORT_DATE <= DATE_ADD(start_date,
        INTERVAL 12 WEEK)
GROUP BY sii.Store_Prod_Id;

alter table tmp_vsd1 add index index_store_prod_id (Store_Prod_Id asc);
alter table tmp_vsd2 add index index_store_prod_id (Store_Prod_Id asc);

CREATE TEMPORARY TABLE tmp_vsd ENGINE = MEMORY SELECT 
    v1.Store_Prod_Id
FROM
    tmp_vsd1 v1
WHERE
    v1.cnt > 5
        OR (v1.cnt = ( SELECT 
            v2.cnt
        FROM
            tmp_vsd2 v2
        WHERE
            v2.Store_Prod_Id = v1.Store_Prod_Id));

alter table tmp_vsd add index index_store_prod_id (Store_Prod_Id asc);

iF t_error = 1 THEN
	ROLLBACK;
ELSE
	COMMIT;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_nk_prepare_vsm` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_nk_prepare_vsm`(in in_prod_engn_desc varchar(6))
BEGIN 
DECLARE t_error INTEGER DEFAULT 0;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;

DROP TEMPORARY TABLE IF EXISTS tmp_vsm;

CREATE TEMPORARY TABLE tmp_vsm ENGINE = MEMORY SELECT 
        sm.POS_ID,
            sm.STORE_RECORD_TYPE,
            sm.SUB_TERRITORY,
            sm.STORE_ENVIRONMENT_DESCRIPTION,
            sm.SALES_AREA_NAMES,
            sm.STORE_CITY_TIER_NUMBER,
            sm.STORE_LEAD_CATEGORY,
            IF(LOWER(sm.ABBREV_OWNER_GROUP_NAME) = 'topsports', 'BELLE', UPPER(sm.ABBREV_OWNER_GROUP_NAME)) ABBREV_OWNER_GROUP_NAME,
            -- sm.trade_zone
            IFNULL((SELECT 
                    name
                FROM
                    nk_dsi_properties
                WHERE
                    group_name = 'tradeZone'
                    and status = 1 AND prod_engn_desc = in_prod_engn_desc
                        AND INSTR(value, sm.trade_zone) > 0),
            (SELECT 
                    name
                FROM
                    nk_dsi_properties
                WHERE
                    group_name = 'tradeZone'
                    and status = 1 AND prod_engn_desc = in_prod_engn_desc
                        AND value = 'default')) trade_zone,
           ifnull(vcd.type, 'Non-CLC') clc_status
    FROM
        nk_store_master sm left join tmp_vcd vcd on vcd.pos_id = sm.POS_ID
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
                cap.ADC_POS_ID = sm.POS_ID);
                
alter table tmp_vsm add index index_pos_id (pos_id asc);

iF t_error = 1 THEN
	ROLLBACK;
ELSE
	COMMIT;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_nk_prepare_vst` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_nk_prepare_vst`(in start_date DATE, in in_prod_engn_desc varchar(6))
BEGIN 
DECLARE t_error INTEGER DEFAULT 0;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;

DROP TEMPORARY TABLE IF EXISTS tmp_vst;

IF in_prod_engn_desc = 'FTW' THEN
CREATE TEMPORARY TABLE tmp_vst ENGINE = MEMORY SELECT 
    sii.STORE_POS_ID,
    IF(SUM(sii.NET_SALES_UNITS) > (SELECT 
                value
            FROM
                nk_dsi_properties
            WHERE
                group_name = 'storeType' AND status = 1 AND prod_engn_desc = in_prod_engn_desc
            ORDER BY value DESC
            LIMIT 1),
        (SELECT 
                name
            FROM
                nk_dsi_properties
            WHERE
                group_name = 'storeType' AND status = 1 AND prod_engn_desc = in_prod_engn_desc
            ORDER BY value DESC
            LIMIT 1),
        (SELECT 
                name
            FROM
                nk_dsi_properties
            WHERE
                group_name = 'storeType' AND status = 1 AND prod_engn_desc = in_prod_engn_desc
            ORDER BY value ASC
            LIMIT 1)) store_type
    FROM
        nk_sale_info sii
    WHERE    sii.report_date >= start_date
        AND sii.REPORT_DATE <= DATE_ADD(start_date,
        INTERVAL 15 WEEK) -- here using 16 weeks data
    GROUP BY sii.STORE_POS_ID;

ELSEIF in_prod_engn_desc = 'APP' THEN
CREATE TEMPORARY TABLE tmp_vst ENGINE = MEMORY SELECT 
    sii.STORE_POS_ID,
    IF(SUM(sii.NET_SALES_AMT) > (SELECT 
                value
            FROM
                nk_dsi_properties
            WHERE
                group_name = 'storeType' AND status = 1 AND prod_engn_desc = in_prod_engn_desc
            ORDER BY value DESC
            LIMIT 1),
        (SELECT 
                name
            FROM
                nk_dsi_properties
            WHERE
                group_name = 'storeType' AND status = 1 AND prod_engn_desc = in_prod_engn_desc
            ORDER BY value DESC
            LIMIT 1),
        (SELECT 
                name
            FROM
                nk_dsi_properties
            WHERE
                group_name = 'storeType' AND status = 1 AND prod_engn_desc = in_prod_engn_desc
            ORDER BY value ASC
            LIMIT 1)) store_type
    FROM
        nk_sale_info sii
    WHERE    sii.report_date >= start_date
        AND sii.REPORT_DATE <= DATE_ADD(start_date,
        INTERVAL 15 WEEK) -- here using 16 weeks data
    GROUP BY sii.STORE_POS_ID;
END IF;

alter table tmp_vst add index index_pos_id (STORE_POS_ID asc);

iF t_error = 1 THEN
	ROLLBACK;
ELSE
	COMMIT;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-27 10:13:01
