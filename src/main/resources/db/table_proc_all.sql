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
-- Dumping data for table `nk_dsi_properties`
--

LOCK TABLES `nk_dsi_properties` WRITE;
/*!40000 ALTER TABLE `nk_dsi_properties` DISABLE KEYS */;
INSERT INTO `nk_dsi_properties` VALUES ('storeType','大','1000',1,NULL,'店铺大小',15,'FTW'),('storeType','小','0',1,NULL,'店铺大小',15,'FTW'),('tradeZone','大','MW',1,NULL,'店铺商圈',15,'FTW'),('tradeZone','中','CA,LP',1,NULL,'店铺商圈',15,'FTW'),('tradeZone','小','default',1,NULL,'店铺商圈',15,'FTW'),('gndrGroupNm','男','MENS',1,NULL,'性别',15,'FTW'),('gndrGroupNm','女','WOMENS',1,NULL,'性别',15,'FTW'),('gndrGroupNm','儿童','KIDS',0,NULL,'性别',15,'FTW'),('price','高','899',1,NULL,'价格高低',15,'FTW'),('price','低','600',1,NULL,'价格高低',15,'FTW'),('price','中','-1',1,NULL,'价格高低',15,'FTW'),('colorMain','黑','BLACK',1,NULL,'产品颜色',15,'FTW'),('colorMain','白','WHITE',0,NULL,'产品颜色',15,'FTW'),('colorMain','其它','OTHERS',1,NULL,'产品颜色',15,'FTW'),('ctgyPtfm','BASKETBALL/JD','BASKETBALL/JD',1,NULL,'商品类别',40,'FTW'),('ctgyPtfm','RUNNING/Non-MAX','RUNNING/Non-MAX',1,NULL,'商品类别',40,'FTW'),('ctgyPtfm','NSW/Non-MAX','NSW/Non-MAX',1,NULL,'商品类别',40,'FTW'),('ctgyPtfm','MAX','MAX',1,NULL,'商品类别',40,'FTW'),('ctgyPtfm','Others','Others',1,NULL,'商品类别',40,'FTW'),('salesAreaNames','东北','Heiji,Liaoning',1,NULL,'销售区域',20,'FTW'),('salesAreaNames','华北','Huabei,Luyu,Jingjin',1,NULL,'销售区域',20,'FTW'),('salesAreaNames','西北','Xibei',1,NULL,'销售区域',20,'FTW'),('salesAreaNames','华东','JiangsuAnhui,Zhejiang,Shanghai,HunanHubei',1,NULL,'销售区域',20,'FTW'),('salesAreaNames','华南','FujianJiangxi,Guangzhou,Guangdong,GuangxiHainan',1,NULL,'销售区域',20,'FTW'),('salesAreaNames','西南','Chuanyu,Yungui',1,NULL,'销售区域',20,'FTW'),('storeRecordType','Nike Only Store','Nike Only Store',1,NULL,'店铺类型',40,'FTW'),('storeRecordType','Wholesale / Multi-Brand','Wholesale / Multi-Brand',1,NULL,'店铺类型',40,'FTW'),('storeType','大','300000',1,NULL,'店铺大小',15,'APP'),('storeType','小','0',1,NULL,'店铺大小',15,'APP'),('tradeZone','大','MW',1,NULL,'店铺商圈',15,'APP'),('tradeZone','中','CA,LP',1,NULL,'店铺商圈',15,'APP'),('tradeZone','小','default',1,NULL,'店铺商圈',15,'APP'),('gndrGroupNm','男','MENS',1,NULL,'性别',15,'APP'),('gndrGroupNm','女','WOMENS',1,NULL,'性别',15,'APP'),('gndrGroupNm','儿童','KIDS',0,NULL,'性别',15,'APP'),('price','高','899',1,NULL,'价格高低',15,'APP'),('price','低','600',1,NULL,'价格高低',15,'APP'),('price','中','-1',1,NULL,'价格高低',15,'APP'),('colorMain','黑','BLACK',1,NULL,'产品颜色',15,'APP'),('colorMain','白','WHITE',0,NULL,'产品颜色',15,'APP'),('colorMain','其它','OTHERS',1,NULL,'产品颜色',15,'APP'),('ctgyPtfm','NSW/BKB BOTTOMS','NSW/BKB BOTTOMS',1,NULL,'商品类别',40,'APP'),('ctgyPtfm','FLEECE/JKT/OTW','FLEECE/JKT/OTW',1,NULL,'商品类别',40,'APP'),('ctgyPtfm','RN/WT/FT,PT/BT/BL','RN/WT/FT,PT/BT/BL',1,NULL,'商品类别',40,'APP'),('ctgyPtfm','TEE/POLO','TEE/POLO',1,NULL,'商品类别',40,'APP'),('ctgyPtfm','Others','Others',1,NULL,'商品类别',40,'APP'),('salesAreaNames','东北','Heiji,Liaoning',1,NULL,'销售区域',20,'APP'),('salesAreaNames','华北','Huabei,Luyu,Jingjin',1,NULL,'销售区域',20,'APP'),('salesAreaNames','西北','Xibei',1,NULL,'销售区域',20,'APP'),('salesAreaNames','华东','JiangsuAnhui,Zhejiang,Shanghai,HunanHubei',1,NULL,'销售区域',20,'APP'),('salesAreaNames','华南','FujianJiangxi,Guangzhou,Guangdong,GuangxiHainan',1,NULL,'销售区域',20,'APP'),('salesAreaNames','西南','Chuanyu,Yungui',1,NULL,'销售区域',20,'APP'),('storeRecordType','Nike Only Store','Nike Only Store',1,NULL,'店铺类型',40,'APP'),('storeRecordType','Wholesale / Multi-Brand','Wholesale / Multi-Brand',1,NULL,'店铺类型',40,'APP'),('gblCatSumLongDesc','BASKETBALL','BASKETBALL',1,NULL,'类型描述',40,'APP'),('gblCatSumLongDesc','NIKE SPORTSWEAR','NIKE SPORTSWEAR',1,NULL,'类型描述',40,'APP'),('gblCatSumLongDesc','FOOTBALL, BASEBALL, AT','FOOTBALL, BASEBALL, AT',1,NULL,'类型描述',40,'APP'),('gblCatSumLongDesc','FOOTBALL/SOCCER','FOOTBALL/SOCCER',1,NULL,'类型描述',40,'APP'),('gblCatSumLongDesc','OTHER','OTHER',1,NULL,'类型描述',40,'APP'),('gblCatSumLongDesc','RUNNING','RUNNING',1,NULL,'类型描述',40,'APP'),('gblCatSumLongDesc','WOMEN TRAINING','WOMEN TRAINING',1,NULL,'类型描述',40,'APP'),('gblCatSumLongDesc','YOUNG ATHLETES','YOUNG ATHLETES',1,NULL,'类型描述',40,'APP'),('gblCatSumLongDesc','ACTION OUTDOOR','ACTION OUTDOOR',1,NULL,'类型描述',40,'APP'),('gblCatSumLongDesc','BASKETBALL','BASKETBALL',1,NULL,'类型描述',40,'FTW'),('gblCatSumLongDesc','NIKE SPORTSWEAR','NIKE SPORTSWEAR',1,NULL,'类型描述',40,'FTW'),('gblCatSumLongDesc','FOOTBALL, BASEBALL, AT','FOOTBALL, BASEBALL, AT',1,NULL,'类型描述',40,'FTW'),('gblCatSumLongDesc','FOOTBALL/SOCCER','FOOTBALL/SOCCER',1,NULL,'类型描述',40,'FTW'),('gblCatSumLongDesc','OTHER','OTHER',1,NULL,'类型描述',40,'FTW'),('gblCatSumLongDesc','RUNNING','RUNNING',1,NULL,'类型描述',40,'FTW'),('gblCatSumLongDesc','WOMEN TRAINING','WOMEN TRAINING',1,NULL,'类型描述',40,'FTW'),('gblCatSumLongDesc','YOUNG ATHLETES','YOUNG ATHLETES',1,NULL,'类型描述',40,'FTW'),('gblCatSumLongDesc','ACTION OUTDOOR','ACTION OUTDOOR',1,NULL,'类型描述',40,'FTW'),('subTerritory','North','North',1,NULL,'店铺子领域',40,'APP'),('subTerritory','East','East',1,NULL,'店铺子领域',40,'APP'),('subTerritory','South','South',1,NULL,'店铺子领域',40,'APP'),('subTerritory','North','North',1,NULL,'店铺子领域',40,'FTW'),('subTerritory','East','East',1,NULL,'店铺子领域',40,'FTW'),('subTerritory','South','South',1,NULL,'店铺子领域',40,'FTW'),('storeCityTierNumber','0','0',1,NULL,'店铺城市级别',20,'FTW'),('storeCityTierNumber','1','1',1,NULL,'店铺城市级别',20,'FTW'),('storeCityTierNumber','2','2',1,NULL,'店铺城市级别',20,'FTW'),('storeCityTierNumber','3','3',1,NULL,'店铺城市级别',20,'FTW'),('storeCityTierNumber','4','4',1,NULL,'店铺城市级别',20,'FTW'),('storeCityTierNumber','5','5',1,NULL,'店铺城市级别',20,'FTW'),('storeCityTierNumber','6','6',1,NULL,'店铺城市级别',20,'FTW'),('storeCityTierNumber','7','7',1,NULL,'店铺城市级别',20,'FTW'),('storeCityTierNumber','0','0',1,NULL,'店铺城市级别',20,'APP'),('storeCityTierNumber','1','1',1,NULL,'店铺城市级别',20,'APP'),('storeCityTierNumber','2','2',1,NULL,'店铺城市级别',20,'APP'),('storeCityTierNumber','3','3',1,NULL,'店铺城市级别',20,'APP'),('storeCityTierNumber','4','4',1,NULL,'店铺城市级别',20,'APP'),('storeCityTierNumber','5','5',1,NULL,'店铺城市级别',20,'APP'),('storeCityTierNumber','6','6',1,NULL,'店铺城市级别',20,'APP'),('storeCityTierNumber','7','7',1,NULL,'店铺城市级别',20,'APP'),('clcStatus','Non-CLC','Non-CLC',1,NULL,'CLC状态',20,'APP'),('clcStatus','Other_CLC','Other_CLC',1,NULL,'CLC状态',20,'APP'),('clcStatus','Key_CLC','Key_CLC',1,NULL,'CLC状态',20,'APP'),('clcStatus','Non-CLC','Non-CLC',1,NULL,'CLC状态',20,'FTW'),('clcStatus','Other_CLC','Other_CLC',1,NULL,'CLC状态',20,'FTW'),('clcStatus','Key_CLC','Key_CLC',1,NULL,'CLC状态',20,'FTW'),('storeLeadCategory','Running','Running',1,NULL,'店铺概念属性',20,'APP'),('storeLeadCategory','Sportswear','Sportswear',1,NULL,'店铺概念属性',20,'APP'),('storeLeadCategory','Basketball','Basketball',1,NULL,'店铺概念属性',20,'APP'),('storeLeadCategory','Jordan','Jordan',1,NULL,'店铺概念属性',20,'APP'),('storeLeadCategory','Other','Other',1,NULL,'店铺概念属性',20,'APP'),('storeLeadCategory','Athletic Training','Athletic Training',1,NULL,'店铺概念属性',20,'APP'),('storeLeadCategory','Women\'s Training','Women\'s Training',1,NULL,'店铺概念属性',20,'APP'),('storeLeadCategory','Young Athletes','Young Athletes',1,NULL,'店铺概念属性',20,'APP'),('storeLeadCategory','Action Sports','Action Sports',1,NULL,'店铺概念属性',20,'APP'),('storeLeadCategory','Running','Running',1,NULL,'店铺概念属性',20,'FTW'),('storeLeadCategory','Sportswear','Sportswear',1,NULL,'店铺概念属性',20,'FTW'),('storeLeadCategory','Jordan','Jordan',1,NULL,'店铺概念属性',20,'FTW'),('storeLeadCategory','Basketball','Basketball',1,NULL,'店铺概念属性',20,'FTW'),('storeLeadCategory','Other','Other',1,NULL,'店铺概念属性',20,'FTW'),('storeLeadCategory','Athletic Training','Athletic Training',1,NULL,'店铺概念属性',20,'FTW'),('storeLeadCategory','Young Athletes','Young Athletes',1,NULL,'店铺概念属性',20,'FTW'),('storeLeadCategory','Women\'s Training','Women\'s Training',1,NULL,'店铺概念属性',20,'FTW'),('storeEnvironmentDescription','STAND ALONE STREET','STAND ALONE STREET',1,NULL,'店铺环境',40,'FTW'),('storeEnvironmentDescription','DEPARTMENT STORE','DEPARTMENT STORE',1,NULL,'店铺环境',40,'FTW'),('storeEnvironmentDescription','SHOPPING MALL','SHOPPING MALL',1,NULL,'店铺环境',40,'FTW'),('storeEnvironmentDescription','OTHERS','OTHERS',1,NULL,'店铺环境',40,'FTW'),('storeEnvironmentDescription','STREET','STREET',1,NULL,'店铺环境',40,'FTW'),('storeEnvironmentDescription','SPORTS DEPARTMENT','SPORTS DEPARTMENT',1,NULL,'店铺环境',40,'FTW'),('storeEnvironmentDescription','STAND ALONE STREET','STAND ALONE STREET',1,NULL,'店铺环境',40,'APP'),('storeEnvironmentDescription','DEPARTMENT STORE','DEPARTMENT STORE',1,NULL,'店铺环境',40,'APP'),('storeEnvironmentDescription','SHOPPING MALL','SHOPPING MALL',1,NULL,'店铺环境',40,'APP'),('storeEnvironmentDescription','OTHERS','OTHERS',1,NULL,'店铺环境',40,'APP'),('storeEnvironmentDescription','STREET','STREET',1,NULL,'店铺环境',40,'APP'),('storeEnvironmentDescription','SPORTS DEPARTMENT','SPORTS DEPARTMENT',1,NULL,'店铺环境',40,'APP'),('gblSilhLongDesc','SHORT','SHORT',1,NULL,'细类',40,'APP'),('gblSilhLongDesc','TANK TOP/SINGLET','TANK TOP/SINGLET',1,NULL,'细类',40,'APP'),('gblSilhLongDesc','SHORT SLEEVE T-SHIRT','SHORT SLEEVE T-SHIRT',1,NULL,'细类',40,'APP'),('gblSilhLongDesc','3/4 LENGTH TIGHT','3/4 LENGTH TIGHT',1,NULL,'细类',40,'APP'),('gblSilhLongDesc','SHORT SLEEVE TOP','SHORT SLEEVE TOP',1,NULL,'细类',40,'APP'),('gblSilhLongDesc','TIGHTS','TIGHTS',1,NULL,'细类',40,'APP'),('gblSilhLongDesc','HOODED JACKET','HOODED JACKET',1,NULL,'细类',40,'APP'),('gblSilhLongDesc','PANT','PANT',1,NULL,'细类',40,'APP'),('gblSilhLongDesc','HOODED FULL ZIP LS TOP','HOODED FULL ZIP LS TOP',1,NULL,'细类',40,'APP'),('gblSilhLongDesc','LONG SLEEVE TOP','LONG SLEEVE TOP',1,NULL,'细类',40,'APP'),('gblSilhLongDesc','SHORT SLEEVE POLO','SHORT SLEEVE POLO',1,NULL,'细类',40,'APP'),('gblSilhLongDesc','SLEEVELESS TOP','SLEEVELESS TOP',1,NULL,'细类',40,'APP'),('gblSilhLongDesc','SHORT - 2 IN 1','SHORT - 2 IN 1',1,NULL,'细类',40,'APP'),('gblSilhLongDesc','SLEEVELESS T SHIRT','SLEEVELESS T SHIRT',1,NULL,'细类',40,'APP'),('gblSilhLongDesc','3/4 LENGTH PANT','3/4 LENGTH PANT',1,NULL,'细类',40,'APP'),('gblSilhLongDesc','HOODED LONG SLEEVE TOP','HOODED LONG SLEEVE TOP',1,NULL,'细类',40,'APP'),('gblSilhLongDesc','JACKET','JACKET',1,NULL,'细类',40,'APP'),('gblSilhLongDesc','BRA','BRA',1,NULL,'细类',40,'APP'),('gblSilhLongDesc','SKIRT','SKIRT',1,NULL,'细类',40,'APP'),('gblSilhLongDesc','CAP/HAT/VISOR','CAP/HAT/VISOR',1,NULL,'细类',40,'APP'),('gblSilhLongDesc','TIGHT - KNEE LENGTH','TIGHT - KNEE LENGTH',1,NULL,'细类',40,'APP'),('gblSilhLongDesc','HOODED SHORT SLEEVE TOP','HOODED SHORT SLEEVE TOP',1,NULL,'细类',40,'APP'),('gblSilhLongDesc','3/4 SLEEVE','3/4 SLEEVE',1,NULL,'细类',40,'APP'),('gblSilhLongDesc','PANT - KNEE LENGTH','PANT - KNEE LENGTH',1,NULL,'细类',40,'APP'),('gblSilhLongDesc','TRACK JACKET','TRACK JACKET',1,NULL,'细类',40,'APP'),('gblSilhLongDesc','VEST','VEST',1,NULL,'细类',40,'APP'),('gblSilhLongDesc','LONG SLEEVE T-SHIRT','LONG SLEEVE T-SHIRT',1,NULL,'细类',40,'APP'),('gblSilhLongDesc','TEE - 3/4 SLEEVE','TEE - 3/4 SLEEVE',1,NULL,'细类',40,'APP'),('gblSilhLongDesc','JUMP SUIT','JUMP SUIT',1,NULL,'细类',40,'APP'),('gblSilhLongDesc','OTHER MISCELLANEOUS','OTHER MISCELLANEOUS',1,NULL,'细类',40,'APP'),('gblSilhLongDesc','VARSITY JACKET','VARSITY JACKET',1,NULL,'细类',40,'APP'),('gblSilhLongDesc','LOW TOP','LOW TOP',1,NULL,'细类',40,'FTW'),('gblSilhLongDesc','THREE QUARTER HIGH','THREE QUARTER HIGH',1,NULL,'细类',40,'FTW'),('gblSilhLongDesc','HIGH TOP','HIGH TOP',1,NULL,'细类',40,'FTW'),('reg3peCat','OTHERS','OTHERS',1,NULL,'衣服类型',40,'APP'),('reg3peCat','ACC','ACC',1,NULL,'衣服类型',40,'APP'),('reg3peCat','BOTTOMS','BOTTOMS',1,NULL,'衣服类型',40,'APP'),('reg3peCat','PERF TOP','PERF TOP',1,NULL,'衣服类型',40,'APP'),('reg3peCat','FLEECE','FLEECE',1,NULL,'衣服类型',40,'APP'),('reg3peCat','BASELAYER','BASELAYER',1,NULL,'衣服类型',40,'APP'),('reg3peCat','POLO','POLO',1,NULL,'衣服类型',40,'APP'),('reg3peCat','JKT','JKT',1,NULL,'衣服类型',40,'APP'),('reg3peCat','OTW','OTW',1,NULL,'衣服类型',40,'APP'),('reg3peCat','TEE','TEE',1,NULL,'衣服类型',40,'APP'),('reg3peCat','BAGS','BAGS',1,NULL,'衣服类型',40,'APP'),('reg3peCat','SOCKS','SOCKS',1,NULL,'衣服类型',40,'APP'),('reg3peCat','REPLICA JERSEYS','REPLICA JERSEYS',1,NULL,'衣服类型',40,'APP'),('reg3peCat','PERFORMANCE TOPS','PERFORMANCE TOPS',1,NULL,'衣服类型',40,'APP'),('reg3peCat','OUT','OUT',1,NULL,'衣服类型',40,'APP'),('reg3peCat','DRESSES','DRESSES',1,NULL,'衣服类型',40,'APP'),('reg3peCat','POLOS','POLOS',1,NULL,'衣服类型',40,'APP'),('reg3peCat','GRAPHIC TEES','GRAPHIC TEES',1,NULL,'衣服类型',40,'APP'),('reg3peCat','PULLOVER','PULLOVER',1,NULL,'衣服类型',40,'APP');
/*!40000 ALTER TABLE `nk_dsi_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nk_prop_importance`
--

DROP TABLE IF EXISTS `nk_prop_importance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nk_prop_importance` (
  `property` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `importance` decimal(10,8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nk_prop_importance`
--

LOCK TABLES `nk_prop_importance` WRITE;
/*!40000 ALTER TABLE `nk_prop_importance` DISABLE KEYS */;
INSERT INTO `nk_prop_importance` VALUES ('storeType',0.10000000),('tradeZone',0.14000000),('price',0.05000000),('gndrGroupNm',0.20000000),('ctgyPtfm',0.10000000),('colorMain',0.10000000),('salesAreaNames',0.13000000),('storeRecordType',0.10000000),('storeEnvironmentDescription',0.01000000),('storeLeadCategory',0.01000000),('clcStatus',0.01000000),('storeCityTierNumber',0.04000000),('subTerritory',0.01000000);
/*!40000 ALTER TABLE `nk_prop_importance` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `nk_user`
--

LOCK TABLES `nk_user` WRITE;
/*!40000 ALTER TABLE `nk_user` DISABLE KEYS */;
INSERT INTO `nk_user` VALUES (2,'admin','e10adc3949ba59abbe56e057f20f883e','系统管理员'),(88,'clayyu','e10adc3949ba59abbe56e057f20f883e','普通管理员'),(89,'test','098f6bcd4621d373cade4e832627b4f6','普通管理员');
/*!40000 ALTER TABLE `nk_user` ENABLE KEYS */;
UNLOCK TABLES;

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
    vpm.REG_3PE_CAT,
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
    if(pm.REG_3PE_CAT = '' or isnull(pm.REG_3PE_CAT), 'OTHERS', pm.REG_3PE_CAT) REG_3PE_CAT, -- APP only
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
    if(pm.REG_3PE_CAT = '' or isnull(pm.REG_3PE_CAT), 'OTHERS', pm.REG_3PE_CAT) REG_3PE_CAT, -- APP only
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
            IF(sm.STORE_ENVIRONMENT_DESCRIPTION = '', 'OTHERS', sm.STORE_ENVIRONMENT_DESCRIPTION) STORE_ENVIRONMENT_DESCRIPTION,
            (SELECT 
                    name
                FROM
                    nk_dsi_properties
                WHERE
                    group_name = 'salesAreaNames'
                    and status = 1 AND prod_engn_desc = in_prod_engn_desc
                        AND INSTR(value, sm.SALES_AREA_NAMES) > 0) SALES_AREA_NAMES,
            sm.STORE_CITY_TIER_NUMBER,
            IF(sm.STORE_LEAD_CATEGORY = '', 'OTHERS' , sm.STORE_LEAD_CATEGORY) STORE_LEAD_CATEGORY,
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

-- Dump completed on 2018-02-28 12:28:02
