package com.sunDelivery.web.calc;

import java.util.List;
import com.sunDelivery.web.dao.ParcelDao2;
import com.sunDelivery.web.dao.mysql.MySQLParcelDao3;
import com.sunDelivery.web.entity.Parcel;

public class CompanyCalc {
	
	private int cost = 0;

	public int getcost(String company, int weight, int size, String visit, String locations) {
		cost = 0;
		ParcelDao2 parceldao = new MySQLParcelDao3();
		List<Parcel> list = parceldao.getList(company, visit);
		costcalc[] calclist = new costcalc[20];
		resultcalc[] result = new resultcalc[20];

		int resultnum = 0;
		int i = 0;
		for (Parcel p : list) {
			calclist[i] = new costcalc();
			calclist[i].setCompany(p.getCompany());
			calclist[i].setBoxSize(p.getBoxSize());
			calclist[i].setBoxSize(p.getBoxSize());
			calclist[i].setBoxWeigtht(p.getBoxWeigtht());
			calclist[i].setSameCity(p.getSameCity());
			calclist[i].setOtherCity(p.getOtherCity());
			i++;
		}

		for (int j = 0; j < i; ++j) {
			if (weight <= calclist[j].getBoxWeigtht()
					&& ((size <= calclist[j].getBoxSize()) || (calclist[j].getBoxSize() == 0))) {
				result[resultnum] = new resultcalc();

				if (locations.equals("same-location")) {
					cost = calclist[j].getSameCity();

				} else {

					cost = calclist[j].getOtherCity();
				}
				company = calclist[j].getCompany();
				result[resultnum].setCost(cost);
				result[resultnum].setCompany(company);
				resultnum++;
				break;
			}
		}
		return cost;
	}
}
