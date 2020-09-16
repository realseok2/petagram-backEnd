package com.javaex.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.dao.DogDao;
import com.javaex.dao.StoreDao;
import com.javaex.vo.BoardVo;
import com.javaex.vo.DogVo;
import com.javaex.vo.MenuVo;
import com.javaex.vo.ReservationVo;
import com.javaex.vo.ShopVo;
import com.javaex.vo.StorereservationVo;
import com.javaex.vo.UserVo;

@Service
public class StoreService {

	@Autowired
	StoreDao storeDao;
	@Autowired
	DogDao dogDao;
	
	
	Map<String,Object> sMap = new HashMap<String,Object>();
	//메인페이지
	public Map<String,Object> StoreMain(String shopDomain) {
		ShopVo shopVo = storeDao.StoreSelect(shopDomain);
		List<MenuVo> mList = storeDao.MenuSelect(shopVo.getShopNo());
		int GalleryNo = 2+((shopVo.getShopNo()-1)*5);
		int GoodsNo = 4+((shopVo.getShopNo()-1)*5);
		List<BoardVo> GalleryList = storeDao.boardSelect(GalleryNo);
		List<BoardVo> GoodsList = storeDao.boardSelect(GoodsNo);
		//메뉴리스트(url)
		List<String> cateList = new ArrayList<String>();
		cateList.add("notice");
		cateList.add("gallery");
		cateList.add("price");
		cateList.add("petGoods");
		cateList.add("map");
		
		//예약현황리스트
		List<ReservationVo> RList = storeDao.getRList(shopVo.getShopNo());
		
		sMap.put("RList",RList);
		sMap.put("cateList",cateList);
		sMap.put("shopVo", shopVo);
		sMap.put("mList", mList);
		sMap.put("GalleryList", GalleryList);
		sMap.put("GoodsList", GoodsList);
		
		return sMap;
	}
	
	//예약관리(노출설정) 체크된값 insert
	public int adminreser(StorereservationVo storereservationvo) {
		return storeDao.adminreser(storereservationvo);
	}
	
	//매장정보수정
	public int InfoModify(ShopVo shopVo, MultipartFile Logo, MultipartFile Header) {
		
		if(!Logo.getOriginalFilename().equals("") && !Header.getOriginalFilename().equals("")) {
			String shopLogo = Gallery(Logo);
			String shopHeader = Gallery(Header);
			
			shopVo.setShopLogo(shopLogo);
			shopVo.setShopHeader(shopHeader);
			
			return storeDao.storeUpdate(shopVo);
		}
		else if (Logo.getOriginalFilename().equals("") && !Header.getOriginalFilename().equals("")) {
			String shopHeader = Gallery(Header);
			
			ShopVo storeVo = storeDao.StoreSelect(shopVo.getShopDomain());	
			String shopLogo = storeVo.getShopLogo();
			
			shopVo.setShopLogo(shopLogo);
			shopVo.setShopHeader(shopHeader);
			
			return storeDao.storeUpdate(shopVo);
		}
		else if (!Logo.getOriginalFilename().equals("") && Header.getOriginalFilename().equals("")) {
			String shopLogo = Gallery(Logo);
			
			ShopVo storeVo = storeDao.StoreSelect(shopVo.getShopDomain());	
			String shopHeader = storeVo.getShopHeader();
			
			shopVo.setShopLogo(shopLogo);
			shopVo.setShopHeader(shopHeader);
			
			return storeDao.storeUpdate(shopVo);
		}
		else {
			ShopVo storeVo = storeDao.StoreSelect(shopVo.getShopDomain());	
			String shopHeader = storeVo.getShopHeader();
			String shopLogo = storeVo.getShopLogo();
			
			shopVo.setShopLogo(shopLogo);
			shopVo.setShopHeader(shopHeader);
			
			return storeDao.storeUpdate(shopVo);
		}
		
	}
	//예약 여부,시간 리스트 읽어오기
	public List<StorereservationVo> restime(StorereservationVo storereservationvo){
		return storeDao.restime(storereservationvo);
	}
	
	//예약할 때 선택한 강아지 정보 가져오기
	public DogVo getdog(DogVo dogvo) {
		return storeDao.getdog(dogvo);
	}
	
	//예약할 때 유저 정보 가져오기
	public UserVo getuser(int userNo) {
		return storeDao.getuser(userNo);
	}
	//예약할 때 선택한 유저에 대한 강아지 리스트 가져오기
	public List<DogVo> getdList(int userNo){
		return dogDao.getList(userNo);
	}
	
	//예약 데이터 전송
	public void insertres(ReservationVo reservationvo) {
		storeDao.insertres(reservationvo);

		storeDao.taken(reservationvo);
	}
	
	//글 등록
	public int boardAdd(BoardVo boardVo,MultipartFile imgFile) {
		if(imgFile != null) {
			String img = Gallery(imgFile);
			boardVo.setImg(img);
			
			return storeDao.boardAdd(boardVo);
		}
		else{
			boardVo.setImg("null");
			return storeDao.boardAdd(boardVo);
		}
	}
	
	//글 목록 검색
	public Map<String,Object> boardSelect(int menuNo) {
		List<BoardVo> boardList = storeDao.boardSelect(menuNo);
		sMap.put("boardList",boardList);
		return sMap;
	}
		
	
	//첨부파일 등록
	public String Gallery(MultipartFile file) {
		// ======데이터 추출======
		String saveDir = "C:\\JavaStudy\\dogshop";
		
		// 원본파일 이름추출
		String orgName = file.getOriginalFilename();
	
		// 확장자
		String exName = orgName.substring(orgName.lastIndexOf("."));
	
		// 저장파일이름
		String logoFile = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
	
		// 파일경로
		String filePath = saveDir + "\\" + logoFile;
	
		// ======파일 복사======
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
		return logoFile;
	}
}