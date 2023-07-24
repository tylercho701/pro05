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
<title>공지사항 글쓰기</title>
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
					<form:form action="${root}/qna/write_procedure" method="post" modelAttribute="writeQnaBean" >
					<form:hidden path="qna_idx" />									
					<input type="hidden" name="page" value="${page }" />		
						<div class="form-group">
							<form:label path="qna_id">작성자</form:label>
							<form:input path="qna_id" class="form-control" value="${sid }" readonly="true" />			
						</div>			
						<div class="form-group">
							<form:label path="qna_title">제목</form:label>
							<form:input path="qna_title" class="form-control"/>
							<form:errors path="qna_title" style="color:red"/>
						</div>
						<div class="form-group">
							<form:label path="qna_content">내용</form:label>
							<form:textarea path="qna_content" class="form-control" rows="10" style="resize:none" />
							<form:errors path="qna_content" style="color:red" />
						</div>
						<div class="form-group">
							<div class="text-right">
								<form:button class="btn btn-primary">작성하기</form:button>
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
