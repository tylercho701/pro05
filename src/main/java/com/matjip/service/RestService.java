package com.matjip.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.matjip.bean.FoodBean;
import com.matjip.bean.PageBean;
import com.matjip.bean.RegionBean;
import com.matjip.bean.RestBean;
import com.matjip.bean.UserBean;
import com.matjip.dao.RestDAO;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class RestService {

	@Autowired
	private RestDAO restDAO;

//Session Scope 에 있는 UserBean 객체 주입받아야함
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

	// 파일을 저장하는 메소드
	private String saveUploadFile(MultipartFile uploadFile) {
		String fileName = System.currentTimeMillis() + "_" + uploadFile.getOriginalFilename();

		try {
			uploadFile.transferTo(new File(pathUpload + "/" + fileName));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return fileName;

	}

	public void addRestInfo(RestBean writeRestBean) {

		/*
		 * System.out.println(writeContentBean.getContent_subject());
		 * System.out.println(writeContentBean.getContent_text());
		 * System.out.println(writeContentBean.getUpload_file());
		 * System.out.println(writeContentBean.getUpload_file().getSize());
		 */

		MultipartFile uploadFile = writeRestBean.getUpload_file();

		if (uploadFile.getSize() > 0) {

			// 파일이름
			String fileName = saveUploadFile(uploadFile);
			System.out.println("fileName : " + fileName);
			writeRestBean.setRs_file(fileName);
		}

		// 현재 로그인 상태인 사람이 작성자가 됨
		// 작성자 인덱스번호(content_writer_idx) 에
		// 현재 로그인 상태인 사람(UserBean("loginUserBean")) 의

		// Service 에서 DAO(Repository) 에 있는 addRestInfo() 호출하기
		restDAO.addRestInfo(writeRestBean);

	}

	// 게시글 리스트 가져오기
	public List<RestBean> getRestList(int page) {

//		page	pagination number
//		1	->	0	(start)	<- (page - 1) * pageListcnt(10)
//		2	->	10
//		3	->	20

		int start = (page - 1) * pageListcnt;

		RowBounds rowBounds = new RowBounds(start, pageListcnt);

		// System.out.println(noticeDAO.getNotiList(rowBounds));
		// System.out.println("restList 서비스 :" + restDAO.getRestList());
		return restDAO.getRestList(rowBounds);
	}
	
	//게시글 리스트(지역별) 가져오기
	public List<RestBean> getRestListRegion(int page, String rs_region_cate){
					
		int start = (page - 1) * pageListcnt;
		RowBounds rowBounds = new RowBounds(start, pageListcnt);
		return restDAO.getRestListRegion(rs_region_cate, rowBounds);
	}

	//게시글 리스트(음식별) 가져오기
	public List<RestBean> getRestListFood(int page, String rs_food_cate){
					
		int start = (page - 1) * pageListcnt;
		RowBounds rowBounds = new RowBounds(start, pageListcnt);
		return restDAO.getRestListFood(rs_food_cate, rowBounds);
	}	
	
	//게시글 리스트(지역.음식별) 가져오기
	public List<RestBean> getRestListCate(int page, HashMap<String, String> cateMap){
					
		int start = (page - 1) * pageListcnt;
		RowBounds rowBounds = new RowBounds(start, pageListcnt);
		return restDAO.getRestListCate(cateMap, rowBounds);
	}
		
	// 상세페이지에 출력할 데이터 가져오기
	public RestBean getRestDetail(int rs_idx) {

		return restDAO.getRestDetail(rs_idx);
	}

	// 수정페이지에서 게시글 수정하기
	public void modifyRestInfo(RestBean modifyRestBean) {

		MultipartFile upload_file = modifyRestBean.getUpload_file();

		if (upload_file.getSize() > 0) {

			// 파일이름
			String file_name = saveUploadFile(upload_file);
			System.out.println("fileName : " + file_name);
			modifyRestBean.setRs_file(file_name);
		}

		restDAO.modifyRestInfo(modifyRestBean);
	}

	// 게시글 전체 개수 가져오기
	// Controller 로부터 int content_board_idx, int currentP 값을 받아옴
	// pageListcnt : 페이지당 게시글의 개수
	// pagePaginationcnt : 페이지 버튼 개수
	public PageBean getRestCnt(int currentP) {

		int restCnt = restDAO.getRestCnt();

		PageBean pageBean = new PageBean(restCnt, currentP, pageListcnt, pagePaginationcnt);

		// System.out.println(pageListcnt);
		return pageBean;
	}
	
	// 게시글 지역별 개수 가져오기	
	public PageBean getRestRegionCnt(int currentP, String rs_region_cate ) {
	
		int restCnt = restDAO.getRestRegionCnt(rs_region_cate);
		System.out.println("restCnt : "+ restCnt);
		PageBean pageBean = new PageBean(restCnt, currentP, pageListcnt, pagePaginationcnt);
	
		// System.out.println(pageListcnt);
		return pageBean;
	}
	
	// 게시글 음식별 개수 가져오기	
	public PageBean getRestFoodCnt(int currentP, String rs_food_cate) {

		int restCnt = restDAO.getRestFoodCnt(rs_food_cate);

		PageBean pageBean = new PageBean(restCnt, currentP, pageListcnt, pagePaginationcnt);

		// System.out.println(pageListcnt);
		return pageBean;
	}
	
	// 게시글 지역.음식별 개수 가져오기	
	public PageBean getRestCateCnt(int currentP, HashMap<String, String> cateMap) {

		int restCnt = restDAO.getRestCateCnt(cateMap);
		
		PageBean pageBean = new PageBean(restCnt, currentP, pageListcnt, pagePaginationcnt);

		// System.out.println(pageListcnt);
		return pageBean;
	}

	// 게시글 삭제하기
	public void deleteRestInfo(int rs_idx) {

		restDAO.deleteRestInfo(rs_idx);
	}
	
	public List<FoodBean> getFoodTable() {
		return restDAO.getFoodTable();
	}
	
	public List<RegionBean> getRegionTable() {
		return restDAO.getRegionTable();
	}

	public List<RestBean> getRestTop3(){
		return restDAO.getRestTop3();
	}
}
