package com.javaex.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.dao.UserDao;
import com.javaex.vo.MenuVo;
import com.javaex.vo.SessionVo;
import com.javaex.vo.ShopVo;
import com.javaex.vo.UserVo;

@Service
public class UserService {

	@Autowired
	private UserDao UserDao;
	
	//회원가입
	public int join(UserVo userVo) {
		return UserDao.join(userVo);
	}
	
	//로그인
	public SessionVo login(UserVo userVo) {
		SessionVo sessionVo = UserDao.login(userVo);
		int userNo = sessionVo.getUserNo();
		
		//로그인 정보로 매장정보 유뮤 체크
		SessionVo storeSession = UserDao.storeSelect(userNo);
		//매장정보가 없으면 로그인 유저만 리턴
		if(storeSession==null) {
			return sessionVo;
		}
		//매장정보가 있으면 매장정보를 추가해서 리턴
		else {
			String Domain = storeSession.getShopDomain();
			int shopNo = storeSession.getShopNo();
			
			sessionVo.setShopDomain(Domain);
			sessionVo.setShopNo(shopNo);
			
			return sessionVo;
		}
	}
	
	//매장등록
	public SessionVo storeAdd(ShopVo shopVo,MultipartFile file,int userNo) {
		// ======데이터 추출======
		String saveDir = "C:\\JavaStudy\\dogshop";		
		
		// 원본파일 이름추출
		String orgName = file.getOriginalFilename();

		// 확장자
		String exName = orgName.substring(orgName.lastIndexOf("."));

		// 저장파일이름
		String shopLogo = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;

		// 파일경로
		String filePath = saveDir + "\\" + shopLogo;

		// 파일사이즈
		long fileSize = file.getSize();

		//======파일 복사======
		try {
			byte[] fileData = file.getBytes();
			OutputStream out = new FileOutputStream(filePath);
			BufferedOutputStream bout = new BufferedOutputStream(out);
			
			bout.write(fileData);
			bout.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		shopVo.setShopLogo(shopLogo);
		shopVo.setUserNo(userNo);
		//매장등록
		UserDao.storeAdd(shopVo);
		
		
		//메뉴 추가
		int shopNo = UserDao.storeSelect(userNo).getShopNo();
		List<MenuVo> mList = new ArrayList<MenuVo>();
		
		mList.add(new MenuVo(shopNo,"공지사항"));
		mList.add(new MenuVo(shopNo,"사진첩"));
		mList.add(new MenuVo(shopNo,"가격표"));
		mList.add(new MenuVo(shopNo,"애견용품"));
		mList.add(new MenuVo(shopNo,"찾아오시는 길"));
		
		UserDao.menuAdd(mList);
		
		return UserDao.storeSelect(userNo);
		
	}
}
