package com.matjip.bean;

import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class QnaBean {
	
	private String qna_idx;
	
	@NotBlank
	private String qna_title;
	
	@NotBlank
	private String qna_content;
	
	//첨부파일 content_file -> upload_file 로 변경
	private MultipartFile upload_file;
	
	private String qna_id;
	private String qna_file;
	private String qna_resdate;
	private String qna_answer;
	private int lev;
	private String parno;

}
