<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<script>
	alert("작성하신 게시글이 게시되었습니다");
	location.href = "${root}restaurant/detail?rs_idx=${writeRestBean.rs_idx}&page=1";
</script>