package com.nike.demo.core.entity;

import java.math.BigDecimal;

public class PropImportance {
    private String property;

    private BigDecimal importance;

    public String getProperty() {
        return property;
    }

    public void setProperty(String property) {
        this.property = property == null ? null : property.trim();
    }

    public BigDecimal getImportance() {
        return importance;
    }

    public void setImportance(BigDecimal importance) {
        this.importance = importance;
    }
}