package com.matjip.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.matjip.bean.ReviewBean;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertReview(ReviewBean reviewBean) {
		sqlSessionTemplate.insert("review.insertReview", reviewBean);
	}

	public void updateReview(ReviewBean reviewBean) {
		sqlSessionTemplate.update("review.updateReview", reviewBean);
	}
	
	public void deleteReview(int rev_idx) {
		sqlSessionTemplate.delete("review.deleteReview", rev_idx);
	}
		
	public ReviewBean reviewByRevIdx(int rev_idx){
		return sqlSessionTemplate.selectOne("review.reviewByRevIdx", rev_idx);
	}
	
	public List<ReviewBean> reviewByRevId(String rev_id){
		return sqlSessionTemplate.selectList("review.reviewByRevId", rev_id);
	}
	
	public List<ReviewBean> reviewByRevId(String rev_id, RowBounds rowBounds){
		return sqlSessionTemplate.selectList("review.reviewByRevId", rev_id, rowBounds);
	}
	
	public int getReviewCntByRevId(String rev_id){
		return sqlSessionTemplate.selectOne("review.getReviewCntByRevId", rev_id);
	}
	
	public List<ReviewBean> reviewAll(){
		return sqlSessionTemplate.selectList("review.reviewAll");
	}
	
	public List<ReviewBean> reviewByResId(int rs_idx){
		return sqlSessionTemplate.selectList("review.reviewByResId", rs_idx);
	}
	
	public List<ReviewBean> reviewByResId(int rs_idx, RowBounds rowBounds){
		return sqlSessionTemplate.selectList("review.reviewByResId", rs_idx, rowBounds);
	}
	
	public int getReviewCntByResId(int rs_idx){
		return sqlSessionTemplate.selectOne("review.getReviewCntByResId", rs_idx);
	}
	
	public List<ReviewBean> reviewByRegionCate(String rs_region_cate){
		return sqlSessionTemplate.selectList("review.reviewByRegionCate", rs_region_cate);
	}
	
	public String rsNameByrsIdx(int rs_idx) {
		return sqlSessionTemplate.selectOne("review.rsNameByrsIdx", rs_idx);
	}
	
	public String regCodeName(int rs_idx) {
		return sqlSessionTemplate.selectOne("review.regCodeName", rs_idx);
	}
	
	public String foodCodeName(int rs_idx) {
		return sqlSessionTemplate.selectOne("review.foodCodeName", rs_idx);
	}
	
	public List<ReviewBean> new5starReview() {
		return sqlSessionTemplate.selectList("review.new5starReview");
	}
	
	public void addRevLike(ReviewBean reviewBean) {
		sqlSessionTemplate.update("review.addRevLike", reviewBean);
	}
	
	public void delRevLike(ReviewBean reviewBean) {
		sqlSessionTemplate.update("review.delRevLike", reviewBean);
	}
}
