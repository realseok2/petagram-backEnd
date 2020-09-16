package com.javaex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.MenuDao;
import com.javaex.vo.MenuVo;

@Service
public class MenuService {

	@Autowired
	MenuDao menuDao;
	
	public void menuDisplay(MenuVo menuVo) {
		menuDao.DisplayUpdate(menuVo);
	}
}
