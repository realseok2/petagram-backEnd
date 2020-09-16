package com.javaex.vo;

public class MenuVo {

	//필드
	private int menuNo,shopNo,display;
	private String menuTitle;

	//생성자
	public MenuVo() {
		
	}
	public MenuVo(int shopNo, String menuTitle) {
		this.shopNo = shopNo;
		this.menuTitle = menuTitle;
	}
	public MenuVo(int menuNo, int shopNo, int display, String menuTitle) {
		this.menuNo = menuNo;
		this.shopNo = shopNo;
		this.display = display;
		this.menuTitle = menuTitle;
	}
	
	//g.s
	public int getMenuNo() {
		return menuNo;
	}
	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}
	public int getShopNo() {
		return shopNo;
	}
	public void setShopNo(int shopNo) {
		this.shopNo = shopNo;
	}
	public int getDisplay() {
		return display;
	}
	public void setDisplay(int display) {
		this.display = display;
	}
	public String getMenuTitle() {
		return menuTitle;
	}
	public void setMenuTitle(String menuTitle) {
		this.menuTitle = menuTitle;
	}
	//일반 메소드
	@Override
	public String toString() {
		return "MenuVo [menuNo=" + menuNo + ", shopNo=" + shopNo + ", display=" + display + ", menuTitle=" + menuTitle + "]";
	}
	
}
