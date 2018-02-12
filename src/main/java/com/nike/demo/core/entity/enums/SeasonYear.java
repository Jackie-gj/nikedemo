package com.nike.demo.core.entity.enums;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public enum SeasonYear {
	SU18("Summer 2018", 8, "2018"), SP18("Spring 2018", 7, "2018"), HO17("Winter 2017", 6, "2017"), FA17("Fall 2017", 5, "2017"), SU17("Summer 2017",
			4, "2017"), SP17("Spring 2017", 3, "2017"), HO16("Winter 2016", 2, "2016"), FA16("Fall 2016", 1, "2016");
	private String name;
	private int index;
	private String group;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	private SeasonYear(String name, int index) {
		this.name = name;
		this.index = index;
	}

	private SeasonYear(String name, int index, String group) {
		this.name = name;
		this.index = index;
		this.group = group;
	}

	public static String getName(int index) {
		for (SeasonYear c : SeasonYear.values()) {
			if (c.getIndex() == index) {
				return c.name;
			}
		}
		return null;
	}
	
	public static SeasonYear getByIndex(int index) {
		for (SeasonYear c : SeasonYear.values()) {
			if (c.getIndex() == index) {
				return c;
			}
		}
		return null;
	}
	
	public static JSONArray convertToJSONArray() {
		JSONArray retArray = new JSONArray();
		for(SeasonYear seasonYear : SeasonYear.values()) {
			Map<String, String> map = new HashMap<>();
			map.put("group", seasonYear.getGroup());
			map.put("text", seasonYear.getName());
			map.put("value", seasonYear.name());
			JSONObject object = JSONObject.fromObject(map);
			retArray.add(object);
		}
		return retArray;
	}
}
