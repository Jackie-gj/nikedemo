package com.nike.demo.core.controller;

import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.nike.demo.core.entity.PageBean;
import com.nike.demo.core.entity.SaleInfo;
import com.nike.demo.core.service.SaleInfoService;
import com.nike.demo.core.util.ResponseUtil;
import com.nike.demo.core.util.StringUtil;
import com.opencsv.CSVReader;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/saleinfo")
public class SaleInfoController {

	@Resource
	private SaleInfoService saleInfoService;
	private static final Logger log = Logger.getLogger(SaleInfoController.class);
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	private DecimalFormat df = new DecimalFormat("##.0000");

	@RequestMapping("/upload")
	public String upload(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("files") MultipartFile[] files) throws Exception {

		for (MultipartFile file : files) {
			if (file.isEmpty()) {
				continue;
			}
			CSVReader csvReader = new CSVReader(new InputStreamReader(file.getInputStream()), ',', '\"', 1);
			// storeMasterService.deleteAll();
			List<SaleInfo> saleInfos = new ArrayList<SaleInfo>();
			String filename = file.getOriginalFilename();
			filename = filename.substring(0, filename.indexOf('.'));
			Date reportDate = sdf.parse(filename);
			String[] nextLine;
			while ((nextLine = csvReader.readNext()) != null) {
				SaleInfo saleInfo = new SaleInfo();
				saleInfo.setStorePosId(nextLine[0] == null ? 0 : Integer.parseInt(nextLine[0]));
				saleInfo.setProdCode(nextLine[1] == null ? "" : nextLine[1].replaceAll(" ", ""));
				saleInfo.setStoreProdId(new StringBuilder(16).append(saleInfo.getStorePosId()).append("_").append(saleInfo.getProdCode()).toString());
				saleInfo.setProdLongName(nextLine[2]);
				saleInfo.setNetSalesUnits(parseNumberString(nextLine[3]));
				saleInfo.setNetSalesAmt(parseNumberString(nextLine[4]));
				saleInfo.setExtendedMsrpSalesAmt(parseNumberString(nextLine[5]));
				BigDecimal discount = null == saleInfo.getExtendedMsrpSalesAmt()
						|| 0 == saleInfo.getExtendedMsrpSalesAmt() ? new BigDecimal(0)
								: new BigDecimal(
										df.format((double) saleInfo.getNetSalesAmt() / saleInfo.getExtendedMsrpSalesAmt()));
				saleInfo.setDiscount(discount);
				try {
					saleInfo.setReportDate(reportDate);
				} catch (Exception e) {
					saleInfo.setReportDate(null);
				}
				saleInfos.add(saleInfo);
				if (saleInfos.size() == 1000) {
					saleInfoService.addBatch2(saleInfos);
					saleInfos.clear();
				}
			}
			if (saleInfos.size() > 0) {
				saleInfoService.addBatch2(saleInfos);
				saleInfos.clear();
			}
			csvReader.close();
		}
		return null;
	}

	@RequestMapping("/list")
	public String list(@RequestParam(value = "page", required = false) String page,
			@RequestParam(value = "rows", required = false) String rows, SaleInfo saleInfo,
			HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		if (page != null && rows != null) {
			PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
			map.put("start", pageBean.getStart());
			map.put("size", pageBean.getPageSize());
			map.put("reportDate", saleInfo.getReportDate());
		}
		List<SaleInfo> saleInfoList = saleInfoService.findData(map);
		Long total = saleInfoService.getTotalCount(map);
		JSONObject result = new JSONObject();
		JSONArray jsonArray = JSONArray.fromObject(saleInfoList);
		result.put("rows", jsonArray);
		result.put("total", total);
		log.info("request: list , map: " + map.toString());
		ResponseUtil.write(response, result);
		return null;
	}

	private int parseNumberString(String numberString) {
		if (StringUtil.isEmpty(numberString)) {
			return 0;
		} else {
			numberString = numberString.replaceAll(",", "");
			if (-1 != numberString.indexOf('.')) {
				numberString = numberString.substring(0, numberString.indexOf('.'));
			}
			return Integer.parseInt(numberString);
		}
	}
}
