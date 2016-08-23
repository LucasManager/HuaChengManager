package com.huacheng.service;

import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.huacheng.bean.Car;
import com.huacheng.bean.Customer;
import com.huacheng.bean.Project;

public interface IProjectManagerService {

	public List<Project> findProject(Project project,PageBounds pb) throws Exception;
	
	public List<Car> findCarCus(Customer customer,PageBounds pb) throws Exception;
	
	public void addProject(Project project) throws Exception;
	
	public void updateProject(Project project) throws Exception;
	
	
	
}
