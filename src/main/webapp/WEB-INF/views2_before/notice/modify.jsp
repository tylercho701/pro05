<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- localhost(127.0.0.1):portnumber/projectname => Context Path -->
<%-- <c:url var="root" value="/" /> 이것과 아래는 같다. --%>
<c:set var="root" value="${pageContext.request.contextPath }" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>공지사항 수정하기</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>

<!-- Header -->
<c:import url="/WEB-INF/views/include/top_menu.jsp"></c:import>	

<div class="container" style="margin-top:100px">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<div class="card-body">
					<form:form action="${root}/notice/modify_procedure" method="post" modelAttribute="modifyNoticeBean" enctype="multipart/form-data">
					<form:hidden path="noti_idx" />
					<input type="hidden" name="page" value="${page}" />
						<div class="form-group">
							<form:label path="noti_author">작성자</form:label>
							<form:input path="noti_author" class="form-control" readonly="true" />
						</div>
						<div class="form-group">
							<form:label path="noti_regdate">작성날짜</form:label>
							<form:input path="noti_regdate" class="form-control" readonly="true" />
						</div>
						<div class="form-group">
							<form:label path="noti_title">제목</form:label>
							<form:input path="noti_title" class="form-control" />
							<form:errors path="noti_title" style="color:red" />
						</div>
						<div class="form-group">
							<form:label path="noti_content">내용</form:label>
							<form:textarea path="noti_content" class="form-control" rows="10" style="resize:none" />
							<form:errors path="noti_content" style="color:red" />
						</div>
						<div class="form-group">
							<form:label path="upload_file">첨부 이미지</form:label>
							<c:if test="${modifyNoticeBean.noti_file != null }">						
								<img src="${root}/resources/upload/${modifyNoticeBean.noti_file }" width="100%"/>	
								<form:hidden path="noti_file" />
							</c:if>
							<form:input type="file" path="upload_file" class="form-control" accept="image/*"/>												
						</div>
						<div class="form-group">
							<div class="text-right">
								<form:button class="btn btn-primary">수정완료</form:button>
								<a href="${root}/notice/detail?noti_idx=${modifyNoticeBean.noti_idx}&page=${page}" class="btn btn-info">취소</a>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>
<!-- Footer-->
<c:import url="/WEB-INF/views/include/bottom_menu.jsp"></c:import>	
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="./resources/js/scripts.js"></script>
</body>
</html>
