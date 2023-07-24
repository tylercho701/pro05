<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
	<link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
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
				<c:choose>
					<c:when test="${!empty review.rev_file }">
						<td><img src="${root }/resources/upload/${review.rev_file }" alt="${review.rev_file }" width="50%"></td>
					</c:when>
					<c:otherwise>
						<td>첨부 이미지 없음</td>
					</c:otherwise>
				</c:choose>
				<td>${review.rev_content }</td>
				<!-- <td><button onclick=""></button></td> -->
				<td>${review.rev_regdate }</td>
				<td><a href="/review/deleteReview?rev_idx=${review.rev_idx }">리뷰 삭제하기</a></td>
				<td><a href="/review/updateReview?rev_idx=${review.rev_idx }">리뷰 수정하기</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div>
		<a href="javascript:history.go(-1)">뒤로가기</a>
	</div>
</body>
</html>