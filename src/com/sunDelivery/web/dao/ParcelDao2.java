package com.sunDelivery.web.dao;

import java.util.List;

import com.sunDelivery.web.entity.Parcel;

public interface ParcelDao2 {
	
	List<Parcel> getList(int page, String field, String query);
	List<Parcel> getList(String company, String visit);
	List<Parcel> getcompany();
}
