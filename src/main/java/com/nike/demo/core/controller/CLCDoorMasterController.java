package com.nike.demo.core.controller;

import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import com.nike.demo.core.entity.CLCDoorMaster;
import com.nike.demo.core.entity.PageBean;
import com.nike.demo.core.service.CLCDoorMasterService;
import com.nike.demo.core.util.ResponseUtil;
import com.opencsv.CSVReader;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/clcdoormaster")
public class CLCDoorMasterController {

	@Resource
	private CLCDoorMasterService clcDoorMasterService;
	private static final Logger log = Logger.getLogger(CLCDoorMasterController.class);
	private SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	@RequestMapping("/upload")
	public String upload(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("file") MultipartFile file) throws Exception {
		CSVReader csvReader = new CSVReader(new InputStreamReader(file.getInputStream()), ',', '\"', 2);

		clcDoorMasterService.deleteAll();
		List<CLCDoorMaster> clcDoorMasters = new ArrayList<CLCDoorMaster>();

		// option 2
		String[] nextLine;
		while ((nextLine = csvReader.readNext()) != null) {
			CLCDoorMaster clcDoorMaster = new CLCDoorMaster();
			clcDoorMaster.setPosIdNewPos(nextLine[26] == null ? "" : nextLine[26].replaceAll(",", ""));
			clcDoorMaster.setStatus(nextLine[1]);
			clcDoorMaster.setGlobalConcept(nextLine[5]);
			clcDoorMaster.setClcDoorCode(nextLine[0]);
			clcDoorMasters.add(clcDoorMaster);
			if (clcDoorMasters.size() == 1000) {
				clcDoorMasterService.addBatch2(clcDoorMasters);
				clcDoorMasters.clear();
			}
		}
		if (clcDoorMasters.size() > 0) {
			clcDoorMasterService.addBatch2(clcDoorMasters);
			clcDoorMasters.clear();
		}
		csvReader.close();
		return null;
	}

	@RequestMapping("/list")
	public String list(@RequestParam(value = "page", required = false) String page,
			@RequestParam(value = "rows", required = false) String rows, CLCDoorMaster clcDoorMaster, HttpServletResponse response)
			throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		if (page != null && rows != null) {
			PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
			map.put("start", pageBean.getStart());
			map.put("size", pageBean.getPageSize());
			map.put("status", clcDoorMaster.getStatus());
		}
		List<CLCDoorMaster> clcDoorMasters = clcDoorMasterService.findData(map);
		Long total = clcDoorMasterService.getTotalCount(map);
		JSONObject result = new JSONObject();
		JSONArray jsonArray = JSONArray.fromObject(clcDoorMasters);
		result.put("rows", jsonArray);
		result.put("total", total);
		log.info("request: list , map: " + map.toString());
		ResponseUtil.write(response, result);
		return null;
	}
}
