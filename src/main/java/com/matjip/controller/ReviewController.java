package com.matjip.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
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

import com.matjip.bean.PageBean;
import com.matjip.bean.ReviewBean;
import com.matjip.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;

	@GetMapping("/main")
	public String reviewMain(HttpServletRequest request,
			@RequestParam(value="myPage", defaultValue="1") int myPage,
			Model model) {
		// 내가 작성한 리뷰
		String rev_id = (String) request.getSession().getAttribute("sid");
		List<ReviewBean> myReviewList = reviewService.reviewByRevId(rev_id, myPage);
		model.addAttribute("myReviewList", myReviewList);
		
		PageBean myRevPageBean = reviewService.getReviewCntByRevId(rev_id, myPage);
		model.addAttribute("myRevPageBean", myRevPageBean);
		model.addAttribute("myPage", myPage);
		
		return "review/main";
	}

//	@GetMapping("/all")
//	public String reviewAll(Model model) {
//		List<ReviewBean> reviewList = reviewService.reviewAll();
//		model.addAttribute("reviewList", reviewList);
//		return "review/template";
//	}
	
	@GetMapping("/detail")
	public String reviewDetail(@RequestParam int rev_idx,
							   @RequestParam(defaultValue = "0") int myPage,
							   @RequestParam(defaultValue = "0") int rs_idx,
						   	   @RequestParam(defaultValue = "0") int page,
							   @RequestParam(defaultValue = "0") int revPage,
							   Model model) {
		ReviewBean reviewBean = reviewService.reviewByRevIdx(rev_idx);
		model.addAttribute("reviewBean", reviewBean);
		model.addAttribute("myPage", myPage);
		
		model.addAttribute("rs_idx", rs_idx);
		model.addAttribute("page", page);
		model.addAttribute("revPage", revPage);
		
		return "review/template";
	}

//	@GetMapping("/rs_idx/{rs_idx}")
//	public String reviewByResId(@PathVariable int rs_idx, Model model) {
//		List<ReviewBean> reviewList = reviewService.reviewByResId(rs_idx);
//		model.addAttribute("reviewList", reviewList);
//		return "review/template";
//	}
//
//	@GetMapping("/region/{rs_region_cate}")
//	public String reviewByReviewCnt(@PathVariable String rs_region_cate, Model model) {
//		List<ReviewBean> reviewList = reviewService.reviewByRegionCate(rs_region_cate);
//		model.addAttribute("reviewList", reviewList);
//		return "review/template";
//	}
//
//	@GetMapping("/myReview")
//	public String reviewByRevId(HttpServletRequest request, Model model) {
//		String rev_id = (String) request.getSession().getAttribute("sid");
//		List<ReviewBean> reviewList = reviewService.reviewByRevId(rev_id);
//		model.addAttribute("reviewList", reviewList);
//		return "review/template";
//	}

	@GetMapping("/insertReview")
	public String getInsertReview(@ModelAttribute ReviewBean reviewBean, @RequestParam int rs_idx,
			@RequestParam int page, Model model) {
		model.addAttribute("rs_idx", rs_idx);
		model.addAttribute("page", page);
		return "review/insert";
	}

	@PostMapping("/insertReview")
	public String postInsertReview(@Valid @ModelAttribute ReviewBean reviewBean, BindingResult result, 
			@RequestParam int rs_idx, 
			@RequestParam int page, 
			HttpServletRequest request, Model model) {
		model.addAttribute("rs_idx", rs_idx);
		model.addAttribute("page", page);
		if (result.hasErrors()) {
			return "review/insert";
		}
		String rev_id = (String) request.getSession().getAttribute("sid");
		reviewService.insertReview(reviewBean, rev_id, rs_idx);
		return "review/insert_success";
	}
	
	@GetMapping("/updateReview")
	public String getUpdateReview(@RequestParam int rev_idx,
			@RequestParam(defaultValue = "0") int page, 
			@RequestParam(defaultValue = "0") int revPage,
			@RequestParam(defaultValue = "0") int myPage,
			Model model) {
		ReviewBean reviewBean = reviewService.reviewByRevIdx(rev_idx);
		model.addAttribute("reviewBean", reviewBean);
		model.addAttribute("page", page);
		model.addAttribute("revPage", revPage);
		model.addAttribute("myPage", myPage);
		return "review/update";
	}

	@PostMapping("/updateReview")
	public String postUpdateReview(@Valid @ModelAttribute ReviewBean reviewBean, BindingResult result,
			@RequestParam(defaultValue = "0") int page, 
			@RequestParam(defaultValue = "0") int revPage,
			@RequestParam(defaultValue = "0") int myPage,
			Model model) {
		if (myPage != 0) {
			model.addAttribute("myPage", myPage);
		} else {
			model.addAttribute("page", page);
			model.addAttribute("revPage", revPage);
		}
		if (result.hasErrors()) {
			return "review/update";
		}
		reviewService.updateReview(reviewBean);
		if (myPage != 0) {
			model.addAttribute("rev_idx", reviewBean.getRev_idx());
			return "review/update_success2";
		} else {
			model.addAttribute("rs_idx", reviewBean.getRs_idx());
			model.addAttribute("rev_idx", reviewBean.getRev_idx());
			return "review/update_success";
		}
	}	
	
	@GetMapping("/deleteReview")
	public String deleteReview(@RequestParam int rev_idx,
			@RequestParam(defaultValue = "0") int rs_idx, 
			@RequestParam(defaultValue = "0") int page, 
			@RequestParam(defaultValue = "0") int revPage,
			@RequestParam(defaultValue = "0") int myPage, 
			Model model) {
		reviewService.deleteReview(rev_idx);
		if (myPage != 0) {
			model.addAttribute("myPage", myPage);
			
			return "review/delete_success2";
		} else {
			model.addAttribute("rs_idx", rs_idx);
			model.addAttribute("page", page);
			model.addAttribute("revPage", revPage);
			
			return "review/delete_success";
		}
	}

	@GetMapping("/invalidUser")
	public String invalidUser() {
		return "review/invalid_user";
	}

	@GetMapping("/pop")
	public String imgPop(@RequestParam String img, Model model) {
		model.addAttribute("img", img);
		return "review/pop";
	}
}