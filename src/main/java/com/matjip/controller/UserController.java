package com.matjip.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.matjip.bean.UserBean;
import com.matjip.dto.UserDTO;
import com.matjip.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserService userService;

	@GetMapping("/login")
	public String loginPageLoader(@ModelAttribute("loginUserInfo") UserBean userbean,
	        					  @RequestParam(value="fail", defaultValue="false") boolean fail,
	        					  Model model) {
		
		model.addAttribute("fail", fail);
		
		return "user/login";
	}
	
	@PostMapping("/login_procedure")
	public String loginProcedure(@Valid @ModelAttribute("loginUserInfo") UserBean loginUserInfo,
								 @RequestParam(value="fail", defaultValue="false") boolean fail,
	                             HttpServletRequest request, Model model, BindingResult result) {
		if(result.hasErrors()) {
			fail = true;
			model.addAttribute("fail", fail);
			return "user/login";
		}
		

		// 로그인 성공한 경우 처리하는 부분
		UserBean ifSuccess = userService.checkExistUser(loginUserInfo);
		//	System.out.println(ifSuccess.user_id);
		if(ifSuccess != null) {
			HttpSession session = request.getSession();
			String sid = ifSuccess.getUser_id();				
			session.setAttribute("sid", sid);
			return "user/login_success";
		} else {
		  return "user/login_fail";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "user/logout";
	}
	
	@GetMapping("/join")
	public String joinPageLoader(@ModelAttribute("joinUserBean") UserBean joinUserBean,
	        					Model model) {
		
		return "user/join";
	}
	
	@PostMapping("/join_procedure")
	public String joinProcedure(@Valid @ModelAttribute("joinUserBean") UserBean joinUserBean,
								Model model, BindingResult result) {
		
		
		
		if(result.hasErrors()) {
			return "user/join_fail";
		}
		
		userService.insertUser(joinUserBean);
		
		return "user/join_success";
	}
	
	@GetMapping("/modify")
	public String updatePageLoader(@ModelAttribute("loggedUserInfo") UserBean loggedUserInfo,
								   HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		String sid = (String) session.getAttribute("sid");
		
		loggedUserInfo = userService.getLoggedUserInfo(sid);
		//	System.out.println(loggedUserInfo.getUser_pw());
		loggedUserInfo.setUser_pw2(loggedUserInfo.getUser_pw());
		
		model.addAttribute("loggedUserInfo", loggedUserInfo);
		
		return "user/update";
	}
	
	@PostMapping("/update_procedure")
	public String updateProcedure(@Valid @ModelAttribute("loggedUserInfo") UserBean loggedUserInfo,
								  HttpServletRequest request, BindingResult result) {
		
		if(result.hasErrors()) {
			HttpSession session = request.getSession();
			String sid = (String) session.getAttribute("sid");
			return "user/modify";
		}
		
		userService.updateUser(loggedUserInfo);
		
		return "user/modify_success";
	}
	
	@GetMapping("/delete")
	public String deleteUser(@ModelAttribute("user_id") String user_id, BindingResult result,
							 HttpServletRequest request) {
		
		if(result.hasErrors()) {
			return "user/delete_fail";
		}
		userService.deleteUser(user_id);
		HttpSession session = request.getSession();
		session.invalidate();
		return "user/delete_success";
	}
	
	@GetMapping("/invalidUser")
	public String invalidUser() {
		return "user/invalidUser";
	}
	
}
