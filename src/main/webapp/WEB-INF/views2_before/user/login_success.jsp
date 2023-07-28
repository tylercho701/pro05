<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }/" /> 
<%
	String sid="";
	if(session.getAttribute("sid")!=null){
		sid = (String) session.getAttribute("sid");
	}
 %>
<script>
  alert("로그인 성공했습니다 !!!");
  location.href = "${root}";
</script>