package com.sunDelivery.web.dao.mysql;

import java.util.List;


import com.sunDelivery.web.dao.ParcelDao;
import com.sunDelivery.web.entity.Parcel;

public class TestProgram {

	public static void main(String[] args) {
		ParcelDao parceldao = new MySQLParcelDao();
		List<Parcel> list = parceldao.getList();
		
		for(Parcel p:list) {
			System.out.print(p.getPriceCode()+" ");
			System.out.print(p.getCompany()+" ");
			System.out.print(p.getComdetail()+" ");
			System.out.print(p.getBoxSize()+" ");
			System.out.print(p.getBoxWeigtht()+" ");
			System.out.print(p.getSameCity()+" ");
			System.out.print(p.getOtherCity()+" ");
			System.out.println();
		}
	}

}
