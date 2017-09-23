package com.sunDelivery.web.calc;

public class resultcalc implements Comparable {
	private String company;
	private int cost;
	
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	
	@Override
	public int compareTo(Object obj) {
		resultcalc other = (resultcalc)obj;
		if(cost<other.cost)
			return -1;
		else if(cost>other.cost)
			return 1;
		else
			return 0;
	}
}
