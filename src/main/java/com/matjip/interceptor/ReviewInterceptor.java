package com.matjip.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import com.matjip.bean.ReviewBean;
import com.matjip.service.ReviewService;

public class ReviewInterceptor implements HandlerInterceptor{

	/*
	 * @Resource(name="")
	 * 
	 * @Lazy
	 */
	
	@Autowired
	private ReviewService reviewService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {		
		int rev_idx = Integer.parseInt(request.getParameter("rev_idx"));
		ReviewBean tmpReviewBean = reviewService.reviewByRevIdx(rev_idx);
		String sid = request.getSession().getAttribute("sid").toString();
		if(!(!tmpReviewBean.getRev_id().equals(sid) ^ !sid.equals("admin"))) {
	         response.sendRedirect(request.getContextPath()+"/review/invalidUser");
	         return false;
	      }
		return true;
	}
	
}
