package com.matjip.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.matjip.dto.UserDTO;
import com.matjip.service.UserService;

@RestController
public class RestfulAPIController {

	@Autowired
	private UserService userService;
	
	@GetMapping("/user/checkUserIdExist/{user_id}")
	public String checkExistId(@PathVariable String user_id,
							   @ModelAttribute("joinUserBean") UserDTO joinUserBean) {
		
		joinUserBean.setUserIdExist(userService.checkUserIdExist(user_id));
		
		return joinUserBean.getUserIdExist();
	}
	
}
