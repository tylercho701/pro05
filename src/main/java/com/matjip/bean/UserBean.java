package com.matjip.bean;

import lombok.Data;

//user_table
@Data
public class UserBean {

	private String user_id;
	private String user_pw;
	private String user_pw2;
	private String user_name;
	private String user_phone;
	private String user_email;
	
	// 이미 가입한 아이디가 있는지 여부를 저장하는 멤버변수
	private String userIdExist;
		
}
