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
CREATE DEFINER=`root`@`%` PROCEDURE `proc_nk_prepare_data`(in season VARCHAR(8))
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

call proc_nk_prepare_vpm(start_date, long_season);

call proc_nk_prepare_vsm();

call proc_nk_prepare_vst(start_date);

call proc_nk_prepare_vsd(start_date);

call proc_nk_prepare_vcd();

-- firstly for 17FA only
DROP TEMPORARY TABLE IF EXISTS tmp_filter_data_table;

CREATE TEMPORARY TABLE tmp_filter_data_table ENGINE = MEMORY SELECT 
    si.Store_Prod_Id,
    TIMESTAMPDIFF(WEEK,
        start_date,
        si.REPORT_DATE) + 1 WEEKNO,
    si.NET_SALES_UNITS,
    vpm.*,
    vsm.*,
    vst.store_type
FROM
    nk_sale_info si,
    tmp_vpm vpm,
    tmp_vsm vsm,
    tmp_vst vst
WHERE
    si.report_date >= start_date
        AND si.REPORT_DATE <= DATE_ADD(start_date,
        INTERVAL 12 WEEK)
        AND si.store_pos_id = vsm.POS_ID
        AND si.PROD_CODE = vpm.Prod_id
        AND vst.STORE_POS_ID = si.store_pos_id
        -- AND si.NET_SALES_AMT / si.EXTENDED_MSRP_SALES_AMT >= 0.7
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
    quart = short_season;

-- here append the clc status , however it may take more than 10 mins, enable this depends on requirement from biz
-- insert into nk_prepared_data select t1.*, ifnull(t2.type, 'Non-CLC') clc_status, short_season QUART from tmp_filter_data_table t1 left join tmp_vcd t2 on t1.pos_id = t2.pos_id;

insert into nk_prepared_data select t1.*, 'Not Impl' clc_status, short_season QUART from tmp_filter_data_table t1;

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
CREATE DEFINER=`root`@`%` PROCEDURE `proc_nk_prepare_vpm`(in start_date DATE, in long_season varchar(6))
BEGIN 
DECLARE omd_startdate DATE;
DECLARE t_error INTEGER DEFAULT 0;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;

set omd_startdate = str_to_date(concat(date_format(DATE_ADD(start_date, INTERVAL 1 month),'%Y-%m-'),'10'), '%Y-%m-%d');

DROP TEMPORARY TABLE IF EXISTS tmp_vpm;

CREATE TEMPORARY TABLE tmp_vpm ENGINE = MEMORY SELECT 
    pm.MATL_NBR Prod_id,
    IFNULL((SELECT 
                    name
                FROM
                    nk_dsi_properties
                WHERE
                    group_name = 'colorMain' AND status = 1
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
                    group_name = 'colorMain' AND status = 1
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
    ifnull((select name from nk_dsi_properties where group_name = 'gndrGroupNm' and value = pm.GNDR_GROUP_NM), '') GNDR_GROUP_NM,
    pm.GBL_SILH_LONG_DESC,
    pm.REG_MSRP,
    IF(pm.REG_MSRP > (SELECT 
                value
            FROM
                nk_dsi_properties
            WHERE
                group_name = 'price' AND status = 1
            ORDER BY value DESC
            LIMIT 1),
        (SELECT 
                name
            FROM
                nk_dsi_properties
            WHERE
                group_name = 'price' AND status = 1
            ORDER BY value DESC
            LIMIT 1),
        IF(pm.REG_MSRP < (SELECT 
                    value
                FROM
                    nk_dsi_properties
                WHERE
                    group_name = 'price' AND status = 1
                ORDER BY value ASC
                LIMIT 1),
            (SELECT 
                    name
                FROM
                    nk_dsi_properties
                WHERE
                    group_name = 'price' AND status = 1
                ORDER BY value ASC
                LIMIT 1),
            '中')) PRICE, -- TBD
    pm.FTW_PLATFORM,
    pm.ICON_FRANCHISE
FROM
    nike.nk_prod_master pm
WHERE
    pm.season = long_season
        AND pm.PROD_ENGN_DESC = 'FTW'
        AND pm.omd < omd_startdate
        AND pm.GNDR_GROUP_NM IN (SELECT 
    value
FROM
    nk_dsi_properties
WHERE
    group_name = 'gndrGroupNm')
        AND NOT EXISTS( SELECT 
            1
        FROM
            nk_quick_strike qs
        WHERE
            pm.MATL_NBR = qs.PROD_CD
                AND qs.CCD_DT_BUS_SEASN_YR_CD = long_season);
                
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
CREATE DEFINER=`root`@`%` PROCEDURE `proc_nk_prepare_vsm`()
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
                    and status = 1
                        AND INSTR(value, sm.trade_zone) > 0),
            (SELECT 
                    name
                FROM
                    nk_dsi_properties
                WHERE
                    group_name = 'tradeZone'
                    and status = 1
                        AND value = 'default')) trade_zone
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
CREATE DEFINER=`root`@`%` PROCEDURE `proc_nk_prepare_vst`(in start_date DATE)
BEGIN 
DECLARE t_error INTEGER DEFAULT 0;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;

DROP TEMPORARY TABLE IF EXISTS tmp_vst;

CREATE TEMPORARY TABLE tmp_vst ENGINE = MEMORY SELECT 
    sii.STORE_POS_ID,
    IF(SUM(sii.NET_SALES_UNITS) > (SELECT 
                value
            FROM
                nk_dsi_properties
            WHERE
                group_name = 'storeType' AND status = 1
            ORDER BY value DESC
            LIMIT 1),
        (SELECT 
                name
            FROM
                nk_dsi_properties
            WHERE
                group_name = 'storeType' AND status = 1
            ORDER BY value DESC
            LIMIT 1),
        (SELECT 
                name
            FROM
                nk_dsi_properties
            WHERE
                group_name = 'storeType' AND status = 1
            ORDER BY value ASC
            LIMIT 1)) store_type
    FROM
        nk_sale_info sii
    WHERE    sii.report_date >= start_date
        AND sii.REPORT_DATE <= DATE_ADD(start_date,
        INTERVAL 15 WEEK) -- here using 16 weeks data
    GROUP BY sii.STORE_POS_ID;
                
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

-- Dump completed on 2018-02-12 14:53:26
