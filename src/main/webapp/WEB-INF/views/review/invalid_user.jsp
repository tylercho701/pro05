<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	alert("리뷰 작성자가 아닙니다.");
	/* location.href = "/review"; */
	location.href = "javascript:history.go(-1)";
</script>