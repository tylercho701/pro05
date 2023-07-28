package com.matjip.bean;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReviewBean {
	private int rev_idx;
	
	//@NotNull 잘못된 접근입니다.(rs_idx?)
	private int rs_idx;
	
	@NotBlank
	@Size(max=30)
	private String rev_title;
	
	@NotNull
	@Max(value = 5)
	@Min(value = 1)
	private Integer rev_score = 5;
	
	//@NotNull 잘못된 접근입니다.(rev_id?)
	private String rev_id;
	
	private MultipartFile upload_file;
	
	private String rev_file;
	
	@NotBlank
	@Size(max=300)
	private String rev_content;
	
	private String rev_regdate;
	
	private String rs_name;
	private String region_name;
	private String food_name;
}
