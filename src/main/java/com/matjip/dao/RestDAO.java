package com.matjip.dao;

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
		// System.out.println("restList 다오 :" +
		// sqlSessionTemplate.selectList("restaurant.getRestList").toString());
		return sqlSessionTemplate.selectList("restaurant.getRestList", rowBounds, rowBounds);
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
	
	public List<RestBean> getFilteredRestList_A(RestBean filteredRestBean){
		return sqlSessionTemplate.selectList("restaurant.getFilteredRestList_A", filteredRestBean);
	}
	public List<RestBean> getFilteredRestList_R(RestBean filteredRestBean){
		return sqlSessionTemplate.selectList("restaurant.getFilteredRestList_R", filteredRestBean);
	}
	public List<RestBean> getFilteredRestList_F(RestBean filteredRestBean){
		return sqlSessionTemplate.selectList("restaurant.getFilteredRestList_F", filteredRestBean);
	}

}
