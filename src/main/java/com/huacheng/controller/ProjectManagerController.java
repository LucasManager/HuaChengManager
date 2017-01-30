package com.huacheng.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.huacheng.bean.Car;
import com.huacheng.bean.Customer;
import com.huacheng.bean.Project;
import com.huacheng.bean.ProjectParts;
import com.huacheng.service.IProjectManagerService;
import com.huacheng.utils.VelocityUtils;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsDateJsonValueProcessor;
@Controller
@RequestMapping("project/")
public class ProjectManagerController{
	
	@Resource(name="projectManagerService")
	private IProjectManagerService service;

	@RequestMapping(value = "findProject", produces = "application/json;charset=UTF-8")
	public void findProject(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("project") String prs) throws Exception {
		PageBounds pb = getPB(request);
		JSONObject json = JSONObject.fromObject(prs);
		Project project = (Project) JSONObject.toBean(json, Project.class);
		List<Project> projects = service.findProject(project, pb);
		JsonConfig config = new JsonConfig();
		config.registerJsonValueProcessor(Date.class, new JsDateJsonValueProcessor());
		JSONArray fromObject = JSONArray.fromObject(projects, config);
		PrintWriter writer = response.getWriter();
		writer.println(fromObject);
	}

	@RequestMapping("saveProject")
	public void addProject(HttpServletRequest request,HttpServletResponse response){
		try {
			String str = request.getParameter("project");
			JSONObject json = JSONObject.fromObject(str);
			Map<String, Class> classMap = new HashMap<String, Class>();
			classMap.put("useParts", ProjectParts.class);
			Object bean = JSONObject.toBean(json, Project.class, classMap);
			Project project= (Project) bean;
			service.addProject(project);
			PrintWriter writer = response.getWriter();
			writer.print(JSONObject.fromObject("{result:\"success\"}"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("selectCusCar")
	public void selectCusCar(HttpServletRequest request,HttpServletResponse response){
		try {
			String str = request.getParameter("customer");
			JSONObject fromObject = JSONObject.fromObject(str);
			Customer customer = (Customer) JSONObject.toBean(fromObject,Customer.class);
			List<Car> findCarCus = service.findCarCus(customer, getPB(request));
			PrintWriter writer = response.getWriter();
			writer.print(JSONArray.fromObject(findCarCus));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("deleteProParts")
	@ResponseBody
	public String deleteProjectParts(@RequestParam("projectParts") String json) throws Exception {
		JSONObject jsonObject = JSONObject.fromObject(json);
		ProjectParts pparts = (ProjectParts) jsonObject.toBean(jsonObject, ProjectParts.class);
		service.deleteproParts(pparts);
		return "{\"result\":\"success\"}";
	}

	@RequestMapping("deleteProject")
	@ResponseBody
	public String deleteProject(@RequestParam("project") String json) throws Exception {
		JSONObject jsonObject = JSONObject.fromObject(json);
		Project p = (Project) jsonObject.toBean(jsonObject, Project.class);
		service.deleteProject(p);
		return "{\"result\":\"success\"}";
	}
	
	@RequestMapping("updateProject")
	@ResponseBody
	public String updateProject(@RequestParam("project") String projectStr) throws Exception {
		JSONObject json = JSONObject.fromObject(projectStr);
		Map<String, Class> classMap = new HashMap<String, Class>();
		classMap.put("useParts", ProjectParts.class);
		Project project = (Project) JSONObject.toBean(json, Project.class, classMap);
		service.updateProject(project);
		return "{\"result\":\"success\"}";
	}
	
	@RequestMapping("printContent")
	public void printContent(String projectId,HttpServletResponse response) throws Exception{
		PageBounds pb = new PageBounds(0, 10);;
		Project p = new Project();
		p.setId(Long.valueOf(projectId));
		List<Project> projects = service.findProject(p, pb);
		Map<String, Object> param = new HashMap<String, Object>();
		if (CollectionUtils.isNotEmpty(projects) && projects.size()>0) {
			p = projects.get(0);
			param.put("customer", p.getCustomer());
			param.put("car", p.getCar());
			DealParts(p.getUseParts());
			param.put("useParts", p.getUseParts());
			param.put("money", p.getLaborCharge()+p.getPartsCharge());
			param.put("chargePerson", p.getChargePerson());
		}
		System.out.println(this.getClass().getClassLoader().getResource("/").getPath());
		String htmlByTemplate = VelocityUtils.getHTMLByTemplate(this.getClass().getClassLoader().getResource("/").getPath()+"template/servicePrint.html", param);
		PrintWriter writer = response.getWriter();
		writer.print(htmlByTemplate);
	}

	private PageBounds getPB(HttpServletRequest request){
		String currentPage = request.getParameter("currentPage");
		if (currentPage==null || currentPage.equals("")) {
			currentPage = "0";
		}
		PageBounds page = new PageBounds(Integer.valueOf(currentPage), 10);
		return page;
	}
	
	private void DealParts(List<ProjectParts> list){
		if (CollectionUtils.isEmpty(list)) {
			list = new ArrayList<ProjectParts>();
		}
		if (list.size()<5) {
			int i = 5-list.size();
			for (int j = 0; j < i; j++) {
				list.add(new ProjectParts());
			}
		}
	}

}
