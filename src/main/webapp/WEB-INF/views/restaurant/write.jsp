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

        <title>맛집 리스트 등록</title>
                
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
	
	<!-- 맛집 리스트 글쓰기 -->
	<div class="container" style="margin-top:100px">
		<div class="row">
			<div class="col-sm-12">
				<div class="card shadow">
					<div class="card-body">
					<h3 class="text-center card-title"><strong>Jeju Matjip List</strong></h3>
						<form:form action="/restaurant/write_procedure?page=${page}" method="post" modelAttribute="writeRestBean" enctype="multipart/form-data">
						<form:hidden path="rs_idx"/>
						<div class="form-group">
							<form:label path="rs_name">이름</form:label>
							<form:input path="rs_name" class="form-control" />
							<form:errors path="rs_name" style="color:red;" /><br>
						</div>
						<div class="form-group">
							<form:label path="rs_content">내용</form:label>
							<form:textarea path="rs_content" class="form-control" rows="10" style="resize:none" />
							<form:errors path="rs_content" style="color:red;" /><br>
						</div>
						<div class="form-group">
							<form:label path="rs_phone">전화번호</form:label>
							<form:input path="rs_phone" class="form-control" />
						</div>
						<div class="form-group">
							<form:label path="rs_addr">주소</form:label>
							<form:input path="rs_addr" class="form-control" />
						</div>
						<div class="form-group">
							<form:label path="upload_file">첨부 이미지</form:label>
							<form:input type="file" path="upload_file" class="form-control" accept="upload/*"/>
						</div>
						<div class="form-group">
						<label for="rs_region_cate"> 지역분류 </label>
							  <select id="rs_region_cate" name="rs_region_cate">
							   <option value="">-- 선택하세요 --</option>
							   <optgroup label="지역분류">
							   <option value="01">서귀포</option>
							  <option value="02">제주도</option>
						</optgroup>
						</select><br>
							  <label for="rs_food_cate"> 음식분류 </label>
							  <select id="rs_food_cate" name="rs_food_cate">
							   <option value="">-- 선택하세요 --</option>
							   <optgroup label="음식분류">
							   <option value="01">음식</option>
							  <option value="02">카페</option>
						</optgroup>
						</select>
							<div class="text-right">
								<form:button class="btn btn-secondary">작성하기</form:button>
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