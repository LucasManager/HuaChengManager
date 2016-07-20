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
import com.huacheng.bean.LackParts;
import com.huacheng.service.ILackPartsManagerService;
import com.huacheng.utils.Common;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsDateJsonValueProcessor;

/**
 * @author Bert
 *
 * @date 2016年7月19日
 *
 */
@Controller
@RequestMapping("lackParts/")
public class LackPartsManagerController {

	@Resource(name="lackPartsManagerService")
	private ILackPartsManagerService service;
	
	@RequestMapping("findLackParts")
	public void findLackParts(HttpServletRequest request,HttpServletResponse response){
		
		try {
			LackParts parts = getlackParts(request, "lackParts");
			String currentPage = request.getParameter("currentPage");
			if (currentPage==null || "".equals(currentPage)) {
				currentPage = "0";
			}
			PageBounds pb = new PageBounds(Integer.valueOf(currentPage), 10);
			List<LackParts> findLackParts = service.findLackParts(parts,pb);
			JsonConfig config = new JsonConfig();
			config.registerJsonValueProcessor(Date.class,new JsDateJsonValueProcessor());
			JSONArray result = JSONArray.fromObject(findLackParts, config);
			PrintWriter writer = response.getWriter();
			writer.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("saveLackParts")
	public void saveLackParts(HttpServletRequest request,HttpServletResponse response){
		try {
			LackParts parts = getlackParts(request, "lackParts");
			if(parts.getCreateDate()==null){
				parts.setCreateDate(new Date());
			}
			service.addLackParts(parts);
			PrintWriter writer = response.getWriter();
			writer.println(JSONObject.fromObject("{result:\"success\"}"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("updateLackParts")
	public void updateLackParts(HttpServletRequest request,HttpServletResponse response){
		try {
			LackParts parts = getlackParts(request, "lackParts");
			service.updateLackParts(parts);
			PrintWriter writer = response.getWriter();
			writer.println(JSONObject.fromObject("{result:\"success\"}"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping("deleteLackParts")
	public void deleteLackParts(HttpServletRequest request,HttpServletResponse response){
		try {
			LackParts parts = getlackParts(request, "lackParts");
			service.deleteLackPartsById(parts.getId());
			PrintWriter writer = response.getWriter();
			writer.println(JSONObject.fromObject("{result:\"success\"}"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("changeStatus")
	public void setStatus(HttpServletRequest request,HttpServletResponse response){
		try {
			LackParts parts = getlackParts(request, "lackParts");
			parts.setStatus("1");
			service.updateLackPartsStatus(parts);
			PrintWriter writer = response.getWriter();
			writer.println(JSONObject.fromObject("{result:\"success\"}"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	private LackParts getlackParts(HttpServletRequest request,String paramName)
	{
		String str = request.getParameter(paramName);
		JSONObject json = JSONObject.fromObject(str);
		LackParts parts = (LackParts) JSONObject.toBean(json, LackParts.class);
		return parts;
	}
	
	
}
