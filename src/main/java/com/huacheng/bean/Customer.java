package com.huacheng.bean;

import java.io.Serializable;
import java.util.List;

/**
 * @author Bert
 *
 * @date 2016年7月7日
 *
 */
public class Customer implements Serializable {

	private long id;
	private String name;
	private String phone;
	private String address;
	private String description;
	private List<Car> cars;
	
	/**
	 * 
	 */
	public Customer() {
		super();
	}
	/**
	 * @param id
	 * @param name
	 * @param phone
	 * @param address
	 * @param description
	 */
	public Customer(long id, String name, String phone, String address, String description,List<Car> cars) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.description = description;
		this.cars = cars;
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
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}
	/**
	 * @param phone the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}
	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}
	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
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
	/**
	 * @return the cars
	 */
	public List<Car> getCars() {
		return cars;
	}
	/**
	 * @param cars the cars to set
	 */
	public void setCars(List<Car> cars) {
		this.cars = cars;
	}
	
}
