<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!-- <c:url var="root" value="/" /> --> 
<!-- localhost(127.0.0.1):portnumber/projectname : Context Path -->
<!--index.jsp에는 시작시 -->
<c:set var="root" value="${pageContext.request.contextPath }/" />

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
    	<meta name="generator" content="Jekyll v3.8.5">
        <title>Jeju Matjip Team Project</title>
        <script src="${pageContext.request.contextPath}/resources/js/color-modes.js"></script>
                
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="./resources/assets/favicon.ico" />
        
        <!-- CSS (includes Bootstrap) -->
        <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" />
	    	    
	    <!-- Custom styles for this template -->
	    <!--<link href="${pageContext.request.contextPath}/resources/css/product.css" rel="stylesheet">-->
    	<link href="${pageContext.request.contextPath}/resources/css/carousel.css" rel="stylesheet">
    	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

	<style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }
	  
	  .featurette {
	   padding-bottom: 50px;
	  }
	  
	  img {
	  border-radius: 7px;
	  justify-content:center;
	  }
	  
      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
  </head>
 
  <body>
    <!-- TOP MENU -->
    <c:import url="/WEB-INF/views/include/top_menu.jsp" />
    
	<!-- TOP IMAGE -->
	<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
	  <div class="carousel-indicators">
	    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
	    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
	    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
	  </div>
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="./resources/images/main1.jpg" class="d-block w-100" alt="메인이미지" width="100%" height="100%" >
	      <div class="carousel-caption d-none d-md-block">
	      </div>
	    </div>
	    <div class="carousel-item">
	      <img src="./resources/images/main2.jpg" class="d-block w-100" alt="메인이미지" width="100%" height="100%" >
	      <div class="carousel-caption d-none d-md-block">
	      </div>
	    </div>
	    <div class="carousel-item">
	      <img src="./resources/images/main3.jpg" class="d-block w-100" alt="메인이미지" width="100%" height="100%" >
	      <div class="carousel-caption d-none d-md-block">
	      </div>
	    </div>
	    <div class="carousel-item">
	      <img src="./resources/images/main4.jpg" class="d-block w-100" alt="메인이미지" width="100%" height="100%" >
	      <div class="carousel-caption d-none d-md-block">
	      </div>
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
	
  <!-- MAIN CONTENTS
  ================================================== -->

<div class="container marketing">

    <!-- Three columns of text below the carousel -->
    <div class="row">
    <h2 class="featurette-heading fst-italic lh-lg">BEST Jejumatjip TOP3</h2>
    <c:forEach items="${restTop3List }" var="restTop3List">
       <div class="col-lg-4">
        <img src="${root}resources/upload/${restTop3List.rs_file}" width="300" height="200">
        <h3 style="margin-top: 20px;" >${restTop3List.rs_name }</h3>
        <p>${restTop3List.rs_content }</p>
        <p><a class="btn btn-light" href="${root}restaurant/detail?rs_idx=${restTop3List.rs_idx}" role="button">View details &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
    </c:forEach>
    </div><!-- /.row -->
   </div>
		

    <!-- START THE FEATURETTES -->
	<main>
	    <c:forEach items="${restBeanList2 }" var="list" varStatus="status">
	   <hr class="featurette-divider">
	   <div class="row featurette">
	         <h3 class="featurette-heading fw-normal lh-1">${list[0].region_name }시 ${list[0].food_name }점 최신 리스트</h3>
	      <div class="col-md-6">
	      <table class="table table-hover" id='restList'>
	         <thead>
	            <div class="list-group w-auto">
	            <c:forEach var="restBean" items="${list }">
					<a href="${root}restaurant/detail?rs_idx=${restBean.rs_idx}" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
	                  <i class="bi bi-house-heart"></i>
	                  <div class="d-flex gap-2 w-100 justify-content-between">
	                     <div>
	                        <h6 class="mb-0">${restBean.rs_name }</h6>
	                        <p class="mb-0 opacity-75">${restBean.rs_addr }</p>
	                        <p class="mb-0 opacity-75">${restBean.rs_phone }</p>
	                     </div>
	                  </div>
	               </a>
	            </c:forEach>
	            </div>
	         </thead>
	      </table>         
	
	      </div>
	      <div class="col-md-6">
	      <c:choose>
	         <c:when test="${list[0].rs_food_cate eq '01' && list[0].rs_region_cate eq '01' }">
	            <img src="${root }resources/images/sub3.jpg" class="d-block" alt="${list[0].region_name }시 ${list[0].food_name }점 IMG">
	         </c:when>
	         <c:when test="${list[0].rs_food_cate eq '01' && list[0].rs_region_cate eq '02' }">
	            <img src="${root }resources/images/sub1.jpg" class="d-block" alt="${list[0].region_name }시 ${list[0].food_name }점 IMG">
	         </c:when>
	         <c:when test="${list[0].rs_food_cate eq '02' && list[0].rs_region_cate eq '01' }">
	            <img src="${root }resources/images/sub4.jpg" class="d-block" alt="${list[0].region_name }시 ${list[0].food_name }점 IMG">
	         </c:when>
	         <c:when test="${list[0].rs_food_cate eq '02' && list[0].rs_region_cate eq '02' }">
	            <img src="${root }resources/images/sub2.jpg" class="d-block" alt="${list[0].region_name }시 ${list[0].food_name }점 IMG">
	         </c:when>
	      </c:choose>
	      </div>
	   </div>
	   
	   <c:if test="${status.last }">
	   </c:if>
	   </c:forEach>
	     
        <!-- FOOTER --> 
        <c:import url="/WEB-INF/views/include/bottom_menu.jsp" />
 		</main>      
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
                
        <!-- Core theme JS-->
        <script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
    	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	
    </body>
</html>