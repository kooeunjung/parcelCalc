package com.sunDelivery.web.dao;

import java.util.List;

import com.sunDelivery.web.entity.Parcel;

public interface ParcelDao {
	
	List<Parcel> getList();
	List<Parcel> getList(int page);
	List<Parcel> getList(int page, String field, String query);
	
}
