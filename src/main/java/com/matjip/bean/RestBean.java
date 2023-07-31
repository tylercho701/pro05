package com.matjip.bean;

import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class RestBean {
	
	private int rs_idx; 						// 글번호
	
	@NotBlank
	private String rs_name;					// 이름
	
	private String rs_file;					// 이미지파일
	
	@NotBlank
	private String rs_content;			// 글내용
	private String rs_phone;				// 전화번호
	private String rs_addr;					// 주소
	private String rs_food_cate;		// 음식분류  식사/디저트
	private String rs_region_cate;	// 지역분류 서귀포/제주
	
	//첨부파일 rs_file -> upload_file 로 변경
	private MultipartFile upload_file;
	//food_cate
	private String food_cate;
	private String food_name;
	// region_cate
	private String region_cate;
	private String region_name;
	
	//	index에 노출할 평점
	private double average;
	
}
