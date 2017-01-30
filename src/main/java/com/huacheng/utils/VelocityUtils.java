package com.huacheng.utils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.StringWriter;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;

public class VelocityUtils {

	
	/**
	 * 根据模板填充数据
	 * @param template
	 * @param param
	 * @return
	 */
	public static String getHTMLByTemplate(String template,Map<String, Object> param){
		  VelocityEngine ve = new VelocityEngine();
	        Properties p = new Properties();
	        p.put("resource.loader", "srl");
	        p.put("srl.resource.loader.class", "com.huacheng.utils.MyResourceLoader");
			ve.init(p);
			
			Template t = ve.getTemplate(template, "UTF-8");
			VelocityContext context = new VelocityContext();
			
			Iterator iter = param.entrySet().iterator();
			while (iter.hasNext()) {
				Map.Entry entry = (Map.Entry) iter.next();
				context.put(entry.getKey().toString(), entry.getValue());
			}
			
			StringWriter writer1 = new StringWriter();
			t.merge(context, writer1);

			String out = writer1.toString();
	        return out;
	}
}
