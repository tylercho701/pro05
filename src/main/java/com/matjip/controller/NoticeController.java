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

import com.matjip.bean.NoticeBean;
import com.matjip.bean.PageBean;
import com.matjip.bean.UserBean;

import com.matjip.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/main")
	public String notice(@RequestParam(value="page", defaultValue = "1") int page,
						 Model model){
						
		// 게시글 리스트 가져오기
		List<NoticeBean> notiList = noticeService.getNotiList(page);
		
		// DB 로부터 받아온 게시글 리스트(ContentBean 객체들이 저장된 ArrayList 객체)를
		// requestScope 에 contentList 라는 이름으로 올림
		model.addAttribute("notiList", notiList);				
		
		PageBean pageBean = noticeService.getNotiCnt(page);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("page", page);
		
		return "notice/main";
	}
	
	@GetMapping("/detail")
	public String noticeDetail(@RequestParam("noti_idx") int noti_idx,
							   @RequestParam("page") int page,	Model model){
		
		model.addAttribute("noti_idx", noti_idx);
		
		// 상세페이지에 출력할 데이터 가져오기
		NoticeBean noticeDetailBean = noticeService.getNotiDetail(noti_idx);
		model.addAttribute("noticeDetailBean", noticeDetailBean);

		model.addAttribute("page", page);
		
		return "notice/detail";
	}
	
	@GetMapping("/write")
	public String noticeWrite(@ModelAttribute("writeNoticeBean") NoticeBean writeNoticeBean,
							  @RequestParam("page") int page, Model model){
				
		model.addAttribute("page", page);
				
		return "notice/write";
	}
	
	// BindingResult는 검증 오류가 발생할 경우 오류 내용을 보관하는 스프링 프레임워크에서 제공하는 객체
	@PostMapping("/write_procedure")
	public String writeProcedure(@Valid @ModelAttribute("writeNoticeBean") NoticeBean writeNoticeBean, 
								 BindingResult result, Model model, 
								 @RequestParam("page") int page){
	
		System.out.println("컨트롤러 : "+writeNoticeBean.getNoti_author());

		model.addAttribute("page", page);
		if(result.hasErrors()){
			System.out.println("에러O");
			System.out.println(result.getAllErrors());
			
			return "notice/write";
		}
			
			noticeService.addNoti(writeNoticeBean);
			System.out.println("에러X");
			return "notice/write_success";
	}
	
	@GetMapping("/modify")
	public String NoticeModify(@RequestParam("noti_idx") int noti_idx,
	  						   @RequestParam("page") int page,
	  						   @ModelAttribute("modifyNoticeBean") NoticeBean modifyNoticeBean,
	  						   Model model){
			
		model.addAttribute("notice_idx", noti_idx);
		model.addAttribute("page", page);
		
		// 수정페이지에 출력할 데이터 가져오기
		// modifyNoticeBean = noticeService.getNotiDetail(noti_idx);
	  // model.addAttribute("modifyNoticeBean", modifyNoticeBean);
		
		NoticeBean tmpNoticeBean = noticeService.getNotiDetail(noti_idx);
		modifyNoticeBean.setNoti_title(tmpNoticeBean.getNoti_title());
		modifyNoticeBean.setNoti_author(tmpNoticeBean.getNoti_author());
		modifyNoticeBean.setNoti_content(tmpNoticeBean.getNoti_content());
		modifyNoticeBean.setNoti_file(tmpNoticeBean.getNoti_file());
		modifyNoticeBean.setNoti_regdate(tmpNoticeBean.getNoti_regdate());
		
		// SQL 문에 없고 RequestScope 에 공유 되있는 값 가져와야한다
		modifyNoticeBean.setNoti_idx(noti_idx);
						
		return "notice/modify";
	}  	  
	
	@PostMapping("/modify_procedure")
	public String modifyProcedure(@Valid @ModelAttribute("modifyNoticeBean") NoticeBean modifyNoticeBean,
								  BindingResult result,  Model model,
								  @RequestParam("page") int page,
								  @RequestParam("noti_idx") int noti_idx) {
		
		model.addAttribute("noti_idx", noti_idx);
		model.addAttribute("page", page);
		if(result.hasErrors()){
			System.out.println("에러O");
			System.out.println(result.getAllErrors());
			
			return "notice/modify";
		}
			noticeService.modifyNoti(modifyNoticeBean);
			System.out.println("에러X");		
			return "notice/modify_success";
	}
	
	@GetMapping("/delete")
	public String noticeDelete(@RequestParam("noti_idx") int noti_idx,
			  				  				 @RequestParam("page") int page, Model model){
				
		noticeService.deleteNoti(noti_idx);	
		model.addAttribute("page", page);
		
		return "notice/delete";
	}	
}
