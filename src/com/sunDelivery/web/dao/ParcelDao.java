package com.sunDelivery.web.dao;

import java.util.List;

import com.sunDelivery.web.entity.Parcel;

public interface ParcelDao {
	/*
	 * create
	 */
	String lastCode();
	int add(Parcel parcel);
	
	/*
	 * read
	 */
	List<Parcel> getList();
	List<Parcel> getList(int page);
	List<Parcel> getList(int page, String query);
	

	int getSize();
	int getSize(String query);
	
	Parcel get(String priceCode);
	
	/**
	 * update
	 */
	int update(Parcel parcel);
	int update(String priceCode, String company, String comdetail, int boxWeigtht, int sameCity, int otherCity);
	
	/**
	 * delete
	 */
	int delete(String priceCode);

}
