<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- <c:url var="root" value="/" /> --> 
<!-- localhost(127.0.0.1):portnumber/projectname : Context Path -->  
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>로그인</title>
        <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/color-modes.js"></script>
                
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="./resources/assets/favicon.ico" />
        
        <!-- CSS (includes Bootstrap) -->
        <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" />
	    	    
	    <!-- Custom styles for this template -->
	    <!--<link href="${pageContext.request.contextPath}/resources/css/product.css" rel="stylesheet">-->
    	<link href="${pageContext.request.contextPath}/resources/css/carousel.css" rel="stylesheet">

	<style>
	</style>
    </head>
    	
    <body>
        <!-- TOP MENU - Responsive navbar-->
        <c:import url="/WEB-INF/views/include/top_menu.jsp" />
        
        <!-- Page Content-->
		<div class="container" style="margin-top:230px; height: 430px; ">
            <!-- Heading Row-->
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <div class="col-lg-3"></div>
                <div class="col-lg-6">
					<div class="card shadow">
						<div class="card-body">
						    <c:if test="${requestScope.fail == true }">
							<div class="alert alert-danger">
								<h3>로그인 실패</h3>
								<p>아이디 비밀번호를 확인해주세요</p>
							</div>
							</c:if>
							<form:form action="${root }user/login_procedure" method="post" modelAttribute="loginUserInfo">
								<div class="form-group">
									<form:label path="user_id">아이디</form:label>
									<form:input path="user_id" class="form-control"/><br>
									<form:errors path="user_id" style="color:red"/>
								</div>
								<div class="form-group">
									<form:label path="user_pw">비밀번호</form:label>
									<form:password path="user_pw" class="form-control"/><br>
									<form:errors path="user_pw" style="color:red"/>
								</div>
								<div class="form-group text-right">
									<form:button class="btn btn-primary">로그인</form:button>
									<a href="${root }user/join" class="btn btn-danger">회원가입</a>
								</div>
							</form:form>
						</div>
					</div>
				</div>
                <div class="col-lg-3"></div>
            </div>
        </div>
       <!-- Footer-->
        <c:import url="/WEB-INF/views/include/bottom_menu.jsp" />
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${root }resources/js/scripts.js"></script>
    </body>
</html>