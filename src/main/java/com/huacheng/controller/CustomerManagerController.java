package com.huacheng.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.huacheng.bean.Car;
import com.huacheng.bean.Customer;
import com.huacheng.service.ICustomerManagerService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsDateJsonValueProcessor;

/**
 * @author Bert
 *
 * @date 2016年7月8日
 *
 */
@Controller
@RequestMapping("/customerManager")
public class CustomerManagerController {
	
	@Resource(name = "customerManagerServiceImpl")
	private ICustomerManagerService service;
	
	
	@RequestMapping("/addCustomer")
	public void addCustomer(HttpServletRequest request,HttpServletResponse response)
	{
		PrintWriter writer = null;
		try {
			writer= response.getWriter();
			String str = request.getParameter("customer");
			JSONObject fromObject = JSONObject.fromObject(str);

			List<Car> cars = (List<Car>) JSONArray.toCollection(fromObject.getJSONArray("cars"), Car.class);
			Customer customer = (Customer) JSONObject.toBean(fromObject,Customer.class);
			service.addCustomer(customer,cars);
			writer.println(JSONObject.fromObject("{result:\"success\"}"));
		} catch (Exception e) {
			System.out.println(e.getMessage());
			writer.println(JSONObject.fromObject("{result:\"error\"}"));
		}
	}
	
	@RequestMapping("/selectCustomer")
	public void selectCustomer(HttpServletRequest request,HttpServletResponse response)
	{
		Customer customer = getCustomer(request);
		String currentPage = request.getParameter("currentPage");
		if (currentPage==null || currentPage.equals("")) {
			currentPage = "0";
		}
		PageBounds page = new PageBounds(Integer.valueOf(currentPage), 10);
		List<Customer> selectCustomer = service.selectCustomer(customer,page);
		JsonConfig config = new JsonConfig();
		config.registerJsonValueProcessor(Date.class,new JsDateJsonValueProcessor());
		JSONArray results = JSONArray.fromObject(selectCustomer,config);
		try {
			PrintWriter writer = response.getWriter();
			writer.println(results);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("/findCar")
	public void findCarByCusId(HttpServletRequest request,HttpServletResponse response)
	{
		try {
			String idstr = request.getParameter("id");
			Car car = new Car();
			car.setCustomerId(Long.valueOf(idstr));
			List<Car> findCarByCusId = service.findCarByCusId(car);
			JsonConfig config = new JsonConfig();
			config.registerJsonValueProcessor(Date.class,new JsDateJsonValueProcessor());
			JSONArray results = JSONArray.fromObject(findCarByCusId,config);
			PrintWriter writer = response.getWriter();
			writer.println(results);
		} catch (Exception e) {
			System.out.println("find car error:"+e.getMessage());
		}
	}
	@RequestMapping("/selectById")
	public void selectById(HttpServletRequest request,HttpServletResponse response)
	{
		String idstr = request.getParameter("id");
		try {
			if(idstr!=null && !"".equals(idstr))
			{
				Customer customer = service.selectById(Long.valueOf(idstr));
				JsonConfig config = new JsonConfig();
				config.registerJsonValueProcessor(Date.class,new JsDateJsonValueProcessor());
				JSONObject result = JSONObject.fromObject(customer, config);
				PrintWriter writer = response.getWriter();
				writer.println(result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/updateCustomer")
	public void updateCustomer(HttpServletRequest request,HttpServletResponse response)
	{
		PrintWriter writer = null;
		try {
			writer= response.getWriter();
			String str = request.getParameter("customer");
			JSONObject fromObject = JSONObject.fromObject(str);

			List<Car> cars = (List<Car>) JSONArray.toCollection(fromObject.getJSONArray("cars"), Car.class);
			Customer customer = (Customer) JSONObject.toBean(fromObject,Customer.class);
			service.updateCustomer(customer,cars);
			writer.println(JSONObject.fromObject("{result:\"success\"}"));
		} catch (Exception e) {
			System.out.println(e.getMessage());
			writer.println(JSONObject.fromObject("{result:\"error\"}"));
		}
	}
	
	
	
	@RequestMapping("/deleteCustomer")
	public void deleteCustomerById(HttpServletRequest request,HttpServletResponse response)
	{
		String idString = request.getParameter("id");
		PrintWriter writer = null;
		try {
			writer = response.getWriter();
			if (idString!=null && !"".equals(idString)) {
				Long id = Long.valueOf(idString);
				service.deleteCustomerById(id);
				writer.println(JSONObject.fromObject("{result:\"success\"}"));
			}else {
				writer.println(JSONObject.fromObject("{result:\"fail\"}"));
			}
		} catch (Exception e) { 
			writer.println(JSONObject.fromObject("{result:\"error\"}"));
		}
	}
	@RequestMapping("/deleteCar")
	public void deleteCarById(HttpServletRequest request,HttpServletResponse response)
	{
		String idString = request.getParameter("id");
		PrintWriter writer = null;
		try {
			writer = response.getWriter();
			if (idString!=null && !"".equals(idString)) {
				Long id = Long.valueOf(idString);
				List<Long> list = new ArrayList<>();
				list.add(id);
				service.deleteCarById(list);
				writer.println(JSONObject.fromObject("{result:\"success\"}"));
			}else {
				writer.println(JSONObject.fromObject("{result:\"fail\"}"));
			}
		} catch (Exception e) { 
			writer.println(JSONObject.fromObject("{result:\"error\"}"));
		}
	}
	
	private Customer getCustomer(HttpServletRequest request)
	{
		Customer customer = new Customer();
		if (request.getParameter("id")!=null&& !request.getParameter("id").equals("")) {
			customer.setId(Long.valueOf(request.getParameter("id")));
		}
		customer.setPhone(request.getParameter("phone"));
		customer.setName(request.getParameter("name"));
		customer.setAddress(request.getParameter("address"));
		customer.setDescription(request.getParameter("description"));
		return customer;
	}

}
