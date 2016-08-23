package com.huacheng.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

/**
 * @author Bert
 *
 * @date 2016年8月4日
 *
 */
@Alias("Project")
public class Project implements Serializable{
	
	private Long id;
	private Customer customer;
	private Car car;
	private List<ProjectParts> useParts;//使用的配件信息和配件数量
	private String projectNo; //单号：日期+当前的单子个数：
	private String projectType;//
	private String projectName;
	private String mileage;
	private double partsCharge;
	private double laborCharge;
	private Date startDate;
	private Date endDate;
	private Date outServiceDate;
	private	String chargePerson;
	private String status;
	private String description;
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Car getCar() {
		return car;
	}
	public void setCar(Car car) {
		this.car = car;
	}
	public String getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(String projectNo) {
		this.projectNo = projectNo;
	}
	public String getProjectType() {
		return projectType;
	}
	public void setProjectType(String projectType) {
		this.projectType = projectType;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getMileage() {
		return mileage;
	}
	public void setMileage(String mileage) {
		this.mileage = mileage;
	}
	public double getPartsCharge() {
		return partsCharge;
	}
	public void setPartsCharge(double partsCharge) {
		this.partsCharge = partsCharge;
	}
	public double getLaborCharge() {
		return laborCharge;
	}
	public void setLaborCharge(double laborCharge) {
		this.laborCharge = laborCharge;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public Date getOutServiceDate() {
		return outServiceDate;
	}
	public void setOutServiceDate(Date outServiceDate) {
		this.outServiceDate = outServiceDate;
	}
	public String getChargePerson() {
		return chargePerson;
	}
	public void setChargePerson(String chargePerson) {
		this.chargePerson = chargePerson;
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
	public List<ProjectParts> getUseParts() {
		return useParts;
	}
	public void setUseParts(List<ProjectParts> useParts) {
		this.useParts = useParts;
	}

}
