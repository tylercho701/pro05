package com.matjip.bean;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Data;

//user_table
@Data
public class UserBean {

	@Size(min=4, max=20)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String user_id;
	
	@Size(min=4, max=20)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String user_pw;
	
	@Size(min=4, max=20)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String user_pw2;
	
	@Size(min=2, max=4)
	@Pattern(regexp = "[가-힣]*")
	private String user_name;
	
	private String user_phone;
	private String user_email;
	
	// 이미 가입한 아이디가 있는지 여부를 저장하는 멤버변수
	private String userIdExist;
		
}
