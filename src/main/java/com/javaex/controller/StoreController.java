package com.javaex.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.service.StoreService;
import com.javaex.vo.BoardVo;
import com.javaex.vo.DogVo;
import com.javaex.vo.ReservationVo;
import com.javaex.vo.SessionVo;
import com.javaex.vo.ShopVo;
import com.javaex.vo.StorereservationVo;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping("store/{shopDomain}")
public class StoreController {
	@Autowired
	StoreService storeService;
	
	//매장 메인페이지
	@RequestMapping("/main")
	public String StoreMain(@PathVariable("shopDomain") String shopDomain , Model model) {
		Map<String,Object> sMap = storeService.StoreMain(shopDomain);
		model.addAttribute("sMap", sMap);
		
		return "store/storeMain";
	}
	
	//매장관리 페이지-예약관리
	@RequestMapping("/store-reservation")
	public String StoreReservation(@PathVariable("shopDomain") String shopDomain , Model model) {
		Map<String,Object> sMap = storeService.StoreMain(shopDomain);
		
		model.addAttribute("sMap", sMap);
		
		return "store/store-reservation";
	}
	
	//매장관리자가 예약 노출 설정
	@ResponseBody
	@RequestMapping(value = "/read", method = { RequestMethod.GET, RequestMethod.POST })
	public void read(@PathVariable("shopDomain") String shopDomain, @ModelAttribute StorereservationVo storereservationvo,
			   Model model) {
		Map<String,Object> sMap = storeService.StoreMain(shopDomain);
		ShopVo shopVo = (ShopVo)sMap.get("shopVo");
		
		model.addAttribute("shopVo", shopVo);
		storereservationvo.setShopno(shopVo.getShopNo());
		
		storeService.adminreser(storereservationvo);
	
	}
	
	//매장관리 페이지- 정보수정폼
	@RequestMapping("/store-infoModify")
	public String StoreInfoModify(@PathVariable("shopDomain") String shopDomain, Model model) {
		Map<String,Object> sMap = storeService.StoreMain(shopDomain);
		model.addAttribute("sMap", sMap);
		
		return "store/store-infoModify";
	}
	
	//매장관리 페이지-정보수정
	@RequestMapping("/infoModify")
	public String InfoModify(@ModelAttribute ShopVo shopVo,
						     @RequestParam("Logo") MultipartFile shopLogo,
			                 @RequestParam("Header")MultipartFile shopHeader) {
		
		storeService.InfoModify(shopVo,shopLogo,shopHeader);
		
		return "redirect:/store/"+shopVo.getShopDomain()+"/main";
	}
	
	//예약하기 페이지 폼
	@RequestMapping("/reservationForm")
	public String reservationForm(@PathVariable("shopDomain") String shopDomain , Model model,HttpSession session) {
		Map<String,Object> sMap = storeService.StoreMain(shopDomain);
		
		UserVo userVo = storeService.getuser(((SessionVo)session.getAttribute("session")).getUserNo());
		//유저 정보
		sMap.put("userVo", userVo);
		
		List<DogVo> dList = storeService.getdList(((SessionVo)session.getAttribute("session")).getUserNo());
		sMap.put("dList", dList);
		
		model.addAttribute("sMap", sMap);
			
		return "store/reservation";
	}
	
	//예약 여부 읽어오기
	@ResponseBody
	@RequestMapping("/seldate")
	public List<StorereservationVo> seldate(@PathVariable("shopDomain") String shopDomain, @ModelAttribute StorereservationVo storereservationvo,
											Model model){
		Map<String,Object> sMap = storeService.StoreMain(shopDomain);
		ShopVo shopVo = (ShopVo)sMap.get("shopVo");
		
		storereservationvo.setShopno(shopVo.getShopNo());
		List<StorereservationVo> reserList = storeService.restime(storereservationvo);
		
		return reserList;
	}
	
