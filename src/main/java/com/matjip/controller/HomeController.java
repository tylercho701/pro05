package com.matjip.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String home(HttpServletRequest request) {
		String url = request.getContextPath();
		//	System.out.println("주소표시줄에 " + url + "/ 이 입력되었습니다.");
		// return "/WEB-INF/views/index.jsp";
		return "index";
	}
	
}
