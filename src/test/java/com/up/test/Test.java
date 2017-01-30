package com.up.test;

import java.io.StringWriter;
import java.util.List;

import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.apache.velocity.app.VelocityEngine;
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
	
	@org.junit.Test
	public void template(){
		 VelocityEngine ve = new VelocityEngine();  
//		 ve.setProperty(Velocity.RESOURCE_LOADER, "class");
//		 ve.setProperty("class.resource.loader.class", "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");  
		 try {
			ve.init();
			  Template t = ve.getTemplate("C:\\template.html", "UTF-8");  
			  // 设置初始化数据  
	          VelocityContext context = new VelocityContext();  
	          context.put("name", "张三");  
	          
	           String[] hobbyArray={"吃饭","喝水","洗澡"};  
	           context.put("hobby", "爱好");  
	           context.put("hobbyArray", hobbyArray);
	           // 设置输出  
	            StringWriter writer = new StringWriter();  
	            // 将环境数据转化输出  
	            t.merge(context, writer); 
	            
	            String string = writer.toString();
	            System.out.println(string);
	            
	            
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
	}
	
	

}
