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

	<table>
		<tbody>
		<c:forEach items="${reviewList }" var="review" varStatus="status">
			<tr>
				<td>${status.count }</td>
				<td>${review.rev_idx }</td>
				<td>${review.rs_idx }</td>
				<td>${review.rev_title }</td>
				<td>${review.rev_score }</td>
				<td>${review.rev_id }</td>
				<c:if test="${!empty review.rev_file }">
					<td>${review.rev_file }</td>
				</c:if>
				<td>${review.rev_content }</td>
				<td>${review.rev_regdate }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div>
		<a href="javascript:history.go(-1)">뒤로가기</a>
	</div>
	
	<!-- Footer-->
    <c:import url="/WEB-INF/views/include/bottom_menu.jsp" />
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="${root }resources/js/scripts.js"></script>
	
</body>
</html>