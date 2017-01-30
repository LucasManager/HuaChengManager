package com.up.test;

import java.io.StringWriter;
import java.util.Properties;

import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;

public class TemplateTest {
	
	public static void main(String[] args) {
		 try {
			VelocityEngine ve = new VelocityEngine();
			  Template t = ve.getTemplate("D:\\360Downloads\\template.vm", "UTF-8");  
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
