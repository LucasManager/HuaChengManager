package com.huacheng.bean;

import java.io.Serializable;

/**
 * @author Bert
 *
 * @date 2016年7月13日
 *
 */
public class Parts implements Serializable {
	
	private Long id;
	private String name;  //配件名称
	private String type; //配件类型 ，大的分类：
	private String partsNo; //配件型号
	private int surplusNum; //当前配件剩余量
	private String positions;
	private String description;
	
	public Parts() {
		super();
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPartsNo() {
		return partsNo;
	}
	public void setPartsNo(String partsNo) {
		this.partsNo = partsNo;
	}
	public String getPositions() {
		return positions;
	}
	public void setPositions(String positions) {
		this.positions = positions;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	/**
	 * @return the surplusNum
	 */
	public int getSurplusNum() {
		return surplusNum;
	}
	/**
	 * @param surplusNum the surplusNum to set
	 */
	public void setSurplusNum(int surplusNum) {
		this.surplusNum = surplusNum;
	}

}
