package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.DogVo;
import com.javaex.vo.VisitVo;

@Repository
public class DogDao {
	
	@Autowired
	private SqlSession sqlSession;

	//펫 리스트
	public List<DogVo> getList(int userNo) {
		return sqlSession.selectList("dog.getList", userNo);
	}
	
	//방문내역리스트
	public List<VisitVo> getrList(int userNo){
		return sqlSession.selectList("reservation.getrList", userNo);
	}
	
	//펫 추가
	public int add(DogVo DogVo) {
		return sqlSession.insert("dog.insert", DogVo);
	}
	
	//펫 수정
	public DogVo petSelect(String userNo) {
		return sqlSession.selectOne("dog.selectOne", userNo);
	}
	
}
