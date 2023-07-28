<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }/" /> 
<script>
  alert("회원 가입에 성공했습니다. 로그인하세요.");
  location.href = "${root}user/login";
</script>