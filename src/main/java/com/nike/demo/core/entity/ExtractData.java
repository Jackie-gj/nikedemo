package com.nike.demo.core.entity;

import java.math.BigDecimal;

import org.apache.commons.math3.ml.clustering.Clusterable;

public class ExtractData implements Clusterable {
    private String storeProdId;

    private Long weekno;

    private Integer netSalesUnits;

    private String prodId;

    private String colorMain;

    private String gblCatSumLongDesc;

    private String ctgyPtfm;

    private String gndrGroupNm;

    private String gblSilhLongDesc;

    private BigDecimal regMsrp;
    
    private String price;

    private String ftwPlatform;

    private String iconFranchise;

    private Integer posId;

    private String storeRecordType;

    private String subTerritory;

    private String storeEnvironmentDescription;

    private String salesAreaNames;

    private Integer storeCityTierNumber;

    private String storeLeadCategory;

    private String abbrevOwnerGroupName;

    private String tradeZone;

    private String storeType;

    private String clcStatus;

    private String quart;
    
	private Double mean;
	
	private Double sd;
	
	private Integer diffsum;
	
	private String cluster;

    public String getStoreProdId() {
        return storeProdId;
    }

    public void setStoreProdId(String storeProdId) {
        this.storeProdId = storeProdId == null ? null : storeProdId.trim();
    }

    public Long getWeekno() {
        return weekno;
    }

    public void setWeekno(Long weekno) {
        this.weekno = weekno;
    }

    public Integer getNetSalesUnits() {
        return netSalesUnits;
    }

    public void setNetSalesUnits(Integer netSalesUnits) {
        this.netSalesUnits = netSalesUnits;
    }

    public String getProdId() {
        return prodId;
    }

    public void setProdId(String prodId) {
        this.prodId = prodId == null ? null : prodId.trim();
    }

    public String getColorMain() {
        return colorMain;
    }

    public void setColorMain(String colorMain) {
        this.colorMain = colorMain == null ? null : colorMain.trim();
    }

    public String getGblCatSumLongDesc() {
        return gblCatSumLongDesc;
    }

    public void setGblCatSumLongDesc(String gblCatSumLongDesc) {
        this.gblCatSumLongDesc = gblCatSumLongDesc == null ? null : gblCatSumLongDesc.trim();
    }

    public String getCtgyPtfm() {
        return ctgyPtfm;
    }

    public void setCtgyPtfm(String ctgyPtfm) {
        this.ctgyPtfm = ctgyPtfm == null ? null : ctgyPtfm.trim();
    }

    public String getGndrGroupNm() {
        return gndrGroupNm;
    }

    public void setGndrGroupNm(String gndrGroupNm) {
        this.gndrGroupNm = gndrGroupNm == null ? null : gndrGroupNm.trim();
    }

    public String getGblSilhLongDesc() {
        return gblSilhLongDesc;
    }

    public void setGblSilhLongDesc(String gblSilhLongDesc) {
        this.gblSilhLongDesc = gblSilhLongDesc == null ? null : gblSilhLongDesc.trim();
    }

    public BigDecimal getRegMsrp() {
        return regMsrp;
    }

    public void setRegMsrp(BigDecimal regMsrp) {
        this.regMsrp = regMsrp;
    }

    public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getFtwPlatform() {
        return ftwPlatform;
    }

    public void setFtwPlatform(String ftwPlatform) {
        this.ftwPlatform = ftwPlatform == null ? null : ftwPlatform.trim();
    }

    public String getIconFranchise() {
        return iconFranchise;
    }

    public void setIconFranchise(String iconFranchise) {
        this.iconFranchise = iconFranchise == null ? null : iconFranchise.trim();
    }

    public Integer getPosId() {
        return posId;
    }

    public void setPosId(Integer posId) {
        this.posId = posId;
    }

    public String getStoreRecordType() {
        return storeRecordType;
    }

    public void setStoreRecordType(String storeRecordType) {
        this.storeRecordType = storeRecordType == null ? null : storeRecordType.trim();
    }

    public String getSubTerritory() {
        return subTerritory;
    }

    public void setSubTerritory(String subTerritory) {
        this.subTerritory = subTerritory == null ? null : subTerritory.trim();
    }

    public String getStoreEnvironmentDescription() {
        return storeEnvironmentDescription;
    }

    public void setStoreEnvironmentDescription(String storeEnvironmentDescription) {
        this.storeEnvironmentDescription = storeEnvironmentDescription == null ? null : storeEnvironmentDescription.trim();
    }

    public String getSalesAreaNames() {
        return salesAreaNames;
    }

    public void setSalesAreaNames(String salesAreaNames) {
        this.salesAreaNames = salesAreaNames == null ? null : salesAreaNames.trim();
    }

    public Integer getStoreCityTierNumber() {
        return storeCityTierNumber;
    }

    public void setStoreCityTierNumber(Integer storeCityTierNumber) {
        this.storeCityTierNumber = storeCityTierNumber;
    }

    public String getStoreLeadCategory() {
        return storeLeadCategory;
    }

    public void setStoreLeadCategory(String storeLeadCategory) {
        this.storeLeadCategory = storeLeadCategory == null ? null : storeLeadCategory.trim();
    }

    public String getAbbrevOwnerGroupName() {
        return abbrevOwnerGroupName;
    }

    public void setAbbrevOwnerGroupName(String abbrevOwnerGroupName) {
        this.abbrevOwnerGroupName = abbrevOwnerGroupName == null ? null : abbrevOwnerGroupName.trim();
    }

    public String getTradeZone() {
        return tradeZone;
    }

    public void setTradeZone(String tradeZone) {
        this.tradeZone = tradeZone == null ? null : tradeZone.trim();
    }

    public String getStoreType() {
        return storeType;
    }

    public void setStoreType(String storeType) {
        this.storeType = storeType == null ? null : storeType.trim();
    }

    public String getClcStatus() {
        return clcStatus;
    }

    public void setClcStatus(String clcStatus) {
        this.clcStatus = clcStatus == null ? null : clcStatus.trim();
    }

    public String getQuart() {
        return quart;
    }

    public void setQuart(String quart) {
        this.quart = quart == null ? null : quart.trim();
    }

	public Double getMean() {
		return mean;
	}

	public void setMean(Double mean) {
		this.mean = mean;
	}

	public Double getSd() {
		return sd;
	}

	public void setSd(Double sd) {
		this.sd = sd;
	}

	public Integer getDiffsum() {
		return diffsum;
	}

	public void setDiffsum(Integer diffsum) {
		this.diffsum = diffsum;
	}
	
	public String getCluster() {
		return cluster;
	}

	public void setCluster(String cluster) {
		this.cluster = cluster;
	}

	public void fillInFeatures(Double mean, Double sd, Integer diffsum) {
		this.mean = mean;
		this.sd = sd;
		this.diffsum = diffsum;
	}

	@Override
	public double[] getPoint() {
		double[] point = {this.mean, this.sd, this.diffsum};
		return point;
	}
    
}