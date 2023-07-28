package com.matjip.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.matjip.bean.CateBean;
import com.matjip.bean.RestBean;
import com.matjip.dao.MainDAO;
import com.matjip.dao.ReviewDAO;

@Service
public class MainService {
	
	@Autowired
	private MainDAO mainDAO;
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	/* food_cate 불러오기 */
	public List<String> getFoodCate(){
		return mainDAO.getFoodCate();
	}
	
	/* region_cate 불러오기 */
	public List<String> getRegionCate(){
		return mainDAO.getRegionCate();
	}
	
	/* 음식분류, 지역분류를 통한 음식점 리스트 불러오기 */
	public ArrayList<List<RestBean>> getRecentRestList(){
		ArrayList<List<RestBean>> restBeanList2 = new ArrayList<List<RestBean>>();
		List<String> foodCateList = mainDAO.getFoodCate();
		List<String> regionCateList = mainDAO.getRegionCate();
		for(String rs_food_cate : foodCateList) {
			for(String rs_region_cate : regionCateList) {
				
				CateBean cateBean = new CateBean();
				cateBean.setRs_food_cate(rs_food_cate);
				cateBean.setRs_region_cate(rs_region_cate);
				List<RestBean> restBeanList = mainDAO.getRecentRestList(cateBean);
				
				for(RestBean restBean : restBeanList) {
					int rs_idx = restBean.getRs_idx();
					String food_name = reviewDAO.foodCodeName(rs_idx); 
					String region_name = reviewDAO.regCodeName(rs_idx);
					restBean.setFood_name(food_name);
					restBean.setRegion_name(region_name);
				}
				
				restBeanList2.add(restBeanList);
			}
		}
		return restBeanList2;
	}
}
