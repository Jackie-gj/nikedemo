DROP PROCEDURE IF EXISTS proc_nk_prepare_data;
DELIMITER //
CREATE PROCEDURE proc_nk_prepare_data(in season VARCHAR(8))
Label_Outer : BEGIN 
DECLARE start_date DATE;
DECLARE short_season varchar(4);
DECLARE long_season varchar(6);
DECLARE omd_startdate DATE;
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

set omd_startdate = str_to_date(concat(date_format(DATE_ADD(start_date, INTERVAL 1 month),'%Y-%m-'),'10'), '%Y-%m-%d');

-- firstly for 17FA only
DROP TEMPORARY TABLE IF EXISTS tmp_filter_data_table;
DROP TEMPORARY TABLE IF EXISTS tmp_append_data_table;

CREATE TEMPORARY TABLE tmp_filter_data_table SELECT 
    CONCAT(si.STORE_POS_ID, '_', si.PROD_CODE) Store_Prod_Id,
    TIMESTAMPDIFF(WEEK,
        start_date,
        si.REPORT_DATE) + 1 WEEKNO,
    si.NET_SALES_UNITS,
    vpm.*,
    vsm.*,
    vst.store_type
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
        pm.season = long_season
            AND pm.PROD_ENGN_DESC = 'FTW'
            AND pm.omd < omd_startdate
            AND pm.GNDR_GROUP_NM IN ('MENS' , 'WOMENS', 'KIDS')
            AND NOT EXISTS( SELECT 
                1
            FROM
                nk_quick_strike qs
            WHERE
                pm.MATL_NBR = qs.PROD_CD
                    AND qs.CCD_DT_BUS_SEASN_YR_CD = long_season)) vpm,
    (SELECT 
        sm.POS_ID,
            sm.STORE_RECORD_TYPE,
            sm.SUB_TERRITORY,
            sm.STORE_ENVIRONMENT_DESCRIPTION,
            sm.SALES_AREA_NAMES,
            sm.STORE_CITY_TIER_NUMBER,
            sm.STORE_LEAD_CATEGORY,
            IF(LOWER(sm.ABBREV_OWNER_GROUP_NAME) = 'topsports', 'BELLE', UPPER(sm.ABBREV_OWNER_GROUP_NAME)) ABBREV_OWNER_GROUP_NAME,
            sm.trade_zone
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
    si.report_date >= start_date
        AND si.REPORT_DATE <= DATE_ADD(start_date,
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
                AND kl.SEASON = short_season
                AND kl.PRODUCT_CODE = si.PROD_CODE
                AND kl.LAUNCH_DATE > si.REPORT_DATE) ;
                
alter table tmp_filter_data_table add index index_pos_id (pos_id asc);
alter table tmp_filter_data_table add index index_prod_id (store_prod_id asc);

CREATE TEMPORARY TABLE tmp_append_data_table ENGINE = MEMORY 
select store_prod_id From tmp_filter_data_table t1
group by t1.store_prod_id
having count(t1.store_prod_id) >= 8;

alter table tmp_append_data_table add index index_prod_id (store_prod_id asc);

START TRANSACTION;

-- truncate table nk_prepared_data;
delete from nk_prepared_data where quart = short_season;

insert into nk_prepared_data select t1.*, ifnull(vcdm.type, 'Non-CLC') clc_status, short_season QUART from tmp_filter_data_table t1,
(SELECT 
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
    UPPER(cdm.STATUS) = 'OPENED') vcdm
where vcdm.pos_id = t1.pos_id
and exists (
select 1 From tmp_append_data_table t2
where t1.store_prod_id = t2.store_prod_id);

iF t_error = 1 THEN
	ROLLBACK;
ELSE
	COMMIT;
END IF;

END Label_Outer;
//
DELIMITER ;
