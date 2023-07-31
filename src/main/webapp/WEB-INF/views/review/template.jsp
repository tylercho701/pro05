<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="root" value="${pageContext.request.contextPath }" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

        <title>리뷰 상세</title>
                
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
	
</head>
<body>

	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	
	<div class="container" style="margin-top:100px">
		<div class="row">
			<div class="col-sm-12">
				<div class="card shadow">
					<div class="card-body">
						<div class="form-group">
						<h3 class="text-center card-title"><strong>내가 작성한 리뷰 상세보기</strong></h3>
							<label for="rs_name">가게명</label>
							<input type="text" id="rs_name" name="rs_name" class="form-control" value="${reviewBean.rs_name }" disabled="disabled"/>
						</div>
						<div class="form-group">
							<label for="region_name">지역</label>
							<input type="text" id="region_name" name="region_name" class="form-control" value="${reviewBean.region_name }" disabled="disabled"/>
						</div>	
						<div class="form-group">
							<label for="food_name">음식</label>
							<input type="text" id="food_name" name="food_name" class="form-control" value="${reviewBean.food_name }" disabled="disabled"/>
						</div>				
						<div class="form-group">					
							<label for="rev_title">리뷰 제목</label>
							<input type="text" id="rev_title" name="rev_title" class="form-control" value="${reviewBean.rev_title }" disabled="disabled"/>
						</div>
						<div class="form-group">
							<label for="rev_regdate">리뷰 작성일</label>
							<input type="text" id="rev_regdate" name="rev_regdate" class="form-control" value="${reviewBean.rev_regdate }" disabled="disabled"/>
						</div>
						<div class="form-group">
							<label for="rev_score">별점</label>
							<input type="text" id="rev_score" name="rev_score" class="form-control" value="${reviewBean.rev_score }" disabled="disabled"/>
						</div>				
						<div class="form-group">
							<label for="rev_content">리뷰 내용</label>
							<textarea id="rev_content" name="rev_content" class="form-control" rows="10" style="resize:none;" disabled="disabled">${reviewBean.rev_content }</textarea>
						</div>
						<c:if test="${reviewBean.rev_file != null }">
							<div class="form-group">
								<label for="rev_file">첨부 이미지</label>
								<img src="${root}/resources/upload/${reviewBean.rev_file }" width="100%" onclick="imgPop('${reviewBean.rev_file }')"/>						
							</div>
						</c:if>	
						<div class="form-group">
							<div class="text-right">
								<c:if test="${myPage != 0 }">
									<a href="${root}/review/main?myPage=${myPage }" class="btn btn-secondary">내 리뷰 목록 보기</a>
									<c:if test="${reviewBean.rev_id.equals(sid) || sid.equals('admin') }">
										<a href="${root}/review/updateReview?rev_idx=${reviewBean.rev_idx}&myPage=${myPage}" class="btn btn-warning">수정하기</a>
										<a href="${root}/review/deleteReview?rev_idx=${reviewBean.rev_idx}&myPage=${myPage}" class="btn btn-danger">삭제하기</a>
									</c:if>
								</c:if>
								<c:if test="${myPage == 0 }">
									<a href="${root }/restaurant/detail?rs_idx=${rs_idx }&page=${page }&revPage=${revPage }" class="btn btn-secondary">맛집 상세보기로 가기</a>
									<c:if test="${reviewBean.rev_id.equals(sid) || sid.equals('admin') }">
										<a href="${root }/review/updateReview?rev_idx=${reviewBean.rev_idx }&page=${page }&revPage=${revPage }" class="btn btn-warning">수정하기</a>
										<a href="${root }/review/deleteReview?rev_idx=${reviewBean.rev_idx }&rs_idx=${reviewBean.rs_idx }&page=${page}&revPage=${revPage }" class="btn btn-danger">삭제하기</a>
									</c:if>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function imgPop(i){
			window.open("/review/pop?img="+i);
		}
	</script>

	<c:import url="/WEB-INF/views/include/bottom_menu.jsp" />
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="${root }/resources/js/scripts.js"></script>

</body>
</html>