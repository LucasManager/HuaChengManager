package com.huacheng.service;

import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.huacheng.bean.Car;
import com.huacheng.bean.Customer;
import com.huacheng.bean.Page;

/**
 * @author Bert
 *
 * @date 2016年7月8日
 *
 */
public interface ICustomerManagerService {

	public List<Customer> selectCustomer(Customer customer,PageBounds page);
	
	public void addCustomer(Customer customer,List<Car> cars) throws Exception;
	
	public void deleteCustomerById(Long id) throws Exception;
	/**
	 * 根据Id查询当前客户的所有信息
	 * @param id
	 */
	public Customer selectById(Long id) throws Exception;
	
	/**
	 * 批量删除车辆
	 */
	public void deleteCarById(List<Long> list) throws Exception;
	
	public void updateCustomer(Customer customer,List<Car> cars) throws Exception;
	
	
	public List<Car> findCarByCusId(Car car) throws Exception;
	
}
