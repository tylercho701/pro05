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
import com.matjip.bean.QnaBean;
import com.matjip.bean.UserBean;
import com.matjip.service.QnaService;

@Controller
@RequestMapping("/qna")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	@Resource(name = "loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@GetMapping("/main")
	public String qnaList(@RequestParam(value="page", defaultValue = "1") int page,
											 Model model){
						
		// 게시글 리스트 가져오기
		List<QnaBean> qnaList = qnaService.getQnaList(page);
		
		// DB 로부터 받아온 게시글 리스트(ContentBean 객체들이 저장된 ArrayList 객체)를
		// requestScope 에 contentList 라는 이름으로 올림
		model.addAttribute("qnaList", qnaList);
		
		PageBean pageBean = qnaService.getQnaCnt(page);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("page", page);
	
		return "qna/main";
	}
	
	@GetMapping("/detail")
	public String qnaDetail(@ModelAttribute("replyQnaBean") QnaBean replyQnaBean,
							@RequestParam("qna_idx") int qna_idx,
							@RequestParam("page") int page,	Model model){
		
		model.addAttribute("qna_idx", qna_idx);
				
		// 게시글 리스트 가져오기
		List<QnaBean> qnaReplyList = qnaService.getQnaReplyList(page);
		
		// DB 로부터 받아온 게시글 리스트(ContentBean 객체들이 저장된 ArrayList 객체)를
		// requestScope 에 contentList 라는 이름으로 올림
		model.addAttribute("qnaReplyList", qnaReplyList);		
					
		// 상세페이지에 출력할 데이터 가져오기
		QnaBean qnaDetailBean = qnaService.getQnaDetail(qna_idx);
		model.addAttribute("qnaDetailBean", qnaDetailBean);
		
		// SessionScope 에 있는 정보를 loginUserBean 에 넣기
		// model.addAttribute("loginUserBean", loginUserBean);
		
		model.addAttribute("page", page);
		
		return "qna/detail";
	}
	
	@GetMapping("/write")
	public String qnaWrite(@ModelAttribute("writeQnaBean") QnaBean writeQnaBean,
						   @RequestParam("page") int page, Model model){
		
		model.addAttribute("page", page);
				
		return "qna/write";
	}
	
	// BindingResult는 검증 오류가 발생할 경우 오류 내용을 보관하는 스프링 프레임워크에서 제공하는 객체
	@PostMapping("/write_procedure")
	public String writeProcedure(@Valid @ModelAttribute("writeQnaBean") QnaBean writeQnaBean, 
								 BindingResult result, Model model,
								 @RequestParam("page") int page){
		
		model.addAttribute("page", page);
		if(result.hasErrors()){
			System.out.println("에러O");
			System.out.println(result.getAllErrors());
			
			return "qna/write";
		}
			
			qnaService.addQna(writeQnaBean);
			System.out.println("에러X");
			return "qna/write_success";
	}
	// 답변 달기
	@GetMapping("/qnaReply")
	public String qnaReply(@RequestParam("qna_idx") int qna_idx,
						   @ModelAttribute("replyQnaBean") QnaBean replyQnaBean,
						   @RequestParam("page") int page, Model model){
		
		model.addAttribute("page", page);
		
		QnaBean tmpreplyQnaBean = qnaService.getQnaDetail(qna_idx);				
		
		replyQnaBean.setLev((Integer)tmpreplyQnaBean.getLev()+1);
		replyQnaBean.setParno(tmpreplyQnaBean.getParno());
					
		System.out.println("답변달기 : "+replyQnaBean);				
		return "qna/qnaReply";
	}
	
	// BindingResult는 검증 오류가 발생할 경우 오류 내용을 보관하는 스프링 프레임워크에서 제공하는 객체
	@PostMapping("/qnaReply_procedure")
	public String replyProcedure(@Valid @ModelAttribute("replyQnaBean") QnaBean replyQnaBean, 
								 BindingResult result, Model model,
								 @RequestParam("page") int page,
								 @RequestParam("qna_idx") int qna_idx								
								 ){
			
		System.out.println("프로시져1 : "+replyQnaBean);
		model.addAttribute("replyQnaBean", replyQnaBean);
		
		System.out.println("프로시져2 : "+replyQnaBean);
		model.addAttribute("page", page);
		
		if(result.hasErrors()){
			System.out.println("에러O");
			System.out.println(result.getAllErrors());
			
			model.addAttribute("qna_idx", qna_idx);
			
			// 게시글 리스트 가져오기
			List<QnaBean> qnaReplyList = qnaService.getQnaReplyList(page);
			
			// DB 로부터 받아온 게시글 리스트(ContentBean 객체들이 저장된 ArrayList 객체)를
			// requestScope 에 contentList 라는 이름으로 올림
			model.addAttribute("qnaReplyList", qnaReplyList);		
						
			// 상세페이지에 출력할 데이터 가져오기
			QnaBean qnaDetailBean = qnaService.getQnaDetail(qna_idx);
			model.addAttribute("qnaDetailBean", qnaDetailBean);
			
			// SessionScope 에 있는 정보를 loginUserBean 에 넣기
			// model.addAttribute("loginUserBean", loginUserBean);
			
			model.addAttribute("page", page);
			
			return "qna/detail";
		}
			
			qnaService.addQnaReply(replyQnaBean);
			System.out.println("에러X");
			
			QnaBean questionBean = qnaService.getQnaDetail(qna_idx);
			qnaService.qnaReplyCntUp(questionBean);
						
			return "qna/qnaReply_success";
	}	
	
	@GetMapping("/modify")
	public String QnaModify(@RequestParam("qna_idx") int qna_idx,
	  						@RequestParam("page") int page,
	  						@ModelAttribute("modifyQnaBean") QnaBean modifyQnaBean,
	  						Model model){
			
		model.addAttribute("qna_idx", qna_idx);
		model.addAttribute("page", page);
		
		// 수정페이지에 출력할 데이터 가져오기
		// modifyNoticeBean = noticeService.getNotiDetail(noti_idx);
	  // model.addAttribute("modifyNoticeBean", modifyNoticeBean);
		
		QnaBean tmpQnaBean = qnaService.getQnaDetail(qna_idx);
		modifyQnaBean.setQna_title(tmpQnaBean.getQna_title());
		modifyQnaBean.setQna_content(tmpQnaBean.getQna_content());
		modifyQnaBean.setQna_id(tmpQnaBean.getQna_id());
		modifyQnaBean.setLev(tmpQnaBean.getLev());
		modifyQnaBean.setParno(tmpQnaBean.getParno());
		modifyQnaBean.setQna_resdate(tmpQnaBean.getQna_resdate());
		
		// SQL 문에 없고 RequestScope 에 공유 되있는 값 가져와야한다
		modifyQnaBean.setQna_idx(qna_idx);
								
		return "qna/modify";
	}  	  
	
	@PostMapping("/modify_procedure")
	public String modifyProcedure(@Valid @ModelAttribute("modifyNoticeBean") QnaBean modifyQnaBean,
								  BindingResult result,  Model model,
								  @RequestParam("page") int page,
								  @RequestParam("qna_idx") int qna_idx) {
		
		model.addAttribute("qna_idx", qna_idx);
		model.addAttribute("page", page);
		if(result.hasErrors()){
			System.out.println("에러O");
			System.out.println(result.getAllErrors());
			
			return "qna/modify";
		}
		qnaService.modifyQna(modifyQnaBean);
			System.out.println("에러X");		
			return "qna/modify_success";
	}
	
  //질문 삭제
	@GetMapping("/delete")
	public String qnaDelete(@RequestParam("qna_idx") int qna_idx,
			  								  @RequestParam("page") int page, Model model){
	
	// 게시글 리스트 가져오기
	List<QnaBean> qnaList = qnaService.getQnaList(page);	
		
	//DB 로부터 받아온 게시글 리스트(ContentBean 객체들이 저장된 ArrayList 객체)를
	// requestScope 에 contentList 라는 이름으로 올림
	model.addAttribute("qnaList", qnaList);
		
	
	
	// 상세페이지에 출력할 데이터 가져오기
			QnaBean qnaDetailBean = qnaService.getQnaDetail(qna_idx);
			model.addAttribute("qnaDetailBean", qnaDetailBean);			
								
			qnaService.deleteQna(qna_idx);	
			model.addAttribute("qna_idx", qna_idx);
			model.addAttribute("page", page);
		
		return "qna/delete";
	}	
		
	// 답변 삭제
	@GetMapping("/deleteReply")
	public String replyDelete(@RequestParam("qna_idx") int qna_idx,
			  								    @RequestParam("page") int page, Model model){
				
	// 상세페이지에 출력할(부모글=질문글) 데이터 가져오기
			QnaBean qnaDetailBean = qnaService.getQnaDetail(qna_idx);
			model.addAttribute("qnaDetailBean", qnaDetailBean);
							
			qnaService.qnaReplyCntDown(qnaDetailBean);			
			qnaService.deleteReply(qna_idx);	
			
			model.addAttribute("page", page);
		
		return "qna/deleteReply";
	}	
}
