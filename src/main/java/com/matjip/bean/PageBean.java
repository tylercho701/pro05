package com.matjip.bean;

import lombok.Getter;

@Getter
public class PageBean {
	
	// 최소 페이지 번호
	private int min;
	
	// 최대 페이지 번호
	private int max;
	
	// 이전 버튼의 페이지 번호
	private int prevP;
	
	// 다음 버튼의 페이지 번호
	private int nextP;
	
	// 전체 페이지 개수
	private int pageCnt;
	
	// 현재 페이지 개수
	private int currentP;
	
	// 생성자의 parameter
	// => 전체글 개수, 현재 글 번호, 페이지당 글 갯수, 페이지 버튼 개수
	//    contentCnt ,  currentP   ,   contentPageCnt,  paginationCnt
	// 출처   DB	 ,	parameter  ,				 ,	
	public PageBean(int contentCnt, int currentP, int contentPageCnt, int paginationCnt) {
		
		// 현재 페이지 번호
		this.currentP = currentP;
		
		// 전체 페이지 개수 = 전체 글 개수 / 페이지 당 글 개수
		this.pageCnt = contentCnt / contentPageCnt;
		
		// 10개 미만 글이 남을 경우 1페이지 더 만들어주기
		// 125/10 <-- 12...5 : 125 % 10 <-- (나머지)5 > 0
		if(contentCnt % contentPageCnt > 0) {
			this.pageCnt += 1 ;
		}
		
//				 최소, 최대(해당페이지의)
//		 0 ~  9 :  1,	10
//		10 ~ 19 : 11,	20
//		20 ~ 29 : 21,	30
//		페이지 버튼 개수(paginationCnt)
		
		this.min = ((currentP - 1) / paginationCnt) * paginationCnt +1;
		this.max = min + paginationCnt - 1 ;
		
//		전체 페이지 개수(pageCnt)
		
		if(max > pageCnt) {
			this.max = pageCnt;
		}
		
		this.prevP = min - 1;
		if(prevP < 1) {
			prevP = 1;
		}
		
		this.nextP = max + 1;
		if(nextP > pageCnt) {
			nextP = pageCnt;
		}
		
		// 현재 페이지 번호
		this.currentP = currentP;		
	} 
}
