package com.matjip.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.matjip.bean.PageBean;
import com.matjip.bean.ReviewBean;
import com.matjip.dao.ReviewDAO;

@Service
public class ReviewService {
	@Autowired
	private ReviewDAO reviewDAO;
	
	@Value("${path.upload}")
	private String uploadPath; 
	
	//한 페이지에 나오는 게시물 수
	@Value("${page.revListCnt}")
	private int revListCnt;
	
	// 페이지 버튼 갯수
	@Value("${page.revPaginationCnt}")
	private int revPaginationCnt;
	
	// 파일 업로드
	private String saveUploadFile(MultipartFile uploadFile) {
		String fileName = System.currentTimeMillis() + "_" + uploadFile.getOriginalFilename();
		try {
			uploadFile.transferTo(new File(uploadPath+"/"+fileName));
		} catch (IllegalStateException | IOException e) {
		}
		return fileName;
	}
	
	public void insertReview(ReviewBean reviewBean) {
		MultipartFile uploadFile = reviewBean.getUpload_file();
		if(uploadFile.getSize()>0) {
			String rev_file = saveUploadFile(uploadFile);
			reviewBean.setRev_file(rev_file);
		}
		
		reviewDAO.insertReview(reviewBean);
	}
	
	public void updateReview(ReviewBean reviewBean) {
		MultipartFile uploadFile = reviewBean.getUpload_file();
		if(uploadFile.getSize()>0) {
			String rev_file = saveUploadFile(uploadFile);
			reviewBean.setRev_file(rev_file);
		}
		reviewDAO.updateReview(reviewBean);
	}
	
	public void deleteReview(int rev_idx) {
		reviewDAO.deleteReview(rev_idx);
	}
	
	public ReviewBean reviewByRevIdx(int rev_idx){
		return reviewDAO.reviewByRevIdx(rev_idx);
	}
	
	public List<ReviewBean> reviewByRevId(String rev_id){
		return reviewDAO.reviewByRevId(rev_id);
	}
	
	public List<ReviewBean> reviewAll(){
		return reviewDAO.reviewAll();
	}
	
	public List<ReviewBean> reviewByResId(int rs_idx){
		return reviewDAO.reviewByResId(rs_idx);
	}
	
	public List<ReviewBean> reviewByResId(int rs_idx, int revPage){
		int start = (revPage - 1) * revListCnt;
		RowBounds rowBounds = new RowBounds(start, revListCnt);
		return reviewDAO.reviewByResId(rs_idx, rowBounds);
	}
	
	// 리뷰 페이징 처리
	public PageBean getReviewCntByResId(int rs_idx, int currentPage){
		// 가게당 리뷰 전체 개수 가져오기
		int revCnt = reviewDAO.getReviewCntByResId(rs_idx);
		
		PageBean revPageBean = new PageBean(revCnt, currentPage, revListCnt, revPaginationCnt);
		
		return revPageBean;
	}
	
	public List<ReviewBean> reviewByRegionCate(String rs_region_cate){
		return reviewDAO.reviewByRegionCate(rs_region_cate);
	}
	
	public String rsNameByrsIdx(int rs_idx) {
		return reviewDAO.rsNameByrsIdx(rs_idx);
	}
	
	public String regCodeName(int rs_idx) {
		return reviewDAO.regCodeName(rs_idx);
	}
	
	public String foodCodeName(int rs_idx) {
		return reviewDAO.foodCodeName(rs_idx);
	}
	
	public void addRevLike(ReviewBean reviewBean) {
		reviewDAO.addRevLike(reviewBean);
	}
	
	public void delRevLike(ReviewBean reviewBean) {
		reviewDAO.delRevLike(reviewBean);
	}
}
