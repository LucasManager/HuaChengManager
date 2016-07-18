package com.huacheng.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.huacheng.bean.Car;
import com.huacheng.bean.Customer;
import com.huacheng.bean.Page;
import com.huacheng.dao.DAO;
import com.huacheng.service.ICustomerManagerService;

/**
 * @author Bert
 *
 * @date 2016年7月8日
 *
 */
@Service("customerManagerServiceImpl")
public class CustomerManagerServiceImpl implements ICustomerManagerService {

	@Resource(name="daoSupport")
	private DAO dao;
	
	@Override
	public List<Customer> selectCustomer(Customer customer,PageBounds page) {
		List<Customer> results = null;
		try {
			results = (List<Customer>) dao.findForListlimit("CustomerMapper.findCustomer", customer, page);
		} catch (Exception e) {
			System.out.println("select customer error:"+e.getMessage());
			e.printStackTrace();
		}
		return results;
	}

	public void addCustomer(Customer customer,List<Car> cars) throws Exception {
		Object save = dao.save("CustomerMapper.addCustomer", customer);
		if(cars!=null && cars.size()!=0)
		{
			for (Car car : cars) {
				car.setCustomerId(customer.getId());
			}
			dao.save("CarMapper.batchInsert", cars);
		}
	}
	

	@Override
	public void deleteCustomerById(Long id) throws Exception {
		dao.delete("CustomerMapper.deleteById", id);
	}

	@Override
	public Customer selectById(Long id) throws Exception {
		Customer customer = (Customer) dao.findForObject("CustomerMapper.selectById", id);
		return customer;
	}

	@Override
	public void deleteCarById(List<Long> list) throws Exception {
		Object update = dao.update("CarMapper.deleteCarById", list);
		System.out.println(update);
	}

	@Override
	public void updateCustomer(Customer customer, List<Car> cars) throws Exception {
		Integer save = (Integer) dao.update("CustomerMapper.updateCustomer", customer);
		System.out.println(save);
		if(cars!=null && cars.size()!=0 && save!=null && save!=0)
		{
			for (Car car : cars) {
				car.setCustomerId(customer.getId());
			}
			dao.save("CarMapper.batchInsert", cars);
		}
	}

	@Override
	public List<Car> findCarByCusId(Car car) throws Exception {
		List<Car> cars = (List<Car>) dao.findForList("CarMapper.selectCar", car);
		return cars;
	}

}
