package com.matjip.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.matjip.bean.NoticeBean;

@Repository
public class NoticeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;	
	
	//게시글 쓰기
	public void addNoti(NoticeBean writeNoticeBean){
		
		sqlSessionTemplate.insert("notice.addNoti", writeNoticeBean);
	}
	
	// 게시글 리스트 가져오기
	public List<NoticeBean> getNotiList(RowBounds rowBounds){	
		
		return sqlSessionTemplate.selectList("notice.getNotiList", rowBounds, rowBounds);		
	}
	
	// 상세페이지에 출력할 데이터 가져오기
	public NoticeBean getNotiDetail(int noti_idx) {
		
		return sqlSessionTemplate.selectOne("notice.getNotiDetail", noti_idx);
	}
	
	// 수정페이지에서 게시글 수정하기
	public void modifyNoti(NoticeBean modifyNoticeBean) {
		
		sqlSessionTemplate.update("notice.getModify", modifyNoticeBean);
	}
	
	// 게시글 삭제하기
	public void deleteNoti(int noti_idx) {
		
		sqlSessionTemplate.delete("notice.deleteNoti",noti_idx);
	}
	
	// 게시글 전체 개수 가져오기
	public int getNotiCnt() {
		
		return sqlSessionTemplate.selectOne("notice.getNotiCnt");
	}	
}