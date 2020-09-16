package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.MainDao;
import com.javaex.dao.StoreDao;
import com.javaex.vo.ShopVo;

@Service
public class MainService {
	
	@Autowired
	private MainDao maindao;
	@Autowired
	private StoreDao storeDao;
	
	//리스트로 찾기
	public List<ShopVo> list(){
		return maindao.list();
	}
	
	//1개의 매장 조회
	public ShopVo selectStore(String shopDomain){
		return storeDao.StoreSelect(shopDomain);
	}
}
