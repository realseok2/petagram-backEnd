package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.service.MenuService;
import com.javaex.vo.MenuVo;

@Controller
@RequestMapping("menu")
public class MenuController {
	
	@Autowired
	MenuService menuService;
	
	@RequestMapping(value="menuDisplay",method=RequestMethod.POST)
	public void menuDisplay(@ModelAttribute MenuVo menuVo ) {
		menuService.menuDisplay(menuVo);
	}
	
}
