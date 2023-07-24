package com.matjip.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class UserInterceptor implements HandlerInterceptor{

	/*
	 * @Resource(name="")
	 * 
	 * @Lazy
	 */
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {		
		if(request.getSession().getAttribute("sid")==null) {
			response.sendRedirect(request.getContextPath()+"/user/invalidUser");
			return false;
		}
		return true;
	}
	
}
