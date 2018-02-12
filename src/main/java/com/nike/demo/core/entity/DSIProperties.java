package com.nike.demo.core.entity;

public class DSIProperties {
	
	private String groupName;

    private String name;

    private String value;

    private Integer status;

    private String alias;
    
    private String columnName;
    
    private Integer columnWidth;

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName == null ? null : groupName.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value == null ? null : value.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias == null ? null : alias.trim();
    }
    
	public String getColumnName() {
		return columnName;
	}

	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}

	public Integer getColumnWidth() {
		return columnWidth;
	}

	public void setColumnWidth(Integer columnWidth) {
		this.columnWidth = columnWidth;
	}
    
	public DSIProperties(String groupName, String name, String value, String alias) {
		super();
		this.groupName = groupName;
		this.name = name;
		this.value = value;
		this.alias = alias;
		this.status = 1;
	}

	public DSIProperties(String groupName, String name, String value) {
		super();
		this.groupName = groupName;
		this.name = name;
		this.value = value;
		this.status = 1;
	}

	public DSIProperties(String groupName, String name, String value, Integer status, String alias) {
		super();
		this.groupName = groupName;
		this.name = name;
		this.value = value;
		this.status = status;
		this.alias = alias;
	}

	public DSIProperties() {
	}

}
