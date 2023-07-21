package com.matjip.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.matjip.bean.PageBean;
import com.matjip.bean.RestBean;
import com.matjip.bean.UserBean;
import com.matjip.service.RestService;

@Controller
@RequestMapping("/restaurant")
public class RestController {
	
	@Autowired
	private RestService restService;
	
	@Resource(name = "loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@GetMapping("/main")
	public String restaurant(@RequestParam(value="page", defaultValue = "1") int page,
											 Model model){
		//게시글 리스트 가져오기
		List<RestBean> restList = restService.getRestList(page);
		
		// DB 로부터 받아온 게시글 리스트(RestBean 객체들이 저장된 ArrayList 객체)를
		// requestScope 에 restList 라는 이름으로 올림
		model.addAttribute("restList", restList);
		
		// System.out.println("notiList 1 :" + notiList);	
			PageBean pageBean = restService.getRestCnt(page);
			model.addAttribute("pageBean", pageBean);
			model.addAttribute("page", page);
		
		//System.out.println("restList 컨트롤 :" + restList);
		return "restaurant/main";
	}
	
	@GetMapping("/detail")
	public String restDetail(@RequestParam("rs_idx") int rs_idx,
																 @RequestParam("page") int page, Model model){
		
		model.addAttribute("rs_idx", rs_idx);
		
		// 상세페이지에 출력할 데이터 가져오기
		RestBean restDetailBean = restService.getRestDetail(rs_idx);
		model.addAttribute("restDetailBean", restDetailBean);
		
		// SessionScope 에 있는 정보를 loginUserBean 에 넣기
		model.addAttribute("loginUserBean", loginUserBean);
		model.addAttribute("page", page);
		
		return "restaurant/detail";
	}
	
	@GetMapping("/write")
	public String restWrite(@ModelAttribute("writeRestBean") RestBean writeRestBean,
						 							 @RequestParam("page") int page, Model model){
	
	model.addAttribute("page", page);
	
		return "restaurant/write";
}

	//BindingResult는 검증 오류가 발생할 경우 오류 내용을 보관하는 스프링 프레임워크에서 제공하는 객체
@PostMapping("/write_procedure")
public String writeProcedure(@Valid @ModelAttribute("writeRestBean") RestBean writeRestBean, 
							 BindingResult result, Model model,
							 @RequestParam("page") int page){
	
	model.addAttribute("page", page);
	if(result.hasErrors()){
		System.out.println("에러O");
		System.out.println(result.getAllErrors());
		
		return "restaurant/write";
	}
		
		restService.addRestInfo(writeRestBean);
		System.out.println("에러X");	
		return "restaurant/write_success";
}

	@GetMapping("/modify")
  public String restModify(@RequestParam("rs_idx") int rs_idx,
  					  @RequestParam("page") int page,
  					  @ModelAttribute("modifyRestBean") RestBean modifyRestBean,
  					  Model model){
  
  model.addAttribute("rs_idx", rs_idx);
  model.addAttribute("page", page);
  
  // 수정페이지에 출력할 데이터 가져오기
  modifyRestBean = restService.getRestDetail(rs_idx);
  model.addAttribute("modifyRestBean", modifyRestBean);
  
  modifyRestBean = restService.getRestDetail(rs_idx);
  
  
  return "restaurant/modify";
  }  	  
  
  @PostMapping("/modify_procedure")
  public String modifyProcedure(@Valid @ModelAttribute("modifyRestBean") RestBean modifyRestBean,
  						  BindingResult result,  Model model,
  						  @RequestParam("page") int page) {
  
  model.addAttribute("page", page);
  if(result.hasErrors()){
  	System.out.println("에러O");
  	System.out.println(result.getAllErrors());
  	
  	return "restaurant/modify";
  }
  	restService.modifyRestInfo(modifyRestBean);
  	System.out.println("에러X");		
  	return "restaurant/modify_success";
  }
	
	@GetMapping("/delete")
  public String restDelete(@RequestParam("rs_idx") int rs_idx,
		  				  @RequestParam("page") int page,
		  				  Model model){
	
	restService.deleteRestInfo(rs_idx);
	model.addAttribute("page", page);
	
	return "restaurant/delete";
}	
	
}
