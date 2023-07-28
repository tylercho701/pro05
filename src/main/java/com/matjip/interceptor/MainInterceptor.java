package com.matjip.interceptor;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import com.matjip.bean.RestBean;
import com.matjip.service.MainService;

public class MainInterceptor implements HandlerInterceptor{
	
	@Autowired
	private MainService mainService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {		
		ArrayList<List<RestBean>> restBeanList2 = mainService.getRecentRestList();
		request.setAttribute("restBeanList2", restBeanList2);
		return true;
	}
	
}
