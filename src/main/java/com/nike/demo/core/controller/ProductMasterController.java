package com.nike.demo.core.controller;

import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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
import com.nike.demo.core.entity.ProductMaster;
import com.nike.demo.core.service.ProductMasterService;
import com.nike.demo.core.util.ResponseUtil;
import com.opencsv.bean.CsvToBean;
import com.opencsv.bean.CsvToBeanBuilder;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/productmaster")
public class ProductMasterController {
	
	@Resource
	private ProductMasterService productMasterService;
	private static final Logger log = Logger.getLogger(ProductMasterController.class);
	private SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

    /**
     *
     *
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/upload")
    public String upload(HttpServletRequest request, HttpServletResponse response, @RequestParam("file") MultipartFile file) throws Exception {
//    	CSVReader csvReader = new CSVReader(new InputStreamReader(file.getInputStream()), ',', '\"', 1);
//    	csvReader.readAll();
    	
    	productMasterService.deleteAll();
    	List<ProductMaster> productMasters = new ArrayList<ProductMaster>();
    	
    	// option 1
    	CsvToBean<ProductMaster> csvToBean = new CsvToBeanBuilder<ProductMaster>(new InputStreamReader(file.getInputStream()))
    		       .withType(ProductMaster.class)
    		       .build();
    	    	
    	Iterator<ProductMaster> iterator = csvToBean.iterator();
    	for(;iterator.hasNext();) {
    		ProductMaster productMaster = iterator.next();
    		productMasters.add(productMaster);
    		if (productMasters.size() == 1000) {
        		productMasterService.addBatch2(productMasters);
        		productMasters.clear();
        	}
    	}
    	if (productMasters.size() > 0) {
    		productMasterService.addBatch2(productMasters);
    		productMasters.clear();
    	}
    	
    	// option 2
//    	String [] nextLine;
//        while ((nextLine = csvReader.readNext()) != null) {
//        	ProductMaster productMaster = new ProductMaster();
//        	productMaster.setOmd(sdf.parse(nextLine[25]));
//        	productMaster.setMatlNbr(nextLine[0]);
//        	productMaster.setSeason(nextLine[1]);
//        	productMaster.setStyleCd(nextLine[2]);
//        	productMaster.setProdEngnDesc(nextLine[3]);
//        	productMaster.setMatlLongNm(nextLine[4]);
//        	productMaster.setColorCd(nextLine[5]);
//        	productMasters.add(productMaster);
//        	if (productMasters.size() == 100) {
//        		productMasterService.addBatch2(productMasters);
//        		productMasters.clear();
//        	}
//        }
//        if (productMasters.size() > 0) {
//    		productMasterService.addBatch2(productMasters);
//    		productMasters.clear();
//    	}
        
        //option 3
//    	List<ProductMaster> beans = new CsvToBeanBuilder<ProductMaster>(new InputStreamReader(file.getInputStream()))
//    		       .withType(ProductMaster.class)
//    		       .build()
//    		       .parse();
//    	productMasterService.addBatch(beans);
//    	for (ProductMaster productMaster : beans) {
//    		productMasterService.add(productMaster);
//		}
//        csvReader.close();
        return null;
    }
    
    /**
	 * 查找相应的数据集合
	 * 
	 * @param page
	 * @param rows
	 * @param picture
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list")
	public String list(
			@RequestParam(value = "page", required = false) String page,
			@RequestParam(value = "rows", required = false) String rows,
			ProductMaster productMaster, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		if (page != null && rows != null) {
			PageBean pageBean = new PageBean(Integer.parseInt(page),
					Integer.parseInt(rows));
			map.put("start", pageBean.getStart());
			map.put("size", pageBean.getPageSize());
			map.put("season", productMaster.getSearchOn());
			map.put("prodEngnDesc", productMaster.getSearchOn());
		}
		List<ProductMaster> productMasterList = productMasterService.findData(map);
		Long total = productMasterService.getTotalCount(map);
		JSONObject result = new JSONObject();
		JSONArray jsonArray = JSONArray.fromObject(productMasterList);
		result.put("rows", jsonArray);
		result.put("total", total);
		log.info("request: list , map: " + map.toString());
		ResponseUtil.write(response, result);
		return null;
	}
}
