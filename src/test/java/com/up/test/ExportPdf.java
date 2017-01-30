package com.up.test;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.StringWriter;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
 
 
public class ExportPdf {
    public static final String DEST = "src/test.pdf";
    public static final String HTML = "D:\\360Downloads\\test.html";
    
    public Map getDateMap(){
    	
    	Department dep = new Department("1", "项目交付部", "Jon");
    	List staffList = new ArrayList<Object>();
    	staffList.add(new UserInfo("1", "唐海波", "北京"));
    	staffList.add(new UserInfo("2", "郑夏", "上海"));
    	staffList.add(new UserInfo("3", "罗小康", "广州"));

		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("department", dep);
//		map.put("staffList", staffList);
    	
		return map;
    }
 
    /**
     * Main method
     */
    public static void main(String[] args) throws Exception{
    	ExportPdf ep = new ExportPdf();
    	
    	ep.exportPdf(DEST, ep.getDateMap());
    }
    
    public class UserInfo {
    	private String userId;
    	private String userName;
    	private String address;	
    	
    	public UserInfo(String userId, String userName, String address) {
    		super();
    		this.userId = userId;
    		this.userName = userName;
    		this.address = address;
    	}
    	public String getUserId() {
    		return userId;
    	}
    	public void setUserId(String userId) {
    		this.userId = userId;
    	}
    	public String getUserName() {
    		return userName;
    	}
    	public void setUserName(String userName) {
    		this.userName = userName;
    	}
    	public String getAddress() {
    		return address;
    	}
    	public void setAddress(String address) {
    		this.address = address;
    	}
    }
    public void exportPdf(String pdfPath, Map<String, Object> map) throws Exception{
        VelocityEngine ve = new VelocityEngine();
        Properties p = new Properties();
        p.put("resource.loader", "srl");
        p.put("srl.resource.loader.class", "com.up.test.MyResourceLoader");
		ve.init(p);
		
		Template t = ve.getTemplate(HTML, "UTF-8");
		VelocityContext context = new VelocityContext();
		
		Iterator iter = map.entrySet().iterator();
		while (iter.hasNext()) {
			Map.Entry entry = (Map.Entry) iter.next();
			context.put(entry.getKey().toString(), entry.getValue());
		}
		
		StringWriter writer1 = new StringWriter();
		t.merge(context, writer1);

		String out = writer1.toString();
        System.out.println(out);
        File file = new File("D:/360Downloads/test11.html");
        BufferedWriter bw = new BufferedWriter(new FileWriter(file));
        bw.write(out);
        bw.close();
    }
    
    public  void myExportPdf(String pdfPath,Map<String, Object> map) throws Exception{
		//初始化并取得Velocity引警
		VelocityEngine ve =new VelocityEngine();
		Properties p = new Properties();
	    p.put("resource.loader", "srl");
	    p.put("srl.resource.loader.class", "com.bonatone.common.staff.controller.MyResourceLoader");
	    ve.init(p);
	    ve.init();
		URL resource = getClass().getClassLoader().getResource("");
		//取得velocity的模板
		//resource.getPath()
		Template t=ve.getTemplate(resource.getPath()+HTML,"UTF-8");
		//取得velocity的上下文vContext
		VelocityContext vContext= new VelocityContext();
		Iterator iter = map.entrySet().iterator();
		while (iter.hasNext()) {
			Map.Entry entry=(Map.Entry)iter.next();
			vContext.put(entry.getKey().toString(),entry.getValue());
		}
		//输出流
		StringWriter writer1 = new StringWriter();
		t.merge(vContext, writer1);
		String out=writer1.toString();
        //创建临时文件夹
		File file = File.createTempFile("bonatone", ".oa");
		file.deleteOnExit();
		BufferedWriter bw = new BufferedWriter(new FileWriter(file));
	    bw.write(out);
	    bw.close();
	}
    
    public class Department {
    	private String depId;
    	private String depName;
    	private String manager;	
    	
    	public Department(String depId, String depName, String manager) {
    		super();
    		this.depId = depId;
    		this.depName = depName;
    		this.manager = manager;
    	}

		public String getDepId() {
			return depId;
		}

		public void setDepId(String depId) {
			this.depId = depId;
		}

		public String getDepName() {
			return depName;
		}

		public void setDepName(String depName) {
			this.depName = depName;
		}

		public String getManager() {
			return manager;
		}

		public void setManager(String manager) {
			this.manager = manager;
		}
    }
}



