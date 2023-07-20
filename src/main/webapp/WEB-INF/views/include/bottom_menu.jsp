<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<footer class="py-5 bg-dark">
	<div class="container px-4 px-lg-5">
		<p class="m-0 text-center text-white">Copyright &copy; JejuMatjip
			Website 2023</p>
	</div>
	<div class="container px-3" style="text-align: center;">
		<a href="https://ijto.or.kr/korean/" target="_blank" title="새창으로 이동" style="text-decoration: none;">
			<strong>제주관광공사 바로가기</strong>
			<img src="${root }resources/icon/footer_link.png" alt="footer_link"
			style="width: 12px; height: 12px;">
		</a>
	</div>
</footer>
