package com.huacheng.bean;

import java.io.Serializable;

/**
 * @author Bert
 *
 * @date 2016年8月4日
 *
 */
public class ProjectParts implements Serializable {
	
	private Long id;
	private PartsStore partsStore;
	private int useNum;
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
}
