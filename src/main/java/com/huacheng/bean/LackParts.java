package com.huacheng.bean;

import java.util.Date;

import org.apache.ibatis.type.Alias;

/**
 * @author Bert
 *
 * @date 2016年7月19日
 *
 */
@Alias("LackParts")
public class LackParts {
	
	private Long id;
	private String customerName;
	private String phone;
	private String partsName;//配件名称
	private String partsNum;//配件型号
	private String carNum;//车牌号；
	private Date createDate; //登记时间
	private Date finishDate;//完成时间
	private int	needNum;//所需数量
	private String status;//状态：1：补充完成; 0:未完成
	private String description;
	public LackParts(Long id, String customerName, String phone, String partsName, String partsNum, String carNum,
			Date createDate, Date finishDate, int needNum, String status, String description) {
		super();
		this.id = id;
		this.customerName = customerName;
		this.phone = phone;
		this.partsName = partsName;
		this.partsNum = partsNum;
		this.carNum = carNum;
		this.createDate = createDate;
		this.finishDate = finishDate;
		this.needNum = needNum;
		this.status = status;
		this.description = description;
	}
	public LackParts() {
		super();
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPartsName() {
		return partsName;
	}
	public void setPartsName(String partsName) {
		this.partsName = partsName;
	}
	public String getPartsNum() {
		return partsNum;
	}
	public void setPartsNum(String partsNum) {
		this.partsNum = partsNum;
	}
	public String getCarNum() {
		return carNum;
	}
	public void setCarNum(String carNum) {
		this.carNum = carNum;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getFinishDate() {
		return finishDate;
	}
	public void setFinishDate(Date finishDate) {
		this.finishDate = finishDate;
	}
	public int getNeedNum() {
		return needNum;
	}
	public void setNeedNum(int needNum) {
		this.needNum = needNum;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
	
	
}
