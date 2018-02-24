package com.nike.demo.core.service.processor;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.List;

import org.apache.log4j.Logger;

import com.opencsv.CSVWriter;
import com.opencsv.bean.ColumnPositionMappingStrategy;
import com.opencsv.bean.StatefulBeanToCsv;
import com.opencsv.bean.StatefulBeanToCsvBuilder;

public class CSVWriterProcessor<T> implements Runnable {

	private List<T> outputDataList;

	private String fileName;
	
	private String[] headers;
	
	private ColumnPositionMappingStrategy<T> mapper;

	private static final Logger log = Logger.getLogger(CSVWriterProcessor.class);

	public CSVWriterProcessor(List<T> outputDataList, String fileName) {
		this.outputDataList = outputDataList;
		this.fileName = fileName;
	}

	@Override
	public void run() {
		Writer writer = null;
		CSVWriter csvWriter = null;
		try {
//			writer = new FileWriter(fileName);
			writer = new OutputStreamWriter(new FileOutputStream(fileName), "UTF-8");
			csvWriter = new CSVWriter(writer, CSVWriter.DEFAULT_SEPARATOR, CSVWriter.NO_QUOTE_CHARACTER,
					CSVWriter.DEFAULT_ESCAPE_CHARACTER, CSVWriter.DEFAULT_LINE_END);
			StatefulBeanToCsvBuilder<T> builder = new StatefulBeanToCsvBuilder<T>(writer);
			if (null != mapper) {
				builder.withMappingStrategy(mapper);
			}
			if (null != headers && 0 != headers.length) {
				csvWriter.writeNext(headers);
			}
			StatefulBeanToCsv<T> beanToCsv = builder.build();
			beanToCsv.write(outputDataList);
		} catch (Exception e) {
			log.error(e);
		} finally {
			if (null != csvWriter) {
				try {
					csvWriter.close();
				} catch (IOException e) {
				}
			}
			if (null != writer) {
				try {
					writer.close();
				} catch (IOException e) {
				}
			}
		}

	}

	public CSVWriterProcessor() {
	}

	public void setMapper(ColumnPositionMappingStrategy<T> mapper) {
		this.mapper = mapper;
	}

	public void setHeaders(String[] headers) {
		this.headers = headers;
	}
	
}
