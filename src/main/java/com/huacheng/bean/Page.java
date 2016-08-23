package com.huacheng.bean;

import org.apache.ibatis.type.Alias;

/**
 * @author Bert
 *
 * @date 2016年7月8日
 *
 */
@Alias("Page")
public class Page {

	private int currentPage;
	private int column;
	
	/**
	 * 
	 */
	public Page() {
		super();
	}
	/**
	 * @param currentPage
	 * @param column
	 */
	public Page(int currentPage, int column) {
		super();
		this.currentPage = currentPage;
		this.column = column;
	}
	public int getColumn() {
		return column;
	}
	public void setColumn(int column) {
		this.column = column;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
}
