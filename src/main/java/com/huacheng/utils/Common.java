package com.huacheng.utils;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import net.sf.ezmorph.object.DateMorpher;
import net.sf.json.JSONObject;
import net.sf.json.util.JSONUtils;

/**
 * @author Bert
 *
 * @date 2016年7月15日
 *
 */
public class Common {
	
	static {
		JSONUtils.getMorpherRegistry().registerMorpher(new DateMorpher(new String[]{"yyyy-MM-dd HH:mm:ss"}));
	}
	
	public static long SYSTEMTIME=System.currentTimeMillis();
	
	public static final String dateFormate = "yyyy-MM-dd HH:mm:ss";
	
	
	
	
	/**
	 * 把字符串日期转换为sql日期
	 * @param date
	 * @return
	 */
	public static Date format(String date){
		try {
			SimpleDateFormat format = new SimpleDateFormat(dateFormate);
			java.util.Date parse = format.parse(date);
			return new Date(parse.getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	public static Date getJsonDate(JSONObject jsonObject,String property)
	{
		if (jsonObject!=null && !"".equals(jsonObject)) {
			if (!jsonObject.has(property)) {
				System.out.println("property is :"+property+"no such property:"+jsonObject);
				return null;
			}
			String object = (String) jsonObject.get(property);
			jsonObject.remove(property);
			return format(object);
		}
		return null;
	}
	

}
