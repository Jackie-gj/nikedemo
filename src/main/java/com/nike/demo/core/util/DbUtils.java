package com.nike.demo.core.util;

import java.util.Properties;

import weka.core.Instances;
import weka.experiment.InstanceQuery;

public class DbUtils {

	public static void main(String[] args) throws Exception {
		InstanceQuery instanceQuery = DbUtils.getQuery(
				"jdbc:mysql://localhost:3306/nike?useUnicode=true&characterEncoding=utf8&autoReconnect=true", "root",
				"123456");
		Instances instances = DbUtils.getData(instanceQuery, "select * from nk_prepared_data limit 1");
		System.out.println(instances);
	}

	public static InstanceQuery getQuery(String url, String user, String pwd) {
		InstanceQuery query = null;
		try {
			Properties properties = new Properties();
			properties.load(DbUtils.class.getClassLoader().getResourceAsStream("DatabaseUtils.props"));
			query = new InstanceQuery();
			query.initialize(properties);
			query.setDatabaseURL(url);
			query.setUsername(user);
			query.setPassword(pwd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return query;
	}

	public static Instances getData(InstanceQuery query, String sql) {
		Instances data = null;
		query.setQuery(sql);
		try {
			data = query.retrieveInstances();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}
}
