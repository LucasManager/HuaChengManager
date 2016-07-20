package com.huacheng.listener;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import net.sf.ezmorph.object.DateMorpher;
import net.sf.json.util.JSONUtils;

/**
 * @author Bert
 *
 * @date 2016年7月20日
 *
 */
public class ContentListener implements ServletContextListener {

	
	public void contextInitialized(ServletContextEvent sce) {
		/**
		 * json格式化加载到内存中
		 */
		JSONUtils.getMorpherRegistry().registerMorpher(new DateMorpher(new String[]{"yyyy-MM-dd HH:mm:ss"}));
	}
	public void contextDestroyed(ServletContextEvent sce) {
		
	}

}
