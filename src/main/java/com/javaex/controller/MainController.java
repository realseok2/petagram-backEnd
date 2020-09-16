package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.MainService;
import com.javaex.vo.ShopVo;

@Controller
public class MainController {
	
	@Autowired
	private MainService mainservice;
	//메인페이지
	@RequestMapping("/main")
	public String main() {
		return "main/main";
	}
	//리스트로찾기
	@RequestMapping("/listsearch")
	public String listsearch(Model model) {
		List<ShopVo> sList = mainservice.list();
		model.addAttribute("sList", sList);
		return "main/listsearch";
	}
	
	//1개의 매장 조회
	@ResponseBody
	@RequestMapping("/selectStore")
	public ShopVo selectStore(@RequestParam String shopDomain) {
		ShopVo shopVo =mainservice.selectStore(shopDomain);
		
		return shopVo;
	}
	
	//지도로찾기
	@RequestMapping("/mapsearch")
	public String mapsearch(Model model) {
		List<ShopVo> sList = mainservice.list();
		model.addAttribute("sList", sList);
		
		return "main/mapsearch";
	}
}
