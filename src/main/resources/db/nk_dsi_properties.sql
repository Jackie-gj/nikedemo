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
  `column_width` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nk_dsi_properties`
--

LOCK TABLES `nk_dsi_properties` WRITE;
/*!40000 ALTER TABLE `nk_dsi_properties` DISABLE KEYS */;
INSERT INTO `nk_dsi_properties` VALUES ('storeType','大','1000',1,NULL,'店铺大小',15),('storeType','小','0',1,NULL,'店铺大小',15),('tradeZone','大','MW',1,NULL,'店铺商圈',15),('tradeZone','中','CA,LP',1,NULL,'店铺商圈',15),('tradeZone','小','default',1,NULL,'店铺商圈',15),('gndrGroupNm','男','MENS',1,NULL,'性别',15),('gndrGroupNm','女','WOMENS',1,NULL,'性别',15),('gndrGroupNm','儿童','KIDS',0,NULL,'性别',15),('price','高','899',1,NULL,'价格高低',15),('price','低','600',1,NULL,'价格高低',15),('price','中','700',1,NULL,'价格高低',15),('colorMain','黑','BLACK',1,NULL,'颜色',15),('colorMain','白','WHITE',0,NULL,'颜色',15),('colorMain','其它','OTHERS',1,NULL,'颜色',15),('ctgyPtfm','BASKETBALL/JD','BASKETBALL/JD',1,NULL,'商品类别',40),('ctgyPtfm','RUNNING/Non-MAX','RUNNING/Non-MAX',1,NULL,'商品类别',40),('ctgyPtfm','NSW/Non-MAX','NSW/Non-MAX',1,NULL,'商品类别',40),('ctgyPtfm','MAX','MAX',1,NULL,'商品类别',40),('ctgyPtfm','Others','Others',1,NULL,'商品类别',40),('salesAreaNames','东北','Heiji,Liaoning',1,NULL,'地区',20),('salesAreaNames','华北','Huabei,Luyu,Jingjin',1,NULL,'地区',20),('salesAreaNames','西北','Xibei',1,NULL,'地区',20),('salesAreaNames','华东','JiangsuAnhui,Zhejiang,Shanghai,HunanHubei',1,NULL,'地区',20),('salesAreaNames','华南','FujianJiangxi,Guangzhou,Guangdong,GuangxiHainan',1,NULL,'地区',20),('salesAreaNames','西南','Chuanyu,Yungui',1,NULL,'地区',20),('city','上海','上海',1,NULL,'城市',40),('city','浙江','杭州,宁波,绍兴,嘉兴,台州',1,NULL,'城市',40),('city','北京','北京',1,NULL,'城市',40),('storeRecordType','Nike Only Store','Nike Only Store',1,NULL,'店铺类型',40),('storeRecordType','Wholesale / Multi-Brand','Wholesale / Multi-Brand',1,NULL,'店铺类型',40);
/*!40000 ALTER TABLE `nk_dsi_properties` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-12 15:13:43
