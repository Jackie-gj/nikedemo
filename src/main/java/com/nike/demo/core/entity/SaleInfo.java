package com.nike.demo.core.entity;

import java.math.BigDecimal;
import java.util.Date;

import com.opencsv.bean.CsvBindByName;

public class SaleInfo {
    private Integer saleId;

    @CsvBindByName(column="Store POS Id")
    private Integer storePosId;

    @CsvBindByName(column="Prod Code")
    private String prodCode;

    @CsvBindByName(column="Prod Long Name")
    private String prodLongName;

    @CsvBindByName(column="Net Sales Units")
    private Integer netSalesUnits;

    @CsvBindByName(column="Net Sales Amt")
    private Integer netSalesAmt;

    @CsvBindByName(column="Extended MSRP Sales Amt")
    private Integer extendedMsrpSalesAmt;

    private Date reportDate;
    
    private String storeProdId;
    
    private BigDecimal discount;

    public String getStoreProdId() {
		return storeProdId;
	}

	public void setStoreProdId(String storeProdId) {
		this.storeProdId = storeProdId;
	}

	public BigDecimal getDiscount() {
		return discount;
	}

	public void setDiscount(BigDecimal discount) {
		this.discount = discount;
	}

	public Integer getSaleId() {
        return saleId;
    }

    public void setSaleId(Integer saleId) {
        this.saleId = saleId;
    }

    public Integer getStorePosId() {
        return storePosId;
    }

    public void setStorePosId(Integer storePosId) {
        this.storePosId = storePosId;
    }

    public String getProdCode() {
        return prodCode;
    }

    public void setProdCode(String prodCode) {
        this.prodCode = prodCode == null ? null : prodCode.trim();
    }

    public String getProdLongName() {
        return prodLongName;
    }

    public void setProdLongName(String prodLongName) {
        this.prodLongName = prodLongName == null ? null : prodLongName.trim();
    }

    public Integer getNetSalesUnits() {
        return netSalesUnits;
    }

    public void setNetSalesUnits(Integer netSalesUnits) {
        this.netSalesUnits = netSalesUnits;
    }

    public Integer getNetSalesAmt() {
        return netSalesAmt;
    }

    public void setNetSalesAmt(Integer netSalesAmt) {
        this.netSalesAmt = netSalesAmt;
    }

    public Integer getExtendedMsrpSalesAmt() {
        return extendedMsrpSalesAmt;
    }

    public void setExtendedMsrpSalesAmt(Integer extendedMsrpSalesAmt) {
        this.extendedMsrpSalesAmt = extendedMsrpSalesAmt;
    }

    public Date getReportDate() {
        return reportDate;
    }

    public void setReportDate(Date reportDate) {
        this.reportDate = reportDate;
    }
}