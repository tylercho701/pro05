<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

        <title>맛집 리스트 상세수정</title>
                
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
	
	<!-- Header -->
	<c:import url="/WEB-INF/views/include/top_menu.jsp"></c:import>	
	<!-- restaurant/modify -->
	<div class="container" style="margin-top:100px">
		<div class="row">
			<div class="col-sm-12">
				<div class="card shadow">
					<div class="card-body">
						<form:form action="/restaurant/modify_procedure" method="post" modelAttribute="modifyRestBean" enctype="multipart/form-data">
							<form:hidden path="rs_idx" />
							<input type="hidden" name="page" value="${page }"/>
							<div class="form-group">
							<h3 class="text-center card-title"><strong>맛집 리스트 상세수정</strong></h3>
								<form:label path="rs_name">이름</form:label>
								<form:input path="rs_name" class="form-control"/>
								<form:errors path="rs_name" style="color:red;" /><br>
							</div>
							<div class="form-group">
								<form:label path="rs_region_cate">지역분류</form:label>
								<form:select path="rs_region_cate">
								<form:options items="${requestScope.regionList }" itemLabel="region_name" itemValue="region_cate"/>
								<%-- <c:if test="${requestScope.regionList.region_cate eq modifyRestBean.rs_region_cate }">
									
								</c:if> --%>
								</form:select>
								<%-- <form:input path="rs_region_cate" class="form-control"/> --%>
								<input type="hidden" name="rs_idx" value="${modifyRestBean.rs_idx}">
							</div>
							<div class="form-group">
								<form:label path="rs_food_cate">음식분류</form:label>
								<form:select path="rs_food_cate">
									<form:options items="${requestScope.foodList }" itemLabel="food_name" itemValue="food_cate"/>
								</form:select>
								<%-- <form:input path="rs_food_cate" class="form-control" readonly="true"/> --%>
							</div>
							<div class="form-group">
								<form:label path="rs_phone">전화번호</form:label>
								<form:input path="rs_phone" class="form-control"/>
							</div>
							<div class="form-group">
								<form:label path="rs_addr">주소</form:label>
								<form:input path="rs_addr" class="form-control"/>
							</div>
							<div class="form-group">
								<form:label path="rs_content">내용</form:label>
								<form:textarea path="rs_content" class="form-control" rows="10" style="resize:none"/>
								<form:errors path="rs_content" style="color:red;" /><br>
							</div>
							<div class="form-group">
								<form:label path="rs_file">첨부 이미지</form:label>
								<c:if test="${modifyRestBean.rs_file !=null }">
									<img src="${root }/resources/upload/${modifyRestBean.rs_file}" width="100%"/>	
									<form:hidden path="rs_file"/>
								</c:if>
								<form:input type="file" path="upload_file" class="form-control" accept="upload/*"/>					
							</div>
							<div class="form-group">
								<div class="text-right">
									<form:button class="btn btn-warning">수정완료</form:button>
									<a href="${root }restaurant/detail?rs_idx=${rs_idx }&page=${page } " class="btn btn-danger">취소</a>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Footer-->
	<c:import url="/WEB-INF/views/include/bottom_menu.jsp"></c:import>	
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="${root }/resources/js/scripts.js"></script>

</body>
</html>