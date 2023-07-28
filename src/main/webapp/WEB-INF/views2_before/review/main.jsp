<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>리뷰</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="../resources/assets/favicon.ico" />
<style>
#noPage {
	display: none;
}
</style>
</head>
<body>

	<!-- Header -->
	<c:import url="/WEB-INF/views/include/top_menu.jsp"></c:import>

	<!-- 게시글 리스트 -->
	<div class="container" style="margin-top: 100px">
		<div class="card shadow">
			<div class="card-body">
				<h4 class="card-title">내가 작성한 리뷰</h4>
				<table class="table table-hover" id='notiList'>
					<thead>
						<tr>
							<th class="text-center d-none d-md-table-cell">글번호</th>
							<th class="text-center d-none d-md-table-cell">가게명</th>
							<th class="text-center w-50">리뷰제목</th>
							<th class="text-center d-none d-md-table-cell">작성자</th>
							<th class="text-center d-none d-md-table-cell">작성날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="review" items="${myReviewList }">
							<tr>
								<td class="text-center d-none d-md-table-cell">${review.rev_idx }</td>
								<td class="text-center d-none d-md-table-cell">${review.rs_name }</td>
								<td class="text-center d-none d-md-table-cell">
									<a href="${root }/review/detail?rev_idx=${review.rev_idx }&myPage=${myPage }">${review.rev_title }</a>
								</td>
								<td class="text-center d-none d-md-table-cell">${review.rev_id }</td>
								<td class="text-center d-none d-md-table-cell">${review.rev_regdate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<%-- <div class="text-right">
				<c:if test="${sid == 'admin'}">
					<a href="${root}/notice/write?page=${page}" class="btn btn-primary">글쓰기</a>
				</c:if>
			</div> --%>
				<div>
					<ul class="pagination justify-content-center">
						<c:choose>
							<c:when test="${myRevPageBean.currentP == 1 || myRevPageBean.pageCnt == 0 }">
								<li class="page-item disabled">
									<a href="#" class="page-link">이전</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a href="${root }/review/main?myPage=${myRevPageBean.prevP}" class="page-link">이전</a>
								</li>
							</c:otherwise>
						</c:choose>
						<c:forEach var="idx" begin="${myRevPageBean.min }" end="${myRevPageBean.max }">
							<c:choose>
								<c:when test="${idx == myRevPageBean.currentP }">
									<li class="page-item active">
										<a href="${root }/review/main?myPage=${idx}" class="page-link">${idx }</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item">
										<a href="${root }/review/main?myPage=${idx}" class="page-link">${idx }</a>
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${myRevPageBean.currentP == myRevPageBean.pageCnt || myRevPageBean.pageCnt == 0 }">
								<li class="page-item disabled">
									<a href="#" class="page-link">다음</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a href="${root }/review/main?myPage=${myRevPageBean.nextP}" class="page-link">다음</a>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- <script>
	function imgPop(i){
		window.open("/review/pop?img="+i);
	}
</script> -->
	<!-- Footer-->
	<c:import url="/WEB-INF/views/include/bottom_menu.jsp"></c:import>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="${root }/resources/js/scripts.js"></script>
</body>
</html>
