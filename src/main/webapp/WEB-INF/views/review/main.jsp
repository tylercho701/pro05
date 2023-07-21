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
	<title>Insert title here</title>
	<link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>

	<!-- TOP MENU - Responsive navbar-->
    <c:import url="/WEB-INF/views/include/top_menu.jsp" />

	<h2>reviewMain</h2>
	<h5><a href="/review/all">모든 리뷰 보기 - 최신리뷰순 정렬</a></h5>
	<h5><a href="/review/rs_idx/1">가게별 리뷰 - 음식점01</a></h5>
	<h5><a href="/review/region/01">지역별 리뷰 - 서귀포</a></h5>
	<h5><a href="/review/region/02">지역별 리뷰 - 제주</a></h5>
	<h5><a href="/review/insertReview">리뷰 등록</a></h5>
	<!-- <h5><a href="/review/updateReview">리뷰 업데이트</a></h5> -->
	<h5><a href="/review/deleteReview">리뷰 삭제</a></h5>
	
	<!-- Footer-->
    <c:import url="/WEB-INF/views/include/bottom_menu.jsp" />
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="${root }resources/js/scripts.js"></script>
</body>
</html>