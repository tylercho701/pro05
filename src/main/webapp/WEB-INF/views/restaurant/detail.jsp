<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- localhost(127.0.0.1):portnumber/projectname => Context Path -->
<%-- <c:url var="root" value="/" /> 이것과 아래는 같다. --%>
<c:set var="root" value="${pageContext.request.contextPath }" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

        <title>맛집 리스트 상세</title>
                
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="./resources/assets/favicon.ico" />
        
        <!-- CSS (includes Bootstrap) -->
        <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>	  
		  	    
	    <!-- Custom styles for this template -->
	    <!--<link href="${pageContext.request.contextPath}/resources/css/product.css" rel="stylesheet">-->
    	<link href="${pageContext.request.contextPath}/resources/css/carousel.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/color-modes.js"></script>
	
	<!-- <style>
		.container-wrap {
			margin-top: 120px;
			position: relative;
			min-height: 100%;
		    padding-bottom: 250px;
			bottom:0px;
		}
		
		.shadow {
			width: 1000px;
			text-align: center;
			display: flex;
			margin: 0 auto;
		}
	</style> -->
</head>
<body>
	
	<!-- Header -->
	<c:import url="/WEB-INF/views/include/top_menu.jsp"></c:import>	
	
	<div class="container" style="margin-top:100px; height: auto;">
		<div class="row">
			<!-- <div class="col-sm-3"></div> -->
			<div class="col-sm-12">
				<div class="card shadow">
					<div class="card-body" style="text-align: left;">
						<div class="form-group">
						<h3 class="text-center card-title"><strong>맛집 리스트 상세보기</strong></h3>
							<label for="rs_idx">글 번호</label>
							<input type="text" id="rs_idx" name="rs_idx" class="form-control" value="${restDetailBean.rs_idx }" disabled="disabled"/>
						</div>
						<div class="form-group">
							<label for="rs_region_cate">지역분류</label>
							<input type="text" id="rs_region_cate" name="rs_region_cate" class="form-control" value="${restDetailBean.region_name }" disabled="disabled"/>
						</div>		
						<div class="form-group">
							<label for="rs_food_cate">음식분류</label>
							<input type="text" id="rs_food_cate" name="rs_food_cate" class="form-control" value="${restDetailBean.food_name }" disabled="disabled"/>
						</div>							
						<div class="form-group">					
							<label for="rs_name">이름</label>
							<input type="text" id="rs_name" name="rs_name" class="form-control" value="${restDetailBean.rs_name }" disabled="disabled"/>
						</div>
						<div class="form-group">
							<label for="rs_phone">전화번호</label>
							<input type="text" id="rs_phone" name="rs_phone" class="form-control" value="${restDetailBean.rs_phone }" disabled="disabled"/>
						</div>
						<div class="form-group">
							<label for="rs_addr">주소</label>
							<input type="text" id="rs_addr" name="rs_addr" class="form-control" value="${restDetailBean.rs_addr }" disabled="disabled"/>
						</div>				
						<div class="form-group">
							<label for="rs_content">글내용</label>
							<textarea id="rs_content" name="rs_content" class="form-control" rows="10" style="resize:none" disabled="disabled">${restDetailBean.rs_content }</textarea>
						</div>
						<c:if test="${restDetailBean.rs_file != null }">
							<div class="form-group">
								<label for="rs_file">첨부 이미지</label>
								<img src="${root}/resources/upload/${restDetailBean.rs_file }" width="100%"/>						
							</div>
						</c:if>
						<div class="form-group">
							<div class="text-right">
								<a href="${root}/restaurant/main?page=${page}" class="btn btn-secondary">목록보기</a>
								<c:if test="${sid == 'admin'}">
			                    	<a href="${root}/restaurant/modify?rs_idx=${rs_idx}&page=${page}" class="btn btn-warning">수정하기</a>
			                    	<a href="${root}/restaurant/delete?rs_idx=${rs_idx}&page=${page}" class="btn btn-danger">삭제하기</a>
			                    </c:if>
								<%-- <c:if test="${loginUserBean.user_id == noticeDetailBean.user_id }"></c:if> --%>
							</div>
						</div>					
					</div>
				</div>
			</div>
			<div class="col-sm-12" style="margin-top: 20px;">
				<div class="card shadow">
					<div class="card-body">
						<h3 style="margin-bottom: 30px;"><strong>${restDetailBean.rs_name } 의 후기</strong></h3>
						<table class="table table-hover" id='맛집리스트 상세 후기' style="width=100%">
						<thead>
							<tr class="exline" style="border-bottom: 2px solid #ddd;">
								<th class="text-center d-none d-md-table-cell">제목</th>
								<th class="text-center d-none d-md-table-cell">별점</th>
								<th class="text-center d-none d-md-table-cell">리뷰어</th>
								<th class="text-center d-none d-md-table-cell">작성일</th>
								<th class="text-center d-none d-md-table-cell"></th>
							<tr>
						</thead>
						<tbody>
							<c:forEach items="${reviewList }" var="review" varStatus="status">
							<tr>
								<th class="text-center d-none d-md-table-cell">
									<a href="${root }/review/detail?rev_idx=${review.rev_idx}&rs_idx=${review.rs_idx }&page=${page }&revPage=${revPage }">${review.rev_title }</a>
								</th><!-- 제목 -->
								<th>
									<!-- 별점 -->
									<h7>
										<c:forEach begin="1" end="${review.rev_score }" step="1">★</c:forEach>
									</h7>
								</th>
								<th class="text-center d-none d-md-table-cell">${review.rev_id }</th><!-- 리뷰어 -->
								<th class="text-center w-25 h6">${review.rev_regdate }</th><!-- 작성일 -->
								<th class="text-right">
								<!-- 수정 삭제 -->
								<c:if test="${review.rev_id.equals(sid) || sid.equals('admin') }">
									<a href="/review/updateReview?rev_idx=${review.rev_idx }&page=${page}&revPage=${revPageBean.currentP}" class="btn btn-outline-danger" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;">수정</a>
									<a href="/review/deleteReview?rev_idx=${review.rev_idx }&rs_idx=${review.rs_idx }&page=${page}&revPage=${revPageBean.currentP}" class="btn btn-outline-danger" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;">삭제</a>
								</c:if>
								</th>
							</tr>
							</c:forEach>
						</tbody>						
					</table>
					<!-- 리뷰 작성하기 -->
					<div class="text-right">
						<a href="/review/insertReview?rs_idx=${rs_idx }&page=${page}" class="btn btn-secondary">리뷰 작성하기</a>
					</div>
					</div>
					<div class="d-none d-md-block">
						<ul class="pagination justify-content-center">
						<c:choose>
							<c:when test="${revPageBean.currentP == 1 || revPageBean.pageCnt == 0 }">
								<li class="page-item disabled">
									<a href="#" class="page-link">이전</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a href="${root }/restaurant/detail?rs_idx=${rs_idx }&page=${page}&revPage=${revPageBean.prevP}" class="page-link">이전</a>
								</li>
							</c:otherwise>
						</c:choose>
						<c:forEach var="idx" begin="${revPageBean.min }" end="${revPageBean.max }">
						<c:choose>
							<c:when test="${idx == revPageBean.currentP }">
								<li class="page-item active">
									<a href="${root }/restaurant/detail?rs_idx=${rs_idx }&page=${page}&revPage=${idx}" class="page-link">${idx }</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a href="${root }/restaurant/detail?rs_idx=${rs_idx }&page=${page}&revPage=${idx}" class="page-link">${idx }</a>
								</li>
							</c:otherwise>
						</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${revPageBean.currentP == revPageBean.pageCnt || revPageBean.pageCnt == 0 }">
								<li class="page-item disabled">
									<a href="#" class="page-link">다음</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a href="${root }/restaurant/detail?rs_idx=${rs_idx }&page=${page}&revPage=${revPageBean.nextP}" class="page-link">다음</a>
								</li>
							</c:otherwise>
						</c:choose>
						</ul>
					</div>
				</div>
			</div>
		</div>
	<!-- <div class="col-sm-3"></div> -->
</div>
	<script>
		function imgPop(i){
			window.open("/review/pop?img="+i);
		}
	</script>
	<!-- Footer-->
	<c:import url="/WEB-INF/views/include/bottom_menu.jsp"></c:import>	
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="${root }/resources/js/scripts.js"></script>

</body>
</html>
