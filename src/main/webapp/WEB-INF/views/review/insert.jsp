<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>리뷰 작성</title>
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
	<c:import url="${root }/WEB-INF/views/include/top_menu.jsp" />
	
	<div class="container" style="margin-top:100px">
		<div class="row">
			<div class="col-sm-12">
				<div class="card shadow">
					<div class="card-body">
						<div class="form-group">
							<h3 class="text-center card-title"><strong>JejuMatjip My Review</strong></h3>
							<form:form action="/review/insertReview" method="post" modelAttribute="reviewBean" enctype="multipart/form-data" >
								<%-- <form:hidden path="rs_idx"/> --%>
								<input type="hidden" id="rs_idx" name="rs_idx" value="${rs_idx }">
								
								<form:label path="rev_title">제목</form:label>
								<form:input type="text" path="rev_title" class="form-control"/>
								<form:errors path="rev_title" style="color:red;" /><br>
								
								<form:label path="rev_score">점수</form:label>
								<form:input type="number" path="rev_score" class="form-control"/>
								<form:errors path="rev_score" style="color:red;" /><br>
								
								<!-- accept="image/*  :  이미지 파일 확장자는 전부 첨부 가능 -->
								<form:label path="upload_file" >첨부 이미지</form:label>
								<form:input type="file" path="upload_file" class="form-control" accept="image/*"/><br>
								
								<form:label path="rev_content">내용</form:label>
								<form:textarea path="rev_content" class="form-control"/>
								<form:errors path="rev_content" style="color:red;" /><br>
								
								<input type="hidden" id="page" name="page" value="${page }">
								
								<div class="form-group">
									<div class="text-right">
										<form:button type="submit" class="btn btn-light">리뷰 등록</form:button>
										<form:button type="reset" class="btn btn-danger">초기화</form:button>
										<a href="${root }/restaurant/detail?rs_idx=${reviewBean.rs_idx }&page=${page }" class="btn btn-dark">뒤로가기</a>
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