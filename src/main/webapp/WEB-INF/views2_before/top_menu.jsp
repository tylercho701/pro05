<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <c:url var="root" value="/" /> -->
<!-- localhost(127.0.0.1):portnumber/projectname : Context Path -->

    <head>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="./resources/assets/favicon.ico" />
        
        <!-- CSS (includes Bootstrap) -->
        <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" />

	</head>

<c:set var="root" value="${pageContext.request.contextPath }/" />
<%
	String sid="";
	if(session.getAttribute("sid")!=null){
		sid = (String) session.getAttribute("sid");
	}
 %>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container px-5">
			<img src="${root }resources/images/logo_wh.png" alt="로고"
				style="width: 30px; height: auto;">
			<a href="${root }" class="navbar-brand"
				style="margin-left: 10px; font-size: 1.5em;" alt="다시 홈으로">JEJUMATJIP</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="navbar navbar-expand-lg">
				<ul class="nav nav-pills">
					<li class="nav-item"><a class="nav-link" href="${root }restaurant/main">맛집리스트</a></li>
					<li class="nav-item"><a class="nav-link" href="${root }review">리뷰</a></li>
					<li class="nav-item"><a class="nav-link" href="${root }notice/main">공지사항</a></li>
					<li class="nav-item"><a class="nav-link" href="${root }qna/main">QnA</a></li>
				</ul>
			</div>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            <c:if test="${empty sid }" >
							<li class="nav-item"><a href="${root}user/login" class="nav-link">로그인</a></li>
							<li class="nav-item"><a href="${root}user/join" class="nav-link">회원가입</a></li>
						</c:if>               	
           	<c:if test="${sid.equals('admin') }">
           		<li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Admin</a></li>
           		<li class="nav-item"><a href="${root}user/logout" class="nav-link">로그아웃</a></li>
           	</c:if>						
						<c:if test="${!empty sid && !sid.equals('admin') }">
							<li class="nav-item"><a href="${root}user/modify" class="nav-link">정보수정</a></li>
							<li class="nav-item"><a href="${root}user/logout" class="nav-link">로그아웃</a></li>
						</c:if>
        </ul>
			</div>
		</div>
	</nav>
