<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- localhost(127.0.0.1):portnumber/projectname => Context Path -->
<%-- <c:url var="root" value="/" /> 이것과 아래는 같다. --%>
<c:set var="root" value="${pageContext.request.contextPath }" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>공지사항 글 상세보기</title>
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
					<div class="form-group">
						<label for="noti_idx">글 번호</label>
						<input type="text" id="noti_idx" name="noti_idx" class="form-control" value="${noticeDetailBean.noti_idx }" disabled="disabled"/>
					</div>					
					<div class="form-group">					
						<label for="noti_title">글 제목</label>
						<input type="text" id="noti_title" name="noti_title" class="form-control" value="${noticeDetailBean.noti_title }" disabled="disabled"/>
					</div>
					<div class="form-group">
						<label for="noti_author">작성자</label>
						<input type="text" id="noti_author" name="noti_author" class="form-control" value="${noticeDetailBean.noti_author }" disabled="disabled"/>
					</div>					
					<div class="form-group">
						<label for="noti_content">내용</label>
						<textarea id="noti_content" name="noti_content" class="form-control" rows="10" style="resize:none" disabled="disabled">${noticeDetailBean.noti_content }</textarea>
					</div>
					<div class="form-group">
						<label for="noti_regdate">작성일</label>
						<input type="text" id="noti_regdate" name="noti_regdate" class="form-control" value="${noticeDetailBean.noti_regdate }" disabled="disabled"/>
					</div>	
					<c:if test="${noticeDetailBean.noti_file != null }">
						<div class="form-group">
							<label for="noti_file">첨부 이미지</label>
							<img src="${root}/resources/upload/${noticeDetailBean.noti_file }" width="100%"/>						
						</div>
					</c:if>					
					<div class="form-group">
						<div class="text-right">
							<a href="${root}/notice/main?page=${page}" class="btn btn-primary">목록보기</a>						 	
						 	<c:if test="${sid == 'admin'}">
								<a href="${root}/notice/modify?noti_idx=${noti_idx}&page=${page}" class="btn btn-info">수정하기</a>
								<a href="${root}/notice/delete?noti_idx=${noti_idx}&page=${page}" class="btn btn-danger">삭제하기</a>
							</c:if>
						</div>
					</div>
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
<script src="${root}/resources/js/scripts.js"></script>
</body>
</html>
