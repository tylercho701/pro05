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

        <title>맛집 리스트</title>
                
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
	
	<!-- 게시글 리스트 -->
	<div class="container" style="margin-top:100px; height: auto;">
		<div class="row">
			<div class="col-sm-12">
				<div class="card shadow">
					<div class="card-body">
						<h3 class="card-title"><strong>맛집 리스트 보기</strong></h3>
						
						<label for="rs_region_cate"> 지역분류 </label>
						<select id="rs_region_cate" name="rs_region_cate" >
						 <option value="" >-- 선택하세요 --</option>
				     	<optgroup label="지역분류">
						  	<option value="01">서귀포</option>
						    <option value="02">제주</option>
						  </optgroup>
						</select>&nbsp;&nbsp;
						<label for="rs_food_cate"> 음식분류 </label>
			    	<select id="rs_food_cate" name="rs_food_cate" >
			      	<option value="">-- 선택하세요 --</option>
			        <optgroup label="음식분류">
					    	<option value="01">식사</option>
					      <option value="02">카페</option>
			        </optgroup>
						</select>
						<button onclick="button_find()">조회</button>
						<div class="text-right"></div>			
						
						<table class="table table-hover" id='restList'>
							<thead>
								<tr>
									<th class="text-center d-none d-md-table-cell">글번호</th>
									<th class="text-center w-50">제목</th>					
									<th class="text-center d-none d-md-table-cell">지역분류</th>
									<th class="text-center d-none d-md-table-cell">음식분류</th>
								</tr>
							</thead>
							<tbody>												
								<c:forEach var="restBean" items="${restList }">						
									<tr>
										<td class="text-center d-none d-md-table-cell">${restBean.rs_idx }</td>							
										<td><a href="${root}/restaurant/detail?rs_idx=${restBean.rs_idx}&page=${page}">${restBean.rs_name }</a></td>		
										<td class="text-center d-none d-md-table-cell">${restBean.region_name }</td>
										<td class="text-center d-none d-md-table-cell">${restBean.food_name }</td>					
									</tr>
								</c:forEach>												
							</tbody>
						</table>			
						<div class="d-none d-md-block">
							<ul class="pagination justify-content-center">					
								<c:choose>
									<c:when test="${pageBean.prevP <= 0}" >
										<li class="page-item disabled" id="noPage">								
											<a href="#" class="page-link">이전</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item">
											<c:choose>												
												<c:when test="${!empty rs_region_cate && empty rs_food_cate }">
													<a href="${root}/restaurant/restaurantRegion?page=${pageBean.prevP}&rs_region_cate=${rs_region_cate}" class="page-link">${idx }</a>
												</c:when>
												<c:when test="${empty rs_region_cate && !empty rs_food_cate}">
													<a href="${root}/restaurant/restaurantFood?page=${pageBean.prevP}&rs_food_cate=${rs_food_cate}" class="page-link">${idx }</a>
												</c:when>
												<c:when test="${!empty rs_region_cate && !empty rs_food_cate}">
													<a href="${root}/restaurant/restaurantCate?page=${pageBean.prevP}&rs_region_cate=${rs_region_cate}&rs_food_cate=${rs_food_cate}" class="page-link">${idx }</a>
											 	</c:when>
											 	<c:otherwise>
													<a href="${root}/restaurant/main?page=${pageBean.prevP}" class="page-link">이전</a>
												</c:otherwise>
											</c:choose>								
										</li>						
									</c:otherwise>
								</c:choose>
							
								<c:forEach var="idx" begin ="${pageBean.min }" end = "${pageBean.max }" >					
									<c:choose>
										<c:when test="${idx == pageBean.currentP}">
											<li class="page-item active">	
												<c:choose>												
													<c:when test="${!empty rs_region_cate && empty rs_food_cate }">
														<a href="${root}/restaurant/restaurantRegion?page=${idx}&rs_region_cate=${rs_region_cate}" class="page-link">${idx }</a>
													</c:when>
													<c:when test="${empty rs_region_cate && !empty rs_food_cate}">
														<a href="${root}/restaurant/restaurantFood?page=${idx}&rs_food_cate=${rs_food_cate}" class="page-link">${idx }</a>
													</c:when>
													<c:when test="${!empty rs_region_cate && !empty rs_food_cate}">
														<a href="${root}/restaurant/restaurantCate?page=${idx}&rs_region_cate=${rs_region_cate}&rs_food_cate=${rs_food_cate}" class="page-link">${idx }</a>
												 	</c:when>
												 	<c:otherwise>
														<a href="${root}/restaurant/main?page=${idx}" class="page-link">${idx }</a>
													</c:otherwise>
												</c:choose>
											</li>
										</c:when>
										<c:otherwise>
											<li class="page-item">
												<c:choose>
													<c:when test="${!empty rs_region_cate && empty rs_food_cate}">
														<a href="${root}/restaurant/restaurantRegion?page=${idx}&rs_region_cate=${rs_region_cate}" class="page-link">${idx }</a>
													</c:when>
													<c:when test="${empty rs_region_cate && !empty rs_food_cate}">
														<a href="${root}/restaurant/restaurantFood?page=${idx}&rs_food_cate=${rs_food_cate}" class="page-link">${idx }</a>
													</c:when>
													<c:when test="${!empty rs_region_cate && !empty rs_food_cate}">
														<a href="${root}/restaurant/restaurantCate?page=${idx}&rs_region_cate=${rs_region_cate}&rs_food_cate=${rs_food_cate}" class="page-link">${idx }</a>
												 	</c:when>
												 	<c:otherwise>
														<a href="${root}/restaurant/main?page=${idx}" class="page-link">${idx }</a>
													</c:otherwise>
												</c:choose>
											</li>
										</c:otherwise>
									</c:choose>			
								</c:forEach>
											
								<c:choose>
									<c:when test="${pageBean.max >= pageBean.pageCnt}">
										<li class="page-item disabled" id="noPage">
											<a href="#" class="page-link">다음</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item">
											<c:choose>												
												<c:when test="${!empty rs_region_cate && empty rs_food_cate }">
													<a href="${root}/restaurant/restaurantRegion?page=${pageBean.nextP}&rs_region_cate=${rs_region_cate}" class="page-link">${idx }</a>
												</c:when>
												<c:when test="${empty rs_region_cate && !empty rs_food_cate}">
													<a href="${root}/restaurant/restaurantFood?page=${pageBean.nextP}&rs_food_cate=${rs_food_cate}" class="page-link">${idx }</a>
												</c:when>
												<c:when test="${!empty rs_region_cate && !empty rs_food_cate}">
													<a href="${root}/restaurant/restaurantCate?page=${pageBean.nextP}&rs_region_cate=${rs_region_cate}&rs_food_cate=${rs_food_cate}" class="page-link">${idx }</a>
											 	</c:when>
											 	<c:otherwise>
													<a href="${root}/restaurant/main?page=${pageBean.nextP}" class="page-link">다음</a>
												</c:otherwise>
											</c:choose>							
										</li>
									</c:otherwise>
								</c:choose>						
							</ul>
						</div>			
						<div class="text-right">
							<c:if test="${sid.equals('admin')}">
			               	<a href="${root}/restaurant/write?&page=${page}" class="btn btn-primary">글쓰기</a>
			            </c:if>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	function button_find(){
	   console.log(rs_region_cate.value);
	   console.log(rs_food_cate.value);   
	   
	   if(rs_region_cate.value=="" && rs_food_cate.value!=""){
		
		   location.href = "${root}/restaurant/restaurantFood?&page=1&rs_food_cate="+rs_food_cate.value;	 
	   }else if(rs_region_cate.value!="" && rs_food_cate.value==""){
		   location.href = "${root}/restaurant/restaurantRegion?&page=1&rs_region_cate="+rs_region_cate.value;	 
	   }else if(rs_region_cate.value!="" && rs_food_cate.value!=""){
		   location.href = "${root}/restaurant/restaurantCate?&page=1&rs_region_cate="+rs_region_cate.value+"&rs_food_cate="+rs_food_cate.value;	 
	   }	
	}
	</script>
	
	<!-- Footer-->
	<c:import url="/WEB-INF/views/include/bottom_menu.jsp"></c:import>	
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>

</body>
</html>
