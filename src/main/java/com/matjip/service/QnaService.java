package com.matjip.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.matjip.bean.PageBean;
import com.matjip.bean.QnaBean;
import com.matjip.bean.UserBean;
import com.matjip.dao.QnaDAO;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class QnaService {
	
	@Autowired
	private QnaDAO qnaDAO;
	
	// Session Scope 에 있는 UserBean 객체 주입받아야함
	@Resource(name = "loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	// 파일 업로드 경로
	@Value("${path.upload}")
	private String pathUpload;
	
	// 페이징 관련 변수 : 페이지당 게시글의 개수
	@Value("${page.listcnt}")
	private int pageListcnt;
	
	// 페이징 관련 변수 : 페이지 버튼 개수
	@Value("${page.paginationcnt}")
	private int pagePaginationcnt;
			
	//질문 추가하기
	public void addQna(QnaBean writeQnaBean) {
			
		qnaDAO.addQna(writeQnaBean);			
	}
	
	// 답변 추가하기
	public void addQnaReply(QnaBean replyQnaBean) {
		
		qnaDAO.addQnaReply(replyQnaBean);		
	}
	
	// 답변 달기 성공시 답글수 카운트업!
	public void qnaReplyCntUp(QnaBean questionBean) {
		
		qnaDAO.qnaReplyCntUp(questionBean);		
	}
	
	// 게시글 리스트 가져오기
	public List<QnaBean> getQnaList(int page){

  //		page	pagination number
  //		1	->	0	(start)	<- (page - 1) * pageListcnt(10)
  //		2	->	10
  //		3	->	20
		
		int start = (page - 1) * pageListcnt;
		//
		RowBounds rowBounds = new RowBounds(start, pageListcnt);	
		
		return qnaDAO.getQnaList(rowBounds);
	}
	
  //게시글 리스트 가져오기
  	public List<QnaBean> getQnaReplyList(int page){
    
		int start = (page - 1) * pageListcnt;
		
		RowBounds rowBounds = new RowBounds(start, pageListcnt);	
		
		return qnaDAO.getQnaReplyList(rowBounds);
	}	
	
	// 상세페이지에 출력할 데이터 가져오기
	public QnaBean getQnaDetail(int qna_idx) {
	
		return qnaDAO.getQnaDetail(qna_idx);
	}
	
	// 수정페이지에서 게시글 수정하기
	public void modifyQna(QnaBean modifyQnaBean) {
		
		qnaDAO.modifyQna(modifyQnaBean);
	}
	
	// 게시글 삭제하기
	public void deleteQna(int qna_idx) {
		
		qnaDAO.deleteQna(qna_idx);
	}		
	
	// 답글 삭제하기
	public void deleteReply(int qna_idx) {
		
		qnaDAO.deleteReply(qna_idx);
	}		
	//답변 삭제시 답글수 카운트다운!
	public void qnaReplyCntDown(QnaBean questionBean) {
		
		qnaDAO.qnaReplyCntDown(questionBean);
	}	
	
	// 게시글 전체 개수 가져오기
	// Controller 로부터 int content_board_idx, int currentP 값을 받아옴
	// pageListcnt : 페이지당 게시글의 개수
	// pagePaginationcnt : 페이지 버튼 개수	
	public PageBean getQnaCnt(int currentP) {
		
		int qnaCnt = qnaDAO.getQnaCnt();
		
		PageBean pageBean = new PageBean(qnaCnt, currentP, pageListcnt, pagePaginationcnt);
		
		return pageBean;
	}	
}
