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
        <title>Jeju Matzip_modification user info</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${root }resources/assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${root }resources/css/styles.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
    </head>
    <script>
      function resetUserIdExist(){	  
    	  $("#userIdExist").val("1");
    	  $("#idck").val("no");
      } // resetUserIdExist
      
      function joinCheck(f){
			if(f.user_pw.value!=f.user_pw2.value){
				alert("변경한 비밀번호와 비밀번호 확인이 서로 다릅니다.");
				f.user_pw.focus();
				return false;
			}
			if(!f.user_pw.value || !f.user_pw2.value){
				alert("비밀번호를 확인하세요.");
				f.user_pw.focus();
				return false;
			}
			
			const regExpS = /[!?@#$%^&*():;+-=~{}<>\_\[\]\|\\\"\'\,\.\/\`\₩]/g;
			const regExpK = /[ㄱ-ㅎㅏ-ㅣ가-힣]/g;
			const regExpN = /[0-9]/g;
			const regExpE = /[a-zA-Z]/g;
			
			//	이름 제약 조건
			if(regExpK.test(f.user_name) && f.user_name.length === 2){
				return true;
			} else {
				alert("이름은 한글 2자 이상 입력하세요.")
				f.user_name.focus()
				return false;
			}
			if(regExpS.test(f.user_name)){
				alert("이름에는 특수문자가 포함될 수 없습니다.")
				f.user_name.focus()
				return false;
			} else {
				return true;
			}
			
		}
      function yesOrNo(){
    	  if(confirm("회원 탈퇴 시 작성한 모든 게시물이 삭제됩니다. 계속 진행하시겠습니까 ?")){
    		  location.href="${root }user/delete?user_id=${loggedUserInfo.user_id }";
    		  return true;
    	  } else {
    		  alert("회원 탈퇴가 취소 되었습니다.")
    		  return false;
    	  }
      }
  
</script>
    <body>
        <!-- TOP MENU - Responsive navbar-->
        <c:import url="/WEB-INF/views/include/top_menu.jsp" />
        <!-- Page Content-->
        <div class="container px-4 px-lg-5">
            <!-- Heading Row-->
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <div class="col-lg-3"></div>
                <div class="col-lg-6">
					<div class="card shadow">
				<div class="card-body">
					<form:form action="${root }user/update_procedure" method="post" modelAttribute="loggedUserInfo" onsubmit="return joinCheck(this)">
						<div class="form-group">
							<form:label path="user_id">아이디</form:label>
							<form:input path="user_id" class="form-control" readonly="true" />
							<form:errors path="user_id" style="color:red;"/>
						</div>
						<div class="form-group">
							<form:label path="user_pw">비밀번호</form:label>
							<form:password path="user_pw" class="form-control" showPassword="true" />
							<form:errors path="user_pw" style="color:red;"/>
						</div>
						<div class="form-group">
							<form:label path="user_pw2">비밀번호확인</form:label>
							<!-- <input type="password" id="user_pw2" name="user_pw2" value="user_pw" class="form-control" >-->
							<form:password path="user_pw2" class="form-control" showPassword="true" />
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
								<form:button class="btn btn-primary">정보수정</form:button>
								<span class="btn btn-danger" onclick="yesOrNo()">회원탈퇴</span>
							</div>
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