package com.huacheng.bean;

import java.io.Serializable;

/**
 * @author Bert
 *
 * @date 2016年7月7日
 *
 */
public class Car implements Serializable {

	private long id;
	private String carType;
	private String carNum;
	private String carColor;
	private String mileage;
	private String VIN;
	private String description;
	
	/**
	 * 
	 */
	public Car() {
		super();
	}
	/**
	 * @param id
	 * @param carType
	 * @param carNum
	 * @param carColor
	 * @param mileage
	 * @param vIN
	 * @param description
	 */
	public Car(long id, String carType, String carNum, String carColor, String mileage, String vIN,
			String description) {
		super();
		this.id = id;
		this.carType = carType;
		this.carNum = carNum;
		this.carColor = carColor;
		this.mileage = mileage;
		VIN = vIN;
		this.description = description;
	}
	/**
	 * @return the id
	 */
	public long getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(long id) {
		this.id = id;
	}
	/**
	 * @return the carType
	 */
	public String getCarType() {
		return carType;
	}
	/**
	 * @param carType the carType to set
	 */
	public void setCarType(String carType) {
		this.carType = carType;
	}
	/**
	 * @return the carNum
	 */
	public String getCarNum() {
		return carNum;
	}
	/**
	 * @param carNum the carNum to set
	 */
	public void setCarNum(String carNum) {
		this.carNum = carNum;
	}
	/**
	 * @return the carColor
	 */
	public String getCarColor() {
		return carColor;
	}
	/**
	 * @param carColor the carColor to set
	 */
	public void setCarColor(String carColor) {
		this.carColor = carColor;
	}
	/**
	 * @return the mileage
	 */
	public String getMileage() {
		return mileage;
	}
	/**
	 * @param mileage the mileage to set
	 */
	public void setMileage(String mileage) {
		this.mileage = mileage;
	}
	/**
	 * @return the vIN
	 */
	public String getVIN() {
		return VIN;
	}
	/**
	 * @param vIN the vIN to set
	 */
	public void setVIN(String vIN) {
		VIN = vIN;
	}
	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}
	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}
	
}
