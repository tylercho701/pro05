package com.matjip.bean;

import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoticeBean {
	
	private int noti_idx;
	
	@NotBlank
	private String noti_title;
	
	@NotBlank
	private String noti_content;
	
	//첨부파일 noti_file -> upload_file 로 변경
	private MultipartFile upload_file;
	
	private String noti_author;
	private String noti_file;
	private String noti_regdate;
	
	public String user_id;
	public String user_name; 	
		
}
