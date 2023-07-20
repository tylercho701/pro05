package com.matjip.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.matjip.dto.ReviewDTO;
import com.matjip.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@GetMapping
	public String reviewMain() {
		return "review/main";
	}
	
	@GetMapping("/all")
	public String reviewAll(Model model) {
		List<ReviewDTO> reviewList = reviewService.reviewAll();
		model.addAttribute("reviewList", reviewList);
		return "review/template";
	}
	
	@GetMapping("/rs_idx/{rs_idx}")
	public String reviewByResId(@PathVariable int rs_idx, Model model) {
		List<ReviewDTO> reviewList = reviewService.reviewByResId(rs_idx);
		model.addAttribute("reviewList", reviewList);
		return "review/template";
	}
	
	@GetMapping("/region/{rs_region_cate}")
	public String reviewByReviewCnt(@PathVariable String rs_region_cate, Model model) {
		List<ReviewDTO> reviewList = reviewService.reviewByRegionCate(rs_region_cate);
		model.addAttribute("reviewList", reviewList);
		return "review/template";
	}
	
	@GetMapping("/insertReview")
	public String getInsertReview(Model model) {
		ReviewDTO reviewDTO = new ReviewDTO();
		model.addAttribute("reviewDTO", reviewDTO);	// 수정 완료시 @ModelAttribute 로 수정할 것
		return "review/insert";
	}
	
	@PostMapping("/insertReview")
	public String postInsertReview(@ModelAttribute ReviewDTO reviewDTO) {
		reviewDTO.setRs_idx("1");
		reviewDTO.setRev_id("user41");
		reviewDTO.setRev_file("wtf");
		reviewDTO.setRev_score(5);
		reviewService.insertReview(reviewDTO);
		return "redirect:review";
	}
	
	@GetMapping("/updateReview")
	public String updateReview() {
		return "";
	}
	
	@GetMapping("/deleteReview")
	public String deleteReview() {
		return "/review/delete";
	}
}