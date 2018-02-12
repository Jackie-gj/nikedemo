package com.nike.demo.core.entity;

import java.math.BigDecimal;
import java.util.Date;

import com.opencsv.bean.CsvBindByName;
import com.opencsv.bean.CsvDate;

public class ProductMaster {
    @CsvBindByName(column="MATL_NBR")
    private String matlNbr;

    @CsvBindByName(column="SEASON")
    private String season;

    @CsvBindByName(column="STYLE_CD")
    private String styleCd;

    @CsvBindByName(column="PROD_ENGN_DESC")
    private String prodEngnDesc;

    @CsvBindByName(column="MATL_LONG_NM")
    private String matlLongNm;

    @CsvBindByName(column="COLOR_CD")
    private String colorCd;

    @CsvBindByName(column="COLOR_DESC")
    private String colorDesc;
    
    @CsvBindByName(column="GBL_CAT_SUM_LONG_DESC")
    private String gblCatSumLongDesc;

    @CsvBindByName(column="GBL_CAT_CORE_FOCS_LONG_DESC")
    private String gblCatCoreFocsLongDesc;

    @CsvBindByName(column="GBL_PROD_SUB_CAT_LONG_DESC")
    private String gblProdSubCatLongDesc;

    @CsvBindByName(column="SUB_CAT_DESC")
    private String subCatDesc;

    @CsvBindByName(column="REG_CAT_LONG_DESC_SLS_ORG")
    private String regCatLongDescSlsOrg;

    @CsvBindByName(column="GNDR_GROUP_NM")
    private String gndrGroupNm;

    @CsvBindByName(column="Gender_Details")
    private String genderDetails;

    @CsvBindByName(column="KIDS_AGE")
    private String kidsAge;

    @CsvBindByName(column="GBL_SILH_LONG_DESC")
    private String gblSilhLongDesc;
    
    @CsvBindByName(column="GBL_SILH_SHRT_DESC")
    private String gblSilhShrtDesc;

    @CsvBindByName(column="TOP_BOTTOM")
    private String topBottom;

    @CsvBindByName(column="REG_MSRP")
    private BigDecimal regMsrp;

    @CsvBindByName(column="MODEL")
    private String model;

    @CsvBindByName(column="BM_CLASSIFICATION")
    private String bmClassification;

    @CsvBindByName(column="BM_CLASSIFICATION_DETAIL")
    private String bmClassificationDetail;

    @CsvBindByName(column="FTW_PLATFORM")
    private String ftwPlatform;

    @CsvBindByName(column="EQP_Product_Type")
    private String eqpProductType;

    @CsvBindByName(column="REG_3PE_CAT")
    private String reg3peCat;

    @CsvBindByName(column="OMD")
    @CsvDate("dd/MM/yyyy")
    private Date omd;

    @CsvBindByName(column="SILO")
    private String silo;

    @CsvBindByName(column="BRAND_STORY_NM")
    private String brandStoryNm;

    @CsvBindByName(column="CTRY_RETAIL_SIZE_RANGE")
    private String ctryRetailSizeRange;

    @CsvBindByName(column="ICON_FRANCHISE")
    private String iconFranchise;

    @CsvBindByName(column="PRIMARY_STORY")
    private String primaryStory;

    @CsvBindByName(column="SECONDARY_STORY")
    private String secondaryStory;

    @CsvBindByName(column="SEASONAL_STORY")
    private String seasonalStory;

    @CsvBindByName(column="RETAIL_MATL_PRC_ZONE")
    private String retailMatlPrcZone;
    
    private String searchOn;

    public String getSearchOn() {
		return searchOn;
	}

	public void setSearchOn(String searchOn) {
		this.searchOn = searchOn;
	}

	public String getMatlNbr() {
        return matlNbr;
    }

    public void setMatlNbr(String matlNbr) {
        this.matlNbr = matlNbr == null ? null : matlNbr.trim();
    }

    public String getSeason() {
        return season;
    }

    public void setSeason(String season) {
        this.season = season == null ? null : season.trim();
    }

    public String getStyleCd() {
        return styleCd;
    }

    public void setStyleCd(String styleCd) {
        this.styleCd = styleCd == null ? null : styleCd.trim();
    }

    public String getProdEngnDesc() {
        return prodEngnDesc;
    }

    public void setProdEngnDesc(String prodEngnDesc) {
        this.prodEngnDesc = prodEngnDesc == null ? null : prodEngnDesc.trim();
    }

    public String getMatlLongNm() {
        return matlLongNm;
    }

    public void setMatlLongNm(String matlLongNm) {
        this.matlLongNm = matlLongNm == null ? null : matlLongNm.trim();
    }

    public String getColorCd() {
        return colorCd;
    }

    public void setColorCd(String colorCd) {
        this.colorCd = colorCd == null ? null : colorCd.trim();
    }

    public String getColorDesc() {
        return colorDesc;
    }

    public void setColorDesc(String colorDesc) {
        this.colorDesc = colorDesc == null ? null : colorDesc.trim();
    }

    public String getGblCatSumLongDesc() {
        return gblCatSumLongDesc;
    }

    public void setGblCatSumLongDesc(String gblCatSumLongDesc) {
        this.gblCatSumLongDesc = gblCatSumLongDesc == null ? null : gblCatSumLongDesc.trim();
    }

    public String getGblCatCoreFocsLongDesc() {
        return gblCatCoreFocsLongDesc;
    }

    public void setGblCatCoreFocsLongDesc(String gblCatCoreFocsLongDesc) {
        this.gblCatCoreFocsLongDesc = gblCatCoreFocsLongDesc == null ? null : gblCatCoreFocsLongDesc.trim();
    }

