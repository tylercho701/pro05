package com.matjip.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.matjip.bean.CateBean;
import com.matjip.bean.RestBean;

@Repository
public class MainDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/* 존재하는 food_cate 불러오기 */
	public List<String> getFoodCate(){
		return sqlSessionTemplate.selectList("main.getFoodCate");
	}
	
	/* 존재하는 region_cate 불러오기 */
	public List<String> getRegionCate(){
		return sqlSessionTemplate.selectList("main.getRegionCate");
	}
	
	/* 음식분류, 지역분류를 통한 음식점 리스트 불러오기 */
	public List<RestBean> getRecentRestList(CateBean cateBean){
		return sqlSessionTemplate.selectList("main.getRecentRestList", cateBean);
	}
}