	//강아지 정보 가져오기
	@ResponseBody
	@RequestMapping("/getdog")
	public DogVo getdog(@ModelAttribute DogVo dogvo,HttpSession session) {
		dogvo.setUserNo(((SessionVo)session.getAttribute("session")).getUserNo());
		
		dogvo = storeService.getdog(dogvo);
		return dogvo;
	}
	
	//예약하기 데이터 전송
	@RequestMapping("/reservation")
	public String reservation(@PathVariable("shopDomain") String shopDomain,@ModelAttribute ReservationVo reservationvo,
							  Model model, HttpSession session) {
	  
	  Map<String,Object> sMap = storeService.StoreMain(shopDomain);
	  ShopVo shopVo = (ShopVo)sMap.get("shopVo");
	  
	  reservationvo.setShopno(shopVo.getShopNo());
	  reservationvo.setUserno(((SessionVo)session.getAttribute("session")).getUserNo());
	  reservationvo.setUsername(((SessionVo)session.getAttribute("session")).getUserName());
	  storeService.insertres(reservationvo);
	  
	  return "redirect:/store/${shopDomain}/reservationForm";
	}
	
	//공지사항 페이지 폼
	@RequestMapping("/noticeForm")
	public String storeNoticeForm(@RequestParam("menuNo")int menuNo ,Model model) {
		Map<String,Object> sMap = storeService.boardSelect(menuNo);
		model.addAttribute("sMap", sMap);
		
		return "store/store-notice";
	}
	//사진첩 페이지 폼
	@RequestMapping("/galleryForm")
	public String petPriceForm(@PathVariable("shopDomain") String shopDomain,@RequestParam("menuNo")int menuNo, Model model) {
		Map<String,Object> sMap = storeService.boardSelect(menuNo);
		model.addAttribute("sMap", sMap);
		return "store/store-gallery";
	}
	
	//가격표 페이지 폼
	@RequestMapping("/priceForm")
	public String storePriceForm(@RequestParam("menuNo")int menuNo, Model model) {
		Map<String,Object> sMap = storeService.boardSelect(menuNo);
		model.addAttribute("sMap", sMap);
		
		return "store/store-price";
	}
	
	//애견용품 페이지 폼
	@RequestMapping("/petGoodsForm")
	public String petGoodsForm(@PathVariable("shopDomain") String shopDomain,@RequestParam("menuNo")int menuNo, Model model) {
		Map<String,Object> sMap = storeService.boardSelect(menuNo);
		model.addAttribute("sMap", sMap);
		return "store/store-petGoods";
	}
	
	//찾아오시는 길 페이지 폼
	@RequestMapping("/mapForm")
	public String mapForm(@PathVariable("shopDomain") String shopDomain,@RequestParam("menuNo")int menuNo, Model model) {
		Map<String,Object> sMap = storeService.boardSelect(menuNo);
		model.addAttribute("sMap", sMap);
		return "store/store-map";
	}
	
	//데이터 전송
	@RequestMapping("/boardAdd")
	public String boardAdd(@PathVariable("shopDomain") String shopDomain,
							  @RequestParam(value = "title", required = false) String title,
							  @RequestParam(value = "content", required = false) String content,
							  @RequestParam(value = "imgFile", required = false) MultipartFile imgFile,
							  @RequestParam(value = "menuNo")int menuNo) 	{
		BoardVo boardVo = new BoardVo(menuNo,title,content);
		storeService.boardAdd(boardVo,imgFile);
		
		switch(menuNo%5) {
			case 1: return "redirect:/store/"+shopDomain+"/noticeForm?menuNo="+menuNo;
			case 2: return "redirect:/store/"+shopDomain+"/galleryForm?menuNo="+menuNo;
			case 3: return "redirect:/store/"+shopDomain+"/priceForm?menuNo="+menuNo;
			case 4: return "redirect:/store/"+shopDomain+"/petGoodsForm?menuNo="+menuNo;
			case 0:	return "redirect:/store/"+shopDomain+"/mapForm?menuNo="+menuNo;
		}
		return "";
	}
	
}
