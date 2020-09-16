package com.javaex.vo;

public class VisitVo {
	private String dogName;
	private String shopTitle;
	private String regdate;
	private double dogweight;
	private String confirm;
	
	public VisitVo(){}

	public String getDogName() {
		return dogName;
	}

	public void setDogName(String dogName) {
		this.dogName = dogName;
	}

	public String getShopTitle() {
		return shopTitle;
	}

	public void setShopTitle(String shopTitle) {
		this.shopTitle = shopTitle;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public double getDogweight() {
		return dogweight;
	}

	public void setDogweight(double dogweight) {
		this.dogweight = dogweight;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

	@Override
	public String toString() {
		return "VisitVo [dogName=" + dogName + ", shopTitle=" + shopTitle + ", regdate=" + regdate + ", dogweight="
				+ dogweight + ", confirm=" + confirm + "]";
	}
	
	

}
