package com.matjip.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.matjip.bean.QnaBean;

@Repository
public class QnaDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;	
	
	// 질문 입력하기
	public void addQna(QnaBean writeQnaBean){
		
		sqlSessionTemplate.insert("qna.addQna", writeQnaBean);
	}
	
	// 답변 입력하기
	public void addQnaReply(QnaBean replyQnaBean){
		
		sqlSessionTemplate.insert("qna.addQnaReply", replyQnaBean);
	}
	
	//답변 달기 성공시 답글수 카운트업!
	public void qnaReplyCntUp(QnaBean questionBean) {
		
		sqlSessionTemplate.update("qna.cntUp",questionBean);		
	}

	// 게시글 리스트 가져오기
	public List<QnaBean> getQnaList(RowBounds rowBounds){		
	
		return sqlSessionTemplate.selectList("qna.getQnaList", rowBounds );
	}
	
	//게시글 (답변)리스트 가져오기
	public List<QnaBean> getQnaReplyList(RowBounds rowBounds){
		
		// System.out.println(sqlSessionTemplate.selectList("notice.getNotiList"));
		return sqlSessionTemplate.selectList("qna.getQnaReplyList", rowBounds );
	}		
	
	// 상세페이지에 출력할 데이터 가져오기
	public QnaBean getQnaDetail(int qna_idx) {
		
		return sqlSessionTemplate.selectOne("qna.getQnaDetail", qna_idx);
	}
	
	// 수정페이지에서 게시글 수정하기
	public void modifyQna(QnaBean modifyQnaBean) {
		
		sqlSessionTemplate.update("qna.getModify", modifyQnaBean);
	}
	
	// 게시글 삭제하기
	public void deleteQna(int qna_idx) {
		
		sqlSessionTemplate.delete("qna.deleteQna",qna_idx);
	}	
	
	//답글 삭제하기
	public void deleteReply(int qna_idx) {
		
		sqlSessionTemplate.delete("qna.deleteReply",qna_idx);
	}	
		
	//답변 삭제시 답글수 카운트다운!
	public void qnaReplyCntDown(QnaBean questionBean) {
		
		sqlSessionTemplate.update("qna.cntDown",questionBean);		
	}	
	
	// 게시글 전체 개수 가져오기
	public int getQnaCnt() {
		
		return sqlSessionTemplate.selectOne("qna.getQnaCnt");
	}
	
}