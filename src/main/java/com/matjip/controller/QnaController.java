package com.matjip.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.matjip.bean.NoticeBean;
import com.matjip.bean.PageBean;
import com.matjip.bean.QnaBean;
import com.matjip.bean.UserBean;
import com.matjip.service.NoticeService;
import com.matjip.service.QnaService;

@Controller
@RequestMapping("/qna")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	@Resource(name = "loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@GetMapping("/qna")
	public String qna(@RequestParam(value="page", defaultValue = "1") int page,
											 Model model){
						
		// 게시글 리스트 가져오기
		List<QnaBean> qnaList = qnaService.getQnaList(page);
		
		// DB 로부터 받아온 게시글 리스트(ContentBean 객체들이 저장된 ArrayList 객체)를
		// requestScope 에 contentList 라는 이름으로 올림
		model.addAttribute("qnaList", qnaList);
		
		// System.out.println("notiList 1 :" + notiList);	
		PageBean pageBean = qnaService.getQnaCnt(page);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("page", page);
		
		// System.out.println("notiList 2 :" + notiList);	
		return "/qna/qna";
	}
	
	@GetMapping("/qna/read")
	public String qnaDetail(@RequestParam("qna_idx") String qna_idx,
							@RequestParam("page") int page,	Model model){
		
		model.addAttribute("qna_idx", qna_idx);
		
		// 상세페이지에 출력할 데이터 가져오기
		QnaBean readQnaBean = qnaService.getQnaDetail(qna_idx);
		model.addAttribute("readQnaBean", readQnaBean);
		
		// SessionScope 에 있는 정보를 loginUserBean 에 넣기
		model.addAttribute("loginUserBean", loginUserBean);
		model.addAttribute("page", page);
		
		return "qna/read";
	}
//	
//	@GetMapping("/write")
//	public String boardWrite(@ModelAttribute("writeContentBean") ContentBean writeContentBean,
//							 @RequestParam("board_info_idx") int board_info_idx,
//							 @RequestParam("page") int page, Model model){
//		
//		model.addAttribute("page", page);
//		writeContentBean.setContent_board_idx(board_info_idx);
//		
//		return "board/write";
//	}
//	
//	// BindingResult는 검증 오류가 발생할 경우 오류 내용을 보관하는 스프링 프레임워크에서 제공하는 객체
//	@PostMapping("/write_procedure")
//	public String writeProcedure(@Valid @ModelAttribute("writeContentBean") ContentBean writeContentBean, 
//								 BindingResult result, Model model,
//								 @RequestParam("page") int page){
//		
//		model.addAttribute("page", page);
//		if(result.hasErrors()){
//			System.out.println("에러O");
//			System.out.println(result.getAllErrors());
//			
//			return "board/write";
//		}
//			
//			boardService.addContentInfo(writeContentBean);
//			System.out.println("에러X");
//			return "board/write_success";
//	}
//	
//	@GetMapping("/not_writer")
//	public String notWriter() {
//		
//		return "board/not_writer";
//	}
//	
//	@GetMapping("/modify")
//	public String boardModify(@RequestParam("board_info_idx") int board_info_idx,
//							  @RequestParam("content_idx") int content_idx,
//							  @RequestParam("page") int page,
//							  @ModelAttribute("modifyContentBean") ContentBean modifyContentBean,
//							  Model model){
//		
//		model.addAttribute("board_info_idx", board_info_idx);
//		model.addAttribute("content_idx", content_idx);
//		model.addAttribute("page", page);
//		
//		// 수정페이지에 출력할 데이터 가져오기
////		modifyContentBean = boardService.getContentInfo(content_idx);
////	    model.addAttribute("modifyContentBean", modifyContentBean);
//		
//		ContentBean tmpContentBean = boardService.getContentInfo(content_idx);
//		modifyContentBean.setContent_writer_name(tmpContentBean.getContent_writer_name());
//		modifyContentBean.setContent_date(tmpContentBean.getContent_date());
//		modifyContentBean.setContent_subject(tmpContentBean.getContent_subject());
//		modifyContentBean.setContent_text(tmpContentBean.getContent_text());
//		modifyContentBean.setContent_file(tmpContentBean.getContent_file());
//		modifyContentBean.setContent_writer_idx(tmpContentBean.getContent_writer_idx());
//		
//		// SQL 문에 없고 RequestScope 에 공유 되있는 값 가져와야한다
//		modifyContentBean.setContent_board_idx(board_info_idx);
//		modifyContentBean.setContent_idx(content_idx);
//		
//				
//		return "board/modify";
//	}  	  
//	
//	@PostMapping("/modify_procedure")
//	public String modifyProcedure(@Valid @ModelAttribute("modifyContentBean") ContentBean modifyContentBean,
//								  BindingResult result,  Model model,
//								  @RequestParam("page") int page) {
//		
//		model.addAttribute("page", page);
//		if(result.hasErrors()){
//			System.out.println("에러O");
//			System.out.println(result.getAllErrors());
//			
//			return "board/modify";
//		}
//			boardService.modifyContentInfo(modifyContentBean);
//			System.out.println("에러X");		
//			return "board/modify_success";
//	}
//	
//	@GetMapping("/delete")
//	public String boardDelete(@RequestParam("board_info_idx") int board_info_idx,
//			  				  @RequestParam("content_idx") int content_idx,
//			  				  @RequestParam("page") int page,
//			  				  Model model){
//		
//		boardService.deleteContentInfo(content_idx);
//		model.addAttribute("board_info_idx", board_info_idx);
//		model.addAttribute("page", page);
//		
//		return "board/delete";
//	}	
}
