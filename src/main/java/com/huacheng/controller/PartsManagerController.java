package com.huacheng.controller;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.huacheng.bean.Parts;
import com.huacheng.bean.PartsStore;
import com.huacheng.service.IPartsManagerService;
import com.huacheng.utils.Common;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsDateJsonValueProcessor;

/**
 * @author Bert
 *
 * @date 2016年7月13日
 *
 */
@Controller
@RequestMapping("partsManager/")
public class PartsManagerController {
	
	@Resource(name="partsManagerService")
	private IPartsManagerService service;
	
	@RequestMapping("findParts")
	public void selectParts(HttpServletRequest request,HttpServletResponse response)
	{
		try {
			Parts parts = getParts(request);
			String currentPage = request.getParameter("currentPage");
			if (currentPage==null || currentPage.equals("")) {
				currentPage = "0";
			}
			PageBounds page = new PageBounds(Integer.valueOf(currentPage), 10);
			List<Parts> findParts = service.findParts(parts,page);
			JSONArray result = JSONArray.fromObject(findParts);
			PrintWriter writer = response.getWriter();
			writer.println(result);
		} catch (Exception e) {
			System.err.println("find parts error:"+e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping("addParts")
	public void addParts(HttpServletRequest request,HttpServletResponse response)
	{
		try {
			String parsStr = request.getParameter("parts");
			JSONObject jsonParts = JSONObject.fromObject(parsStr);
			Parts parts = (Parts) JSONObject.toBean(jsonParts, Parts.class);
			service.addParts(parts);
			PrintWriter writer = response.getWriter();
			writer.println(JSONObject.fromObject("{result:\"success\"}"));
		} catch (Exception e) {
			System.out.println("add parts error:"+e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping("updateParts")
	public void updateParts(HttpServletRequest request,HttpServletResponse response){
		try {
			String partsStr = request.getParameter("parts");
			JSONObject jsonParts = JSONObject.fromObject(partsStr);
			Parts parts = (Parts) JSONObject.toBean(jsonParts, Parts.class);
			service.updateParts(parts);
			PrintWriter writer = response.getWriter();
			writer.println(JSONObject.fromObject("{result:\"success\"}"));
		} catch (Exception e) {
			System.out.println("update parts error:"+e.getMessage());
		}
	}
	
	@RequestMapping("deleteParts")
	public void deleteParts(HttpServletRequest request,HttpServletResponse response){
		try {
			String partsStr = request.getParameter("parts");
			JSONObject jsonParts = JSONObject.fromObject(partsStr);
			Parts parts = (Parts) JSONObject.toBean(jsonParts, Parts.class);
			service.deleteParts(parts);
			PrintWriter writer = response.getWriter();
			writer.println(JSONObject.fromObject("{result:\"success\"}"));
		} catch (Exception e) {
			System.out.println("delete parts error:"+e.getMessage());
		}
	}
	
	@RequestMapping("deleteStore")
	public void deleteStore(HttpServletRequest request,HttpServletResponse response){
		try {
			String store = request.getParameter("partsStore");
			JSONObject jsonParts = JSONObject.fromObject(store);
			PartsStore partsStore = (PartsStore) JSONObject.toBean(jsonParts, PartsStore.class);
			service.deleteStore(partsStore);
			PrintWriter writer = response.getWriter();
			writer.println(JSONObject.fromObject("{result:\"success\"}"));
		} catch (Exception e) {
			System.out.println("delete store error:"+e.getMessage());
		}
	}
	
	@RequestMapping("addStore")
	public void addPartsStore(HttpServletRequest request,HttpServletResponse response){
		try {
			long i = Common.SYSTEMTIME;
			String storeStr = request.getParameter("partsStore");
			JSONObject jsonStore = JSONObject.fromObject(storeStr);
			PartsStore store = (PartsStore) JSONObject.toBean(jsonStore, PartsStore.class);
			service.addPartsStore(store);
			PrintWriter writer = response.getWriter();
			writer.println(JSONObject.fromObject("{result:\"success\"}"));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	@RequestMapping("findPartsStore")
	public void findPartsStore(HttpServletRequest request,HttpServletResponse response)
	{
		try {
			String storeStr = request.getParameter("partsStore");
			String cp = request.getParameter("currentPage");
			if (cp==null || "".equals(cp)) {
				cp = "0";
			}
			PageBounds pb = new PageBounds(Integer.valueOf(cp),10);
			JSONObject jsonStore = JSONObject.fromObject(storeStr);
			PartsStore store = (PartsStore) JSONObject.toBean(jsonStore, PartsStore.class);
			List<PartsStore> findPartsStore = service.findPartsStore(store,pb);
			JsonConfig config = new JsonConfig();
			config.registerJsonValueProcessor(Date.class,new JsDateJsonValueProcessor());
			JSONArray result = JSONArray.fromObject(findPartsStore,config);
			PrintWriter writer = response.getWriter();
			writer.println(result);
		} catch (Exception e) {
			System.out.println("find partsStore fail："+e.getMessage());
		}
	}
	
	
	public static void main(String[] args) {
//		String json = "{\"partsId\":\"7\",\"increaseDate\":\"2016-01-07 14:14:03\",\"num\":\"1\",\"unitPrice\":\"1\",\"sellUnitPrice\":\"1\",\"description\":\"1\"}";
//		String[] dateFmts = new String[] { "yyyy/MM/dd", "yyyy-MM-dd HH:mm:ss" };
//		JSONUtils.getMorpherRegistry().registerMorpher(new DateMorpher(dateFmts));
//		JSONObject fromObject = JSONObject.fromObject(json);
//		Object bean = JSONObject.toBean(fromObject, PartsStore.class);
//		System.out.println(bean);
//		Calendar calendar = Calendar.getInstance();
	}
	

	
	private Parts getParts(HttpServletRequest request)
	{
		Parts parts = new Parts();
		String idstr = request.getParameter("id");
		if (idstr!=null && !"".equals(idstr)) {
			parts.setId(Long.valueOf(idstr));
		}
		parts.setName(request.getParameter("name"));
		parts.setPartsNo(request.getParameter("partsNo"));
		parts.setPositions(request.getParameter("positions"));
		parts.setDescription(request.getParameter("description"));
		return parts;
	}
	
}