    public String getGblProdSubCatLongDesc() {
        return gblProdSubCatLongDesc;
    }

    public void setGblProdSubCatLongDesc(String gblProdSubCatLongDesc) {
        this.gblProdSubCatLongDesc = gblProdSubCatLongDesc == null ? null : gblProdSubCatLongDesc.trim();
    }

    public String getSubCatDesc() {
        return subCatDesc;
    }

    public void setSubCatDesc(String subCatDesc) {
        this.subCatDesc = subCatDesc == null ? null : subCatDesc.trim();
    }

    public String getRegCatLongDescSlsOrg() {
        return regCatLongDescSlsOrg;
    }

    public void setRegCatLongDescSlsOrg(String regCatLongDescSlsOrg) {
        this.regCatLongDescSlsOrg = regCatLongDescSlsOrg == null ? null : regCatLongDescSlsOrg.trim();
    }

    public String getGndrGroupNm() {
        return gndrGroupNm;
    }

    public void setGndrGroupNm(String gndrGroupNm) {
        this.gndrGroupNm = gndrGroupNm == null ? null : gndrGroupNm.trim();
    }

    public String getGenderDetails() {
        return genderDetails;
    }

    public void setGenderDetails(String genderDetails) {
        this.genderDetails = genderDetails == null ? null : genderDetails.trim();
    }

    public String getKidsAge() {
        return kidsAge;
    }

    public void setKidsAge(String kidsAge) {
        this.kidsAge = kidsAge == null ? null : kidsAge.trim();
    }

    public String getGblSilhLongDesc() {
        return gblSilhLongDesc;
    }

    public void setGblSilhLongDesc(String gblSilhLongDesc) {
        this.gblSilhLongDesc = gblSilhLongDesc == null ? null : gblSilhLongDesc.trim();
    }

    public String getGblSilhShrtDesc() {
        return gblSilhShrtDesc;
    }

    public void setGblSilhShrtDesc(String gblSilhShrtDesc) {
        this.gblSilhShrtDesc = gblSilhShrtDesc == null ? null : gblSilhShrtDesc.trim();
    }

    public String getTopBottom() {
        return topBottom;
    }

    public void setTopBottom(String topBottom) {
        this.topBottom = topBottom == null ? null : topBottom.trim();
    }

    public BigDecimal getRegMsrp() {
        return regMsrp;
    }

    public void setRegMsrp(BigDecimal regMsrp) {
        this.regMsrp = regMsrp;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model == null ? null : model.trim();
    }

    public String getBmClassification() {
        return bmClassification;
    }

    public void setBmClassification(String bmClassification) {
        this.bmClassification = bmClassification == null ? null : bmClassification.trim();
    }

    public String getBmClassificationDetail() {
        return bmClassificationDetail;
    }

    public void setBmClassificationDetail(String bmClassificationDetail) {
        this.bmClassificationDetail = bmClassificationDetail == null ? null : bmClassificationDetail.trim();
    }

    public String getFtwPlatform() {
        return ftwPlatform;
    }

    public void setFtwPlatform(String ftwPlatform) {
        this.ftwPlatform = ftwPlatform == null ? null : ftwPlatform.trim();
    }

    public String getEqpProductType() {
        return eqpProductType;
    }

    public void setEqpProductType(String eqpProductType) {
        this.eqpProductType = eqpProductType == null ? null : eqpProductType.trim();
    }

    public String getReg3peCat() {
        return reg3peCat;
    }

    public void setReg3peCat(String reg3peCat) {
        this.reg3peCat = reg3peCat == null ? null : reg3peCat.trim();
    }

    public Date getOmd() {
        return omd;
    }

    public void setOmd(Date omd) {
        this.omd = omd;
    }

    public String getSilo() {
        return silo;
    }

    public void setSilo(String silo) {
        this.silo = silo == null ? null : silo.trim();
    }

    public String getBrandStoryNm() {
        return brandStoryNm;
    }

    public void setBrandStoryNm(String brandStoryNm) {
        this.brandStoryNm = brandStoryNm == null ? null : brandStoryNm.trim();
    }

    public String getCtryRetailSizeRange() {
        return ctryRetailSizeRange;
    }

    public void setCtryRetailSizeRange(String ctryRetailSizeRange) {
        this.ctryRetailSizeRange = ctryRetailSizeRange == null ? null : ctryRetailSizeRange.trim();
    }

    public String getIconFranchise() {
        return iconFranchise;
    }

    public void setIconFranchise(String iconFranchise) {
        this.iconFranchise = iconFranchise == null ? null : iconFranchise.trim();
    }

    public String getPrimaryStory() {
        return primaryStory;
    }

    public void setPrimaryStory(String primaryStory) {
        this.primaryStory = primaryStory == null ? null : primaryStory.trim();
    }

    public String getSecondaryStory() {
        return secondaryStory;
    }

    public void setSecondaryStory(String secondaryStory) {
        this.secondaryStory = secondaryStory == null ? null : secondaryStory.trim();
    }

    public String getSeasonalStory() {
        return seasonalStory;
    }

    public void setSeasonalStory(String seasonalStory) {
        this.seasonalStory = seasonalStory == null ? null : seasonalStory.trim();
    }

    public String getRetailMatlPrcZone() {
        return retailMatlPrcZone;
    }

    public void setRetailMatlPrcZone(String retailMatlPrcZone) {
        this.retailMatlPrcZone = retailMatlPrcZone == null ? null : retailMatlPrcZone.trim();
    }
}