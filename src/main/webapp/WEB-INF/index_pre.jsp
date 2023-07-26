<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
        <title>Jeju Matzip</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${root }resources/assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${root }resources/css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <!-- TOP MENU - Responsive navbar-->
        <c:import url="/WEB-INF/views/include/top_menu.jsp" />
        <!-- 게시판 미리보기 (main list)-->
		 <main>
			 <div class="top-wrap" style="background-image: url('../resources/images/main1.jpg')";>
	          <div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-body-tertiary">
	            <div class="col-md-6 p-lg-5 mx-auto my-5">
	              <h1 class="display-3 fw-bold">제주 맛집의 모든 것!</h1>
	              <h4 class="fw-normal text-muted mb-3">제주를 여행하는 새로운 방법,<br> 제주맛집(JEJUMATJIP)에서 만나보세요!</h4>
	              <h7 class="fw-normal text-muted mb-4">제주를 방문하는 여행객들의 리뷰를 통해 제주의 다양한 맛집을 한곳에서 쉽게 찾아보고,<br>
	              									    알아갈 수 있도록 정보를 제공하는 '제주시 체험관광 맛집리뷰 커뮤니티'입니다.</h7>
	              <div class="d-flex gap-3 justify-content-center lead fw-normal">
	                <a class="icon-link" href="#">
	                  Learn more >
	                  <svg class="bi"><use xlink:href="#chevron-right"></use></svg>
	                </a>
	              </div>
	            </div>
	            <div class="product-device shadow-sm d-none d-md-block"></div>
	            <div class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
	          </div>
	        </div>
          <div class="d-md-flex flex-md-equal w-100 my-md-3 ps-md-3">
            <div class="text-bg-dark me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
              <div class="my-3 py-3">
                <h2 class="display-5">리스트 1</h2>
                <p class="lead">맛집 관련 내용입니다.</p>
              </div>
              <div class="bg-body-tertiary shadow-sm mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"></div>
            </div>
            <div class="bg-body-tertiary me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
              <div class="my-3 p-3">
                <h2 class="display-5">리스트 5</h2>
                <p class="lead">맛집 관련 내용입니다.</p>
              </div>
              <div class="bg-dark shadow-sm mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"></div>
            </div>
          </div>
        
          <div class="d-md-flex flex-md-equal w-100 my-md-3 ps-md-3">
            <div class="bg-body-tertiary me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
              <div class="my-3 p-3">
                <h2 class="display-5">리스트 2</h2>
                <p class="lead">맛집 관련 내용입니다.</p>
              </div>
              <div class="bg-dark shadow-sm mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"></div>
            </div>
            <div class="text-bg-primary me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
              <div class="my-3 py-3">
                <h2 class="display-5">리스트 6</h2>
                <p class="lead">맛집 관련 내용입니다.</p>
              </div>
              <div class="bg-body-tertiary shadow-sm mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"></div>
            </div>
          </div>
        
          <div class="d-md-flex flex-md-equal w-100 my-md-3 ps-md-3">
            <div class="bg-body-tertiary me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
              <div class="my-3 p-3">
                <h2 class="display-5">리스트 3</h2>
                <p class="lead">맛집 관련 내용입니다.</p>
              </div>
              <div class="bg-body shadow-sm mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"></div>
            </div>
            <div class="bg-body-tertiary me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
              <div class="my-3 py-3">
                <h2 class="display-5">리스트 7</h2>
                <p class="lead">맛집 관련 내용입니다.</p>
              </div>
              <div class="bg-body shadow-sm mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"></div>
            </div>
          </div>
        
          <div class="d-md-flex flex-md-equal w-100 my-md-3 ps-md-3">
            <div class="bg-body-tertiary me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
              <div class="my-3 p-3">
                <h2 class="display-5">리스트 4</h2>
                <p class="lead">맛집 관련 내용입니다.</p>
              </div>
              <div class="bg-body shadow-sm mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"></div>
            </div>
            <div class="bg-body-tertiary me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
              <div class="my-3 py-3">
                <h2 class="display-5">리스트 8</h2>
                <p class="lead">맛집 관련 내용입니다.</p>
              </div>
              <div class="bg-body shadow-sm mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"></div>
            </div>
          </div>
         </main> 
        		    
        <!-- 게시판 추가사항 (Page Content) -->
	        <div class="container px-4 px-lg-5">
	            <div class="row gx-4 gx-lg-5 align-items-center my-5">
	                <div class="col-lg-7"><img class="img-fluid rounded mb-4 mb-lg-0" src="./resources/images/body.jpg" alt="메인이미지" /></div>
	                <div class="col-lg-5">
	                    <h1 class="font-weight-light">제주 맛집의 모든 것!</h1>
	                    <p>제주를 여행하는 새로운 방법,<br><strong>제주맛집(JEJUMATJIP)</strong>에서 만나보세요!<br>
	                       제주를 방문하는 여행객들의 리뷰를 통해 제주의 다양한 맛집을 한곳에서 쉽게 찾아보고, 알아갈 수 있도록 정보를 제공하는 '제주시 체험관광 맛집리뷰 커뮤니티'입니다.</p>
	                    <a class="btn btn-primary" href="#!">CLICK!</a>
	                </div>
	            </div>
	            <!-- Call to Action-->
	            <div class="card text-white bg-secondary my-5 py-4 text-center">
	                <div class="card-body"><p class="text-white m-0">This call to action card is a great place to showcase some important information or display a clever tagline!</p></div>
	            </div>
	            <!-- Content Row-->
	            <div class="row gx-4 gx-lg-5">
	                <div class="col-md-4 mb-5">
	                    <div class="card h-100">
	                        <div class="card-body">
	                        <img src="..." class="card-img-top" alt="...">
	                            <h2 class="card-title">List 1</h2>
	                            <p class="card-text">추천 맛집에 대한 내용 1</p>
	                        </div>
	                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">More Info</a></div>
	                    </div>
	                </div>
	                <div class="col-md-4 mb-5">
	                    <div class="card h-100">
	                        <div class="card-body">
	                        <img src="..." class="card-img-top" alt="...">
	                            <h2 class="card-title">List 2</h2>
	                            <p class="card-text">추천 맛집에 대한 내용 2</p>
	                        </div>
	                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">More Info</a></div>
	                    </div>
	                </div>
	                <div class="col-md-4 mb-5">
	                    <div class="card h-100">
	                    <img src="..." class="card-img-top" alt="...">
	                        <div class="card-body">
	                            <h2 class="card-title">List 3</h2>
	                            <p class="card-text">추천 맛집에 대한 내용 3</p>
	                        </div>
	                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">More Info</a></div>
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