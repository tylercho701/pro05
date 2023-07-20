package com.matjip.dto;

import lombok.Data;

@Data
public class NoticeDTO {
	private int noti_idx;  
	private String noti_title;
	private String noti_content; 
	private String noti_author;
	private String noti_file;
	private String noti_regdate; 
}
