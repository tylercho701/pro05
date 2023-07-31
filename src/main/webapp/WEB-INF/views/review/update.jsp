<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

        <title>리뷰 수정</title>
                
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
	<c:import url="${root }/WEB-INF/views/include/top_menu.jsp" />
	
	<div class="container" style="margin-top:100px">
		<div class="row">
			<div class="col-sm-12">
				<div class="card shadow">
					<div class="card-body">
						<div class="form-group">
							<h3 class="text-center card-title"><strong>My Review Update</strong></h3>
							<form:form action="/review/updateReview" method="post" modelAttribute="reviewBean" enctype="multipart/form-data" >
								<form:hidden path="rev_idx" />
								<form:hidden path="rs_idx"/>
								
								<form:label path="rev_title">제목</form:label>
								<form:input type="text" path="rev_title" class="form-control"/>
								<form:errors path="rev_title" style="color:red;" /><br>
								
								<form:label path="rev_score">점수</form:label>
								<form:input type="number" path="rev_score" class="form-control"/>
								<form:errors path="rev_score" style="color:red;" /><br>
								
								<form:hidden path="rev_id"/>
								
								<!-- accept="image/*  :  이미지 파일 확장자는 전부 첨부 가능 -->
								<form:label path="upload_file">첨부 이미지</form:label>
								<%-- <c:if test="${!empty reviewBean.rev_file }">
									<div id="pic">
										<img src="${root }/resources/upload/${reviewBean.rev_file }" alt="${review.rev_file }" class="reviewPic">
									</div>
								</c:if> --%>
								<form:input type="file" path="upload_file" class="form-control" accept="image/*"/><br>
								<form:hidden path="rev_file" />
								
								<form:label path="rev_content">내용</form:label>
								<form:textarea path="rev_content" class="form-control"/>
								<form:errors path="rev_content" style="color:red;" /><br>
								
								<input type="hidden" id="page" name="page" value=${page }>
								<input type="hidden" id="revPage" name="revPage" value=${revPage }>
								<input type="hidden" id="myPage" name="myPage" value=${myPage }>
								
								<div class="form-group">
									<div class="text-right">
										<form:button type="submit" class="btn btn-light">업데이트</form:button>
										<form:button type="reset" class="btn btn-danger">초기화</form:button>
										<a href="javascript:history.go(-1)" class="btn btn-dark">뒤로가기</a>
									</div>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<c:import url="${root }/WEB-INF/views/include/bottom_menu.jsp" />
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="${root }/resources/js/scripts.js"></script>

</body>
</html>