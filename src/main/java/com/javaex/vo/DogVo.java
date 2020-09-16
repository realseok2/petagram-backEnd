package com.javaex.vo;

public class DogVo {
	//필드
	private int dogNo,userNo,dogAge;
	private String dogName,dogWeight,dogEtc,dogType,dogImg;
	
	//생성자
	public DogVo() {

	}
	public DogVo(int dogNo, int userNo, int dogAge, String dogName, String dogWeight, String dogEtc, String dogType,
			String dogImg) {

		this.dogNo = dogNo;
		this.userNo = userNo;
		this.dogAge = dogAge;
		this.dogName = dogName;
		this.dogWeight = dogWeight;
		this.dogEtc = dogEtc;
		this.dogType = dogType;
		this.dogImg = dogImg;
	}
	
	//g.s
	public int getDogNo() {
		return dogNo;
	}
	
	public void setDogNo(int dogNo) {
		this.dogNo = dogNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getDogAge() {
		return dogAge;
	}
	public void setDogAge(int dogAge) {
		this.dogAge = dogAge;
	}
	public String getDogName() {
		return dogName;
	}
	public void setDogName(String dogName) {
		this.dogName = dogName;
	}
	public String getDogEtc() {
		return dogEtc;
	}
	public void setDogEtc(String dogEtc) {
		this.dogEtc = dogEtc;
	}
	public String getDogType() {
		return dogType;
	}
	public void setDogType(String dogType) {
		this.dogType = dogType;
	}
	
	public String getDogWeight() {
		return dogWeight;
	}
	public String getDogImg() {
		return dogImg;
	}
	public void setDogImg(String dogImg) {
		this.dogImg = dogImg;
	}
	public void setDogWeight(String dogWeight) {
		this.dogWeight = dogWeight;
	}
	
	@Override
	public String toString() {
		return "DogVo [dogNo=" + dogNo + ", userNo=" + userNo + ", dogAge=" + dogAge + ", dogName=" + dogName
				+ ", dogWeight=" + dogWeight + ", dogEtc=" + dogEtc + ", dogType=" + dogType + ", dogImg=" + dogImg
				+ "]";
	}
	
}