package com.matjip.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.matjip.bean.FoodBean;
import com.matjip.bean.RegionBean;
import com.matjip.bean.RestBean;

@Repository
public class RestDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// 게시글 리스트 가져오기
	public List<RestBean> getRestList(RowBounds rowBounds) {
	
		return sqlSessionTemplate.selectList("restaurant.getRestList", rowBounds, rowBounds);
	}
		
	//게시글 리스트 (지역별)가져오기
	public List<RestBean> getRestListRegion(String rs_region_cate, RowBounds rowBounds) {
		
		return sqlSessionTemplate.selectList("restaurant.getRestListRegion", rs_region_cate, rowBounds);
	}

	//게시글 리스트 (음식별)가져오기
	public List<RestBean> getRestListFood(String rs_food_cate, RowBounds rowBounds) {
					
		return sqlSessionTemplate.selectList("restaurant.getRestListFood", rs_food_cate, rowBounds);
	}	
	
	//게시글 리스트 (지역별.음식별)가져오기
	public List<RestBean> getRestListCate(HashMap<String, String> cateMap, RowBounds rowBounds) {
					
		return sqlSessionTemplate.selectList("restaurant.getRestListCate", cateMap, rowBounds);
	}
	
	// 상세페이지에 출력할 데이터 가져오기
	public RestBean getRestDetail(int rs_idx) {

		return sqlSessionTemplate.selectOne("restaurant.getRestDetail", rs_idx);
	}

	// 더미글 입력
	public void addRestInfo(RestBean writeRestBean) {

		sqlSessionTemplate.insert("restaurant.addRestInfo", writeRestBean);
	}

	// 게시글 전체 개수 가져오기
	public int getRestCnt() {

		return sqlSessionTemplate.selectOne("restaurant.getRestCnt");
	}
	
	// 게시글 지역별 개수 가져오기
	public int getRestRegionCnt(String rs_region_cate) {

		return sqlSessionTemplate.selectOne("restaurant.getRestRegionCnt", rs_region_cate);
	}
	
	// 게시글 음식별 개수 가져오기
	public int getRestFoodCnt(String rs_food_cate) {

		return sqlSessionTemplate.selectOne("restaurant.getRestFoodCnt", rs_food_cate);
	}
	
	// 게시글 지역.음식별 개수 가져오기
	public int getRestCateCnt(HashMap<String, String> cateMap) {

		return sqlSessionTemplate.selectOne("restaurant.getRestCateCnt", cateMap);
	}

	// 수정페이지에서 게시글 수정하기
	public void modifyRestInfo(RestBean modifyRestBean) {

		sqlSessionTemplate.update("restaurant.modifyRestInfo", modifyRestBean);
	}

	// 게시글 삭제하기
	public void deleteRestInfo(int rs_idx) {

		sqlSessionTemplate.delete("restaurant.deleteRestInfo", rs_idx);
	}
	
	public List<FoodBean> getFoodTable() {
		return sqlSessionTemplate.selectList("restaurant.getFoodTable");
	}
	
	public List<RegionBean> getRegionTable() {
		return sqlSessionTemplate.selectList("restaurant.getRegionTable");
	}
	
	public List<RestBean> getRestTop3(){
		return sqlSessionTemplate.selectList("restaurant.getRestTop3");
	}

}
