<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="root" value="${pageContext.request.contextPath }" />  
<script>
	alert("공지글 게시가 성공했습니다.");
	location.href = "${root}/notice/detail?noti_idx=${writeNoticeBean.noti_idx}&page=${page}";
</script>