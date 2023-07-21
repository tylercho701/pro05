package com.matjip.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.matjip.bean.NoticeBean;
import com.matjip.bean.QnaBean;

@Repository
public class QnaDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;	
	
//	public void addContentInfo(NoticeBean writeNoticeBean){
//		
//		sqlSessionTemplate.insert("notice.addNotiInfo", writeNoticeBean);
//	}
	
	// 게시글 리스트 가져오기
	public List<QnaBean> getQnaList(RowBounds rowBounds){
		
		// System.out.println(sqlSessionTemplate.selectList("notice.getNotiList"));
		return sqlSessionTemplate.selectList("qna.getQnaList", rowBounds );
	}
	
	// 상세페이지에 출력할 데이터 가져오기
	public QnaBean getQnaInfo(String qna_idx) {
		
		return sqlSessionTemplate.selectOne("qna.getQnaInfo", qna_idx);
	}
//	
//	// 수정페이지에서 게시글 수정하기
//	public void modifyContentInfo(ContentBean modifyContentBean) {
//		
//		sqlSessionTemplate.update("board.modifyContentInfo", modifyContentBean);
//	}
//	
//	// 게시글 삭제하기
//	public void deleteContentInfo(int content_idx) {
//		
//		sqlSessionTemplate.delete("board.deleteContentInfo",content_idx);
//	}
//	
	// 게시글 전체 개수 가져오기
	public int getQnaCnt() {
		
		return sqlSessionTemplate.selectOne("qna.getQnaCnt");
	}

	
	
}