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
<title>맛집리스트보기</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<style>
#noPage {display:none;}
</style>
</head>
<body>

<%-- <c:import url="/WEB-INF/views/include/top_menu.jsp" /> --%>

<!-- 게시글 리스트 -->
<div class="container" style="margin-top:100px">
	<div class="card shadow">
		<div class="card-body">
			<h4 class="card-title">맛집리스트보기</h4>
			<table class="table table-hover" id='restList'>
				<thead>
					<tr>
						<th class="text-center d-none d-md-table-cell">글번호</th>
						<th class="text-center w-50">제목</th>
						<th class="text-center d-none d-md-table-cell">음식분류</th>
						<th class="text-center d-none d-md-table-cell">지역분류</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="restBean" items="${restList }">						
						<tr>
							<td class="text-center d-none d-md-table-cell">${restBean.rs_idx }</td>							
							<td><a href="${root}/restaurant/detail?rs_idx=${restBean.rs_idx}&page=${page}">${restBean.rs_name }</a></td>		
							<td class="text-center d-none d-md-table-cell">${restBean.food_name }</td>	
							<td class="text-center d-none d-md-table-cell">${restBean.region_name }</td>				
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
								<a href="${root}/restaurant/main?page=${pageBean.prevP}" class="page-link">이전</a>
							</li>						
						</c:otherwise>
					</c:choose>
				
					<c:forEach var="idx" begin ="${pageBean.min }" end = "${pageBean.max }" >					
						<c:choose>
							<c:when test="${idx == pageBean.currentP}">
								<li class="page-item active">
									<a href="${root}/restaurant/main?page=${idx}" class="page-link">${idx }</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a href="${root}/restaurant/main?page=${idx}" class="page-link">${idx }</a>
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
								<a href="${root}/restaurant/main?page=${pageBean.nextP}" class="page-link">다음</a>
							</li>
						</c:otherwise>
					</c:choose>						
				</ul>
			</div>			
			<div class="text-right">
				<a href="${root}/restaurant/write?&page=${page}" class="btn btn-primary">글쓰기</a>
			</div>
			
		</div>
	</div>
</div>

<%-- <c:import url="/WEB-INF/views/include/bottom_menu.jsp" /> --%>

</body>
</html>
