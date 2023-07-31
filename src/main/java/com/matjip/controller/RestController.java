package com.matjip.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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

import com.matjip.bean.FoodBean;
import com.matjip.bean.PageBean;
import com.matjip.bean.RegionBean;
import com.matjip.bean.RestBean;
import com.matjip.bean.ReviewBean;
import com.matjip.bean.UserBean;
import com.matjip.service.RestService;
import com.matjip.service.ReviewService;

@Controller
@RequestMapping("/restaurant")
public class RestController {

	@Autowired
	private RestService restService;

	@Autowired
	private ReviewService reviewService;

	@Resource(name = "loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@Resource(name = "regionBean")
	@Lazy
	private RegionBean regionBean;
	
	@Resource(name = "foodBean")
	@Lazy
	private FoodBean foodBean;

	@GetMapping("/main")
	public String restaurant(@RequestParam(value = "page", defaultValue = "1") int page,													
							 Model model) {
		// 게시글 리스트 전체 가져오기
		List<RestBean> restList = restService.getRestList(page);

		// DB 로부터 받아온 게시글 리스트(RestBean 객체들이 저장된 ArrayList 객체)를
		// requestScope 에 restList 라는 이름으로 올림
		model.addAttribute("restList", restList);

		// System.out.println("notiList 1 :" + notiList);
		PageBean pageBean = restService.getRestCnt(page);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("page", page);
	
		// System.out.println("restList 컨트롤 :" + restList);
		return "restaurant/main";
	}
	
	@GetMapping("/restaurantRegion")
	public String getRestListRegion(@RequestParam(value = "page", defaultValue = "1") int page,													
								   @RequestParam("rs_region_cate") String rs_region_cate,								   
								   Model model) {		
		
		
		// 게시글 리스트 (지역별) 가져오기
		List<RestBean> restList = restService.getRestListRegion(page, rs_region_cate);
			
		// DB 로부터 받아온 게시글 리스트(RestBean 객체들이 저장된 ArrayList 객체)를
		// requestScope 에 restList 라는 이름으로 올림
		model.addAttribute("restList", restList);

		// System.out.println("restList :" + restList);
		PageBean pageBean = restService.getRestRegionCnt(page, rs_region_cate);
	
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("page", page);
		model.addAttribute("rs_region_cate", rs_region_cate);

		return "restaurant/main";		
	}
	
	@GetMapping("/restaurantFood")
	public String getRestListFood(@RequestParam(value = "page", defaultValue = "1") int page,								
								 @RequestParam("rs_food_cate") String rs_food_cate,
								 Model model) {		
		
		// 게시글 리스트 (음식별)가져오기
		List<RestBean> restList = restService.getRestListFood(page, rs_food_cate);

		// DB 로부터 받아온 게시글 리스트(RestBean 객체들이 저장된 ArrayList 객체)를
		// requestScope 에 restList 라는 이름으로 올림
		model.addAttribute("restList", restList);

		// System.out.println("restList :" + restList);
		PageBean pageBean = restService.getRestFoodCnt(page, rs_food_cate);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("page", page);
		model.addAttribute("rs_food_cate", rs_food_cate);
			
		return "restaurant/main";		
	}
	
	@GetMapping("/restaurantCate")
	public String getRestListCate(@RequestParam(value = "page", defaultValue = "1") int page,													
								 @RequestParam("rs_region_cate") String rs_region_cate,
								 @RequestParam("rs_food_cate") String rs_food_cate,
								 Model model) {		
		
		// HashMap에 넣기
		HashMap<String, String> cateMap = new HashMap<String, String>();

		cateMap.put("rs_region_cate", rs_region_cate);
		cateMap.put("rs_food_cate", rs_food_cate);				
						
		// 게시글 리스트 (지역.음식별) 가져오기
		List<RestBean> restList = restService.getRestListCate(page, cateMap);

		// DB 로부터 받아온 게시글 리스트(RestBean 객체들이 저장된 ArrayList 객체)를
		// requestScope 에 restList 라는 이름으로 올림
		model.addAttribute("restList", restList);
		model.addAttribute("rs_region_cate", rs_region_cate);
		model.addAttribute("rs_food_cate", rs_food_cate);				
	
		PageBean pageBean = restService.getRestCateCnt(page, cateMap);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("page", page);		
		
		System.out.println("카테 pageBean.getPageCnt() : " + pageBean.getPageCnt());	
		
		return "restaurant/main";	
	}
					
	@GetMapping("/detail")
	public String restDetail(@RequestParam("rs_idx") int rs_idx,
							 @RequestParam(value="page", defaultValue="1") int page, 
							 @RequestParam(value="revPage", defaultValue="1") int revPage,							 
							 HttpServletRequest request, Model model) {
		
		model.addAttribute("rs_idx", rs_idx);

		// 상세페이지에 출력할 데이터 가져오기
		RestBean restDetailBean = restService.getRestDetail(rs_idx);
		restDetailBean.setRegion_name(reviewService.regCodeName(rs_idx));
		restDetailBean.setFood_name(reviewService.foodCodeName(rs_idx));
		model.addAttribute("restDetailBean", restDetailBean);

		// SessionScope 에 있는 정보를 넣기
		
		model.addAttribute("page", page);

		// 리뷰
		HttpSession session = request.getSession();
		String sid = (String) session.getAttribute("sid");
		model.addAttribute("sid", sid);
		
		List<ReviewBean> reviewList = reviewService.reviewByResId(rs_idx, revPage);
		model.addAttribute("reviewList", reviewList);
		
		PageBean revPageBean = reviewService.getReviewCntByResId(rs_idx, revPage);
		model.addAttribute("revPageBean", revPageBean);
		
		model.addAttribute("revPage", revPage);

		return "restaurant/detail";
	}

	@GetMapping("/write")
	public String restWrite(@ModelAttribute("writeRestBean") RestBean writeRestBean,
							@RequestParam("page") int page, Model model) {

		model.addAttribute("page", page);

		return "restaurant/write";
	}

	// BindingResult는 검증 오류가 발생할 경우 오류 내용을 보관하는 스프링 프레임워크에서 제공하는 객체
	@PostMapping("/write_procedure")
	public String writeProcedure(@Valid @ModelAttribute("writeRestBean") RestBean writeRestBean, 
								 BindingResult result, Model model, @RequestParam("page") int page) {

		model.addAttribute("page", page);
		if (result.hasErrors()) {
			System.out.println("에러O");
			System.out.println(result.getAllErrors());

			return "restaurant/write";
		}

		restService.addRestInfo(writeRestBean);
		System.out.println("에러X");
		return "restaurant/write_success";
	}

	@GetMapping("/modify")
	public String restModify(@RequestParam("rs_idx") int rs_idx, @RequestParam("page") int page,
							 @ModelAttribute("modifyRestBean") RestBean modifyRestBean, Model model) {

		model.addAttribute("rs_idx", rs_idx);
		model.addAttribute("page", page);

		// 수정페이지에 출력할 데이터 가져오기
		modifyRestBean = restService.getRestDetail(rs_idx);
		model.addAttribute("modifyRestBean", modifyRestBean);

		List<FoodBean> foodList = restService.getFoodTable();
		System.out.println(foodList);
		model.addAttribute("foodList", foodList);
		List<RegionBean> regionList = restService.getRegionTable();
		System.out.println(regionList);
		model.addAttribute("regionList", regionList);

		return "restaurant/modify";
	}

	@PostMapping("/modify_procedure")
	public String modifyProcedure(@Valid @ModelAttribute("modifyRestBean") RestBean modifyRestBean,
								  @RequestParam("rs_idx") int rs_idx,
								  BindingResult result,	Model model, @RequestParam("page") int page) {

		model.addAttribute("page", page);
		if (result.hasErrors()) {
			System.out.println("에러O");
			System.out.println(result.getAllErrors());
			
			List<FoodBean> foodList = restService.getFoodTable();
			System.out.println(foodList);
			model.addAttribute("foodList", foodList);
			List<RegionBean> regionList = restService.getRegionTable();
			System.out.println(regionList);
			model.addAttribute("regionList", regionList);

			return "restaurant/modify";
		}
		restService.modifyRestInfo(modifyRestBean);
		System.out.println("에러X");
		return "restaurant/modify_success";
	}

	@GetMapping("/delete")
	public String restDelete(@RequestParam("rs_idx") int rs_idx, @RequestParam("page") int page, Model model) {

		restService.deleteRestInfo(rs_idx);
		model.addAttribute("page", page);

		return "restaurant/delete";
	}
}
