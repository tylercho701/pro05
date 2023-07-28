<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	alert("리뷰가 수정되었습니다.");
	location.href = "/review/detail?rev_idx=${rev_idx}&myPage=${myPage}";
</script>