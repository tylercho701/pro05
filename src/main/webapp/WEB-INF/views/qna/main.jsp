<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<c:set var="root" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
        <title>QnA</title>
                
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
		<div class="row"></div>
			<div class="col-sm-12">
				<div class="card shadow">
					<div class="card-body">
						<h3 class="card-title"><strong>Q&A 게시판</strong></h3>
						<table class="table table-hover" id='qna_list'>
							<thead>
								<tr>
									<th class="text-center d-none d-md-table-cell">글번호</th>
									<th class="text-center w-50">제목</th>
									<th class="text-center d-none d-md-table-cell">작성자</th>
									<th class="text-center d-none d-md-table-cell">답글 수</th>
									<th class="text-center d-none d-md-table-cell">작성날짜</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="qnaBean" items="${qnaList }">						
									<tr>							
										<c:if test="${qnaBean.lev==1}">
											<td class="text-center d-none d-md-table-cell">${qnaBean.qna_idx }</td>															
											<td><a href="${root }/qna/detail?qna_idx=${qnaBean.qna_idx }&page=${page}">${qnaBean.qna_title }</a></td>					
											<td class="text-center d-none d-md-table-cell">${qnaBean.qna_id }</td>
											<td class="text-center d-none d-md-table-cell">${qnaBean.reply_cnt }</td>
											<td class="text-center d-none d-md-table-cell">${qnaBean.qna_resdate }</td>	
										</c:if>									
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
											<a href="${root}/qna/main?page=${pageBean.prevP}" class="page-link">이전</a>
										</li>						
									</c:otherwise>
								</c:choose>
							
								<c:forEach var="idx" begin ="${pageBean.min }" end = "${pageBean.max }" >					
									<c:choose>
										<c:when test="${idx == pageBean.currentP}">
											<li class="page-item active">
												<a href="${root}/qna/main?page=${idx}" class="page-link">${idx }</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="page-item">
												<a href="${root}/qna/main?page=${idx}" class="page-link">${idx }</a>
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
											<a href="${root}/qna/main?page=${pageBean.nextP}" class="page-link">다음</a>
										</li>
									</c:otherwise>
								</c:choose>						
							</ul>
						</div>			
						<div class="text-right">
							<a href="${root}/qna/write?page=${page}" class="btn btn-primary">질문하기</a>
						</div>
					</div>
				</div>
			</div>				<%-- "<c:out value=${qnaBean.lev} />" --%>
		</div>
	
	<!-- Footer-->
	<c:import url="/WEB-INF/views/include/bottom_menu.jsp"></c:import>	
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="${root }/resources/js/scripts.js"></script>
	<script src="https://code.jquery.com/jquery-3.7.0.slim.js" integrity="sha256-7GO+jepT9gJe9LB4XFf8snVOjX3iYNb0FHYr5LI1N5c=" crossorigin="anonymous"></script>
</body>
</html>