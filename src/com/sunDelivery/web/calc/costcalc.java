package com.sunDelivery.web.calc;

public class costcalc {
	private String Company;
	private int BoxSize;
	private int BoxWeigtht;
	private int SameCity;
	private int OtherCity;
	private int Visit;

	public String getCompany() {
		return Company;
	}

	public void setCompany(String company) {
		Company = company;
	}

	public int getVisit() {
		return Visit;
	}

	public void setVisit(int visit) {
		Visit = visit;
	}

	public int getBoxSize() {
		return BoxSize;
	}

	public void setBoxSize(int boxSize) {
		BoxSize = boxSize;
	}

	public int getBoxWeigtht() {
		return BoxWeigtht;
	}

	public void setBoxWeigtht(int boxWeigtht) {
		BoxWeigtht = boxWeigtht;
	}

	public int getSameCity() {
		return SameCity;
	}

	public void setSameCity(int sameCity) {
		SameCity = sameCity;
	}

	public int getOtherCity() {
		return OtherCity;
	}

	public void setOtherCity(int otherCity) {
		OtherCity = otherCity;
	}

}
