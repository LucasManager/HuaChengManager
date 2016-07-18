package com.huacheng.bean;

import java.io.Serializable;
import java.util.Date;
/**
 * @author Bert
 *
 * @date 2016年7月13日
 *
 */
public class PartsStore implements Serializable {

	private Long id;
	private Long partsId;
	private Date increaseDate;
	private int num; //进货总量
	private double unitPrice;//进货单价
	private double sellUnitPrice;//销售单价
	private String description;
	
	public PartsStore() {
		super();
	}
	public PartsStore(Long id, Long partsId, Date increaseDate, int num, double unitPrice, double sellUnitPrice,
			String description) {
		super();
		this.id = id;
		this.partsId = partsId;
		this.increaseDate = increaseDate;
		this.num = num;
		this.unitPrice = unitPrice;
		this.sellUnitPrice = sellUnitPrice;
		this.description = description;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getPartsId() {
		return partsId;
	}
	public void setPartsId(Long partsId) {
		this.partsId = partsId;
	}
	public Date getIncreaseDate() {
		return increaseDate;
	}
	public void setIncreaseDate(Date increaseDate) {
		this.increaseDate = increaseDate;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public double getSellUnitPrice() {
		return sellUnitPrice;
	}
	public void setSellUnitPrice(double sellUnitPrice) {
		this.sellUnitPrice = sellUnitPrice;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
}
