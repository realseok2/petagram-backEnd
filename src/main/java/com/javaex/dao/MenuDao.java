package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.MenuVo;

@Repository
public class MenuDao {

	@Autowired
	SqlSession sqlsession;
	
	public void DisplayUpdate(MenuVo menuVo) {
		int count =sqlsession.update("menu.displayUpdate",menuVo);
	}
}
