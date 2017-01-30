package com.huacheng.bean;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

/**
 * @author Bert
 *
 * @date 2016年8月4日
 *
 */
@Alias("ProjectParts")
public class ProjectParts implements Serializable {
	
	private Long id;
	private Long projectId;
	private Long pStoreId;
	private PartsStore partsStore;
	private int useNum;
	private String partsName;
	private String partsType;
	private String partsNo;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public PartsStore getPartsStore() {
		return partsStore;
	}
	public void setPartsStore(PartsStore partsStore) {
		this.partsStore = partsStore;
	}
	public int getUseNum() {
		return useNum;
	}
	public void setUseNum(int useNum) {
		this.useNum = useNum;
	}
	public String getPartsName() {
		return partsName;
	}
	public void setPartsName(String partsName) {
		this.partsName = partsName;
	}
	public String getPartsType() {
		return partsType;
	}
	public void setPartsType(String partsType) {
		this.partsType = partsType;
	}
	public String getPartsNo() {
		return partsNo;
	}
	public void setPartsNo(String partsNo) {
		this.partsNo = partsNo;
	}

	public Long getProjectId() {
		return projectId;
	}

	public void setProjectId(Long projectId) {
		this.projectId = projectId;
	}
	public Long getpStoreId() {
		return pStoreId;
	}
	public void setpStoreId(Long pStoreId) {
		this.pStoreId = pStoreId;
	}
}
