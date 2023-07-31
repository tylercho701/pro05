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
        <title>회원가입</title>
        <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/color-modes.js"></script>
                
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="./resources/assets/favicon.ico" />
        
        <!-- CSS (includes Bootstrap) -->
        <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" />
	    	    
	    <!-- Custom styles for this template -->
	    <!--<link href="${pageContext.request.contextPath}/resources/css/product.css" rel="stylesheet">-->
    	<link href="${pageContext.request.contextPath}/resources/css/carousel.css" rel="stylesheet">
    	
	<!-- <style>
	.container-wrap {
		margin-top: 120px;
		position: relative;
		min-height: 100%;
	    padding-bottom: 250px;
		bottom:0px;
	}
	</style> -->
	
    </head>
    <script>
    function checkUserIdExist(){
    	var user_id = $("#user_id").val()
    	
    	if(user_id.length == 0){
    		alert('아이디를 입력해 주세요');
    		return;
    	}
    	
    	$.ajax({
    		url : "${root}user/checkUserIdExist/" + user_id,
    		type : "get",
    		dataType : "text",
    		success : function(result){
    			if(result.trim() == "0"){
    				alert("사용할 수 있는 아이디입니다");
    				$("#userIdExist").val("0");
    				$("#idck").val("yes");
    				$("#user_pw").focus();
    			}else if(result.trim() == "1"){
    				alert("이미 존재하는 아이디입니다");
    				$("#userIdExist").val("1");
    				$("#user_id").focus();
    			}
    		}			
    	})
    	
      } // checkUserIdExist
      
     
      function resetUserIdExist(){	  
    	  $("#userIdExist").val("1");
    	  $("#idck").val("no");
      } // resetUserIdExist
      
      function joinCheck(f){
			if(f.user_pw.value!=f.user_pw2.value){
				alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
				f.user_pw.focus();
				return false;
			}
			if(f.idck.value!="yes"){
				alert("아이디 중복 체크를 하지 않으셨습니다.");
				return false;
			}
		}
  
</script>
    <body>
        <!-- TOP MENU - Responsive navbar-->
        <c:import url="/WEB-INF/views/include/top_menu.jsp" />
        
        <!-- Page Content-->
		<div class="container" style="margin-top:100px; height: 545px;">
                <div class="col-sm-12">
					<div class="card shadow">
						<div class="card-body">
							<form:form action="${root }user/join_procedure" method="post" modelAttribute="joinUserBean" onsubmit="return joinCheck(this)">
							    <form:hidden path="userIdExist" />
							    <input type="hidden" id="idck" name="idck" value="no" />
								<div class="form-group">
									<form:label path="user_id">아이디</form:label>
									<div class="input-group">
										<form:input path="user_id" class="form-control" onkeypress="resetUserIdExist()"/>
										<div class="input-group-append">
											<button type="button" class="btn btn-primary" onclick="checkUserIdExist()">중복확인</button>
										</div>
									</div>
									<form:errors path="user_id" style="color:red;"/>
								</div>
								<div class="form-group">
									<form:label path="user_pw">비밀번호</form:label>
									<form:password path="user_pw" class="form-control"/>
									<form:errors path="user_pw" style="color:red;"/>
								</div>
								<div class="form-group">
									<form:label path="user_pw2">비밀번호확인</form:label>
									<form:password path="user_pw2" class="form-control"/>
									<form:errors path="user_pw2" style="color:red;"/>
								</div>
								<div class="form-group">
									<form:label path="user_name">이름</form:label>
									<form:input path="user_name" class="form-control"/>
									<form:errors path="user_name" style="color:red;"/>
								</div>
								<div class="form-group">
									<form:label path="user_phone">연락처</form:label>
									<form:input path="user_phone" class="form-control"/>
									<form:errors path="user_phone" style="color:red;"/>
								</div>
								<div class="form-group">
									<form:label path="user_email">이메일</form:label>
									<form:input path="user_email" class="form-control"/><br>
									<form:errors path="user_email" style="color:red;"/>
								</div>
								<div class="form-group">
									<div class="text-right">
										<form:button class="btn btn-primary">회원가입</form:button>
									</div>
								</div>
							</form:form>
						</div>
					</div>
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