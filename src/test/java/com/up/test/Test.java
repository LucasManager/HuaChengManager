package com.up.test;

import java.util.List;

import org.junit.Before;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.huacheng.bean.Car;
import com.huacheng.bean.Customer;
import com.huacheng.bean.PartsStore;
import com.huacheng.bean.Project;
import com.huacheng.service.IPartsManagerService;
import com.huacheng.service.IProjectManagerService;

/**
 * @author Bert
 *
 * @date 2016年7月14日
 *
 */
public class Test {
	
	private ApplicationContext context = null;
	
	@Before
	public void before(){
		context = new ClassPathXmlApplicationContext("applicationContext.xml");
		System.out.println(context);
	}
	
	@org.junit.Test
	public void testSqlsessionTemplate(){
		Object bean = context.getBean("sqlSessionTemplate");
		System.out.println(bean);
	}
	@org.junit.Test
	public void testProject(){
		IProjectManagerService service = (IProjectManagerService) context.getBean("projectManagerService");
		Customer customer = new Customer();
		PageBounds page = new PageBounds(0, 10);
		try {
			List<Car> findCarCus = service.findCarCus(customer, page);
			System.out.println(findCarCus);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@org.junit.Test
	public void testProject2(){
		IProjectManagerService service = (IProjectManagerService) context.getBean("projectManagerService");
		PageBounds page = new PageBounds(0, 10);
		try {
			List<Project> findCarCus = service.findProject(null, page);
			System.out.println(findCarCus);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@org.junit.Test
	public void testStore(){
		IPartsManagerService service = (IPartsManagerService) context.getBean("partsManagerService");
		PageBounds page = new PageBounds(0, 10);
		List<PartsStore> findPartsStore;
		try {
			findPartsStore = service.findPartsStore(null, page);
			System.out.println(findPartsStore);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
