package com.matjip.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.matjip.dto.ReviewDTO;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertReview(ReviewDTO reviewDTO) {
		sqlSessionTemplate.insert("review.insertReview", reviewDTO);
	}
	
	public List<ReviewDTO> reviewAll(){
		return sqlSessionTemplate.selectList("review.reviewAll");
	}
	
	public List<ReviewDTO> reviewByResId(int rs_idx){
		return sqlSessionTemplate.selectList("review.reviewByResId", rs_idx);
	}
	
	public List<ReviewDTO> reviewByRegionCate(String rs_region_cate){
		return sqlSessionTemplate.selectList("review.reviewByRegionCate", rs_region_cate);
	}
}
