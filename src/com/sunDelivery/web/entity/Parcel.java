package com.sunDelivery.web.entity;

public class Parcel {
	private String company;
	private String comdetail;
	private String priceCode;
	private int boxSize;
	private int boxWeigtht;
	private int sameCity;
	private int otherCity;
	
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getComdetail() {
		return comdetail;
	}
	public void setComdetail(String comdetail) {
		this.comdetail = comdetail;
	}
	public String getPriceCode() {
		return priceCode;
	}
	public void setPriceCode(String priceCode) {
		this.priceCode = priceCode;
	}
	public int getBoxSize() {
		return boxSize;
	}
	public void setBoxSize(int boxSize) {
		this.boxSize = boxSize;
	}
	public int getBoxWeigtht() {
		return boxWeigtht;
	}
	public void setBoxWeigtht(int boxWeigtht) {
		this.boxWeigtht = boxWeigtht;
	}
	public int getSameCity() {
		return sameCity;
	}
	public void setSameCity(int sameCity) {
		this.sameCity = sameCity;
	}
	public int getOtherCity() {
		return otherCity;
	}
	public void setOtherCity(int otherCity) {
		this.otherCity = otherCity;
	}
}
