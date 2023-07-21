<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="root" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>qna 목록</title>
	<!-- Bootstrap CDN -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<style>
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

</style>
</head>

	<body>
	<!-- 상단 네비게이션 바 -->
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />

	<!-- 게시글 리스트 -->
	<div class="container-wrap">
		<div class="card shadow">
			<div class="card-body">
				<h3 class="card-title">Q&A 게시판</h3>
				<table class="table table-hover" id='qna_list'>
					<thead>
						<tr>
							<th class="text-center d-none d-md-table-cell">글번호</th>
							<th class="w-50">제목</th>
							<th class="text-center d-none d-md-table-cell">작성자</th>
							<th class="text-center d-none d-md-table-cell">작성날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="qnaBean" items="${qnaList }">						
							<tr>
								<td class="text-center d-none d-md-table-cell">${qnaBean.qna_idx }</td>							
								<td class="text-center d-none d-md-table-cell"><a href="qna/read?qna_idx=${qnaBean.qna_idx }&page=${page }">${qnaBean.qna_title }</a></td>
								<td class="text-center d-none d-md-table-cell">${qnaBean.qna_id }</td>
								<td class="text-center d-none d-md-table-cell">${qnaBean.qna_resdate }</td>						
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
									<a href="${root}/notice?page=${pageBean.prevP}" class="page-link">이전</a>
								</li>						
							</c:otherwise>
						</c:choose>
					
						<c:forEach var="idx" begin ="${pageBean.min }" end = "${pageBean.max }" >					
							<c:choose>
								<c:when test="${idx == pageBean.currentP}">
									<li class="page-item active">
										<a href="${root}/qna?page=${idx}" class="page-link">${idx }</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item">
										<a href="${root}/qna?page=${idx}" class="page-link">${idx }</a>
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
									<a href="${root}/qna?page=${pageBean.nextP}" class="page-link">다음</a>
								</li>
							</c:otherwise>
						</c:choose>						
					</ul>
				</div>			
				<div class="text-right">
					<a href="${root}/qna?page=${page}" class="btn btn-primary">글쓰기</a>
				</div>
				<hr>
				<h3 class="card-title">답변</h3>
			</div>
		</div>
	</div>

	<!-- Footer-->
    <c:import url="/WEB-INF/views/include/bottom_menu.jsp" />
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="${root }resources/js/scripts.js"></script>

</body>
</html>