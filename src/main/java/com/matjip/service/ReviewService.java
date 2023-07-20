package com.matjip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.matjip.dao.ReviewDAO;
import com.matjip.dto.ReviewDTO;

@Service
public class ReviewService {
	@Autowired
	private ReviewDAO reviewDAO;
	
	public void insertReview(ReviewDTO reviewDTO) {
		reviewDAO.insertReview(reviewDTO);
	}
	
	public List<ReviewDTO> reviewAll(){
		return reviewDAO.reviewAll();
	}
	
	public List<ReviewDTO> reviewByResId(int rs_idx){
		return reviewDAO.reviewByResId(rs_idx);
	}
	
	public List<ReviewDTO> reviewByRegionCate(String rs_region_cate){
		return reviewDAO.reviewByRegionCate(rs_region_cate);
	}
}
