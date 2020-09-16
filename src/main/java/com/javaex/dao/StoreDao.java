package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.BoardVo;
import com.javaex.vo.DogVo;
import com.javaex.vo.MenuVo;
import com.javaex.vo.ReservationVo;
import com.javaex.vo.ShopVo;
import com.javaex.vo.StorereservationVo;
import com.javaex.vo.UserVo;

@Repository
public class StoreDao {
	@Autowired
	SqlSession sqlSession;
	
	//매장정보 조회하기
	public ShopVo StoreSelect(String shopDomain) {
		return sqlSession.selectOne("store.selectOne", shopDomain);
	}
	
	//매장메뉴 조회하기
	public List<MenuVo> MenuSelect(int shopNo) {
		return sqlSession.selectList("menu.menuSelect", shopNo);
	}
	
	//매장정보 업데이트 
	public int storeUpdate(ShopVo shopVo) {
		return sqlSession.update("store.update", shopVo);
	}
	
	//글 등록
	public int boardAdd(BoardVo boardVo) {
		int count = sqlSession.insert("board.boardInsert", boardVo);
		return count;
	}
		
	//글 목록 검색
	public List<BoardVo> boardSelect(int menuNo) {
		return sqlSession.selectList("board.boardSelect", menuNo);
	}
	
	//예약관리(관리자)
	public List<ReservationVo> getRList(int shopNo){
		return sqlSession.selectList("reservation.getRList",shopNo);
	}
	
	//예약관리(노출설정) 체크된 값 insert
	public int adminreser(StorereservationVo storereservationvo) {
		return sqlSession.insert("storeres.adminreser", storereservationvo);
	}
	
	//예약여부,시간값 불러오기
	public List<StorereservationVo> restime(StorereservationVo storereservationvo) {
		return sqlSession.selectList("storeres.restime", storereservationvo);
	}
	
	//예약할때 강아지 정보 가져오기
	public DogVo getdog(DogVo dogvo) {
		return sqlSession.selectOne("dog.getdog", dogvo);
	}
	//예약할때 유저 정보 가져오기
	public UserVo getuser(int userNo) {
		return sqlSession.selectOne("user.getuser", userNo);
	}
	
	//예약 정보 DB저장
	public int insertres(ReservationVo reservationvo) {
		return sqlSession.insert("reservation.insertres",reservationvo);
	}
	//예약한 시간 값 삭제
	public void taken(ReservationVo reservationvo) {
		sqlSession.delete("storeres.taken", reservationvo);
	}
}
