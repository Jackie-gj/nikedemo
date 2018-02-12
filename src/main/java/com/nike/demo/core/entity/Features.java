package com.nike.demo.core.entity;

import org.apache.commons.math3.ml.clustering.Clusterable;

public class Features implements Clusterable{
	private String storeProdId;

	private Double mean;
	
	private Double sd;
	
	private Integer diffsum;

	public String getStoreProdId() {
		return storeProdId;
	}

	public void setStoreProdId(String storeProdId) {
		this.storeProdId = storeProdId;
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

	public Features(String storeProdId, Double mean, Double sd, Integer diffsum) {
		super();
		this.storeProdId = storeProdId;
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
