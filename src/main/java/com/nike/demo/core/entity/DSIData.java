package com.nike.demo.core.entity;

import java.util.Arrays;

public class DSIData {

	private String property1;

	private String property2;

	private String property3;

	private String property4;

	private String property5;

	private String property6;

	private String property7;

	private String property8;

	private String property9;

	private String property10;

	private String property11;

	private String property12;

	private String property13;

	private String[] properties;

	private String cluster;

	private Double mean;

	private Double sd;

	private Integer diffsum;

	private Integer sampSize;

	private Integer salesNum;

	public String getProperty1() {
		return property1;
	}

	public void setProperty1(String property1) {
		this.property1 = property1;
	}

	public String getProperty2() {
		return property2;
	}

	public void setProperty2(String property2) {
		this.property2 = property2;
	}

	public String getProperty3() {
		return property3;
	}

	public void setProperty3(String property3) {
		this.property3 = property3;
	}

	public String getProperty4() {
		return property4;
	}

	public void setProperty4(String property4) {
		this.property4 = property4;
	}

	public String getProperty5() {
		return property5;
	}

	public void setProperty5(String property5) {
		this.property5 = property5;
	}

	public String getProperty6() {
		return property6;
	}

	public void setProperty6(String property6) {
		this.property6 = property6;
	}

	public String getProperty7() {
		return property7;
	}

	public void setProperty7(String property7) {
		this.property7 = property7;
	}

	public String getProperty8() {
		return property8;
	}

	public void setProperty8(String property8) {
		this.property8 = property8;
	}

	public String[] getProperties() {
		return properties;
	}

	public void setProperties(String[] properties) {
		this.properties = properties;
	}

	public String getCluster() {
		return cluster;
	}

	public void setCluster(String cluster) {
		this.cluster = cluster;
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

	public Integer getSampSize() {
		return sampSize;
	}

	public void setSampSize(Integer sampSize) {
		this.sampSize = sampSize;
	}

	public Integer getSalesNum() {
		return salesNum;
	}

	public void setSalesNum(Integer salesNum) {
		this.salesNum = salesNum;
	}

	public String getProperty9() {
		return property9;
	}

	public void setProperty9(String property9) {
		this.property9 = property9;
	}

	public String getProperty10() {
		return property10;
	}

	public void setProperty10(String property10) {
		this.property10 = property10;
	}

	public String getProperty11() {
		return property11;
	}

	public void setProperty11(String property11) {
		this.property11 = property11;
	}

	public String getProperty12() {
		return property12;
	}

	public void setProperty12(String property12) {
		this.property12 = property12;
	}

	public String getProperty13() {
		return property13;
	}

	public void setProperty13(String property13) {
		this.property13 = property13;
	}

	public DSIData(String property1, String property2, String property3, String property4, String property5,
			String property6, String[] properties) {
		super();
		this.property1 = property1;
		this.property2 = property2;
		this.property3 = property3;
		this.property4 = property4;
		this.property5 = property5;
		this.property6 = property6;
		String[] newProperties = new String[properties.length];
		System.arraycopy(properties, 0, newProperties, 0, properties.length);
		this.properties = newProperties;
	}

	public DSIData(String property1, String property2, String property3, String property4, String property5,
			String property6, String property7, String property8, String property9, String property10,
			String property11, String property12, String property13, String[] properties) {
		super();
		this.property1 = property1;
		this.property2 = property2;
		this.property3 = property3;
		this.property4 = property4;
		this.property5 = property5;
		this.property6 = property6;
		this.property7 = property7;
		this.property8 = property8;
		this.property9 = property9;
		this.property10 = property10;
		this.property11 = property11;
		this.property12 = property12;
		this.property13 = property13;
		String[] newProperties = new String[properties.length];
		System.arraycopy(properties, 0, newProperties, 0, properties.length);
		this.properties = newProperties;
	}

	public DSIData() {
	}

	public DSIData clone() {
		return new DSIData(property1, property2, property3, property4, property5, property6, property7, property8,
				property9, property10, property11, property12, property13, properties);
	}

	@Override
	public String toString() {
		return "DSIData [property1=" + property1 + ", property2=" + property2 + ", property3=" + property3
				+ ", property4=" + property4 + ", property5=" + property5 + ", property6=" + property6 + ", property7="
				+ property7 + ", property8=" + property8 + ", property9=" + property9 + ", property10=" + property10
				+ ", property11=" + property11 + ", property12=" + property12 + ", property13=" + property13
				+ ", properties=" + Arrays.toString(properties) + ", cluster=" + cluster + ", mean=" + mean + ", sd="
				+ sd + ", diffsum=" + diffsum + ", sampSize=" + sampSize + ", salesNum=" + salesNum + "]";
	}

}
