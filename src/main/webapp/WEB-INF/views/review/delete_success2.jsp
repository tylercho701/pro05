<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	alert("리뷰가 삭제되었습니다.");
	location.href = "/review/main?myPage=${myPage}";
</script>