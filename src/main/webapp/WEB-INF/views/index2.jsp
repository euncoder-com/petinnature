<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="javax.servlet.http.HttpSession"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<% 
    String project = "/petinnature/";
%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="<%=project%>resources/images/favicon/favicon.ico">
  <head>
    <title>펫인네이처</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="author" content="">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="stylesheet" type="text/css" href="<%=project%>resources/css/vendor.css">
    <link rel="stylesheet" type="text/css" href="<%=project%>resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=project%>resources/css/style.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Italiana&family=Mulish:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;0,1000;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900;1,1000&display=swap" rel="stylesheet">
    
    <style type="text/css">
    
      .hero-section {
            position: relative;
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: none; /* 배경 이미지 제거 */
            overflow: hidden; /* 섹션에서 초과된 부분을 숨김 */
        }

        .video-container {
            position: relative;
            width: 100%;
            height: 100%;
            overflow: hidden; /* 컨테이너에서 초과된 부분을 숨김 */
        }

        .video-container iframe {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 100%;
            height: 100%;
            transform: translate(-50%, -50%) scale(1.5); /* 스케일을 조정하여 컨테이너를 완전히 채우도록 함 */
        }
    
    </style>
    
    
    
    <!-- script
    ================================================== -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="<%=project%>resources/js/modernizr.js"></script>
  
  
  </head>
  <body>
    <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
      <symbol xmlns="http://www.w3.org/2000/svg" id="angle-right" viewBox="0 0 32 32">
        <path fill="currentColor" d="M12.969 4.281L11.53 5.72L21.812 16l-10.28 10.281l1.437 1.438l11-11l.687-.719l-.687-.719z"/>
      </symbol>
      <symbol xmlns="http://www.w3.org/2000/svg" id="angle-left" viewBox="0 0 32 32">
        <path fill="currentColor" d="m19.031 4.281l-11 11l-.687.719l.687.719l11 11l1.438-1.438L10.187 16L20.47 5.719z"/>
      </symbol>
      <symbol xmlns="http://www.w3.org/2000/svg" id="chevron-down" viewBox="0 0 24 24">
        <path fill="currentColor" d="M7.41 8.58L12 13.17l4.59-4.59L18 10l-6 6l-6-6l1.41-1.42Z"/>
      </symbol>
      <symbol xmlns="http://www.w3.org/2000/svg" id="arrow-right" viewBox="0 0 32 32">
        <path fill="currentColor" d="M18.719 6.781L17.28 8.22L24.063 15H4v2h20.063l-6.782 6.781l1.438 1.438l8.5-8.5l.687-.719l-.687-.719z"/>
      </symbol>
      <symbol xmlns="http://www.w3.org/2000/svg" id="arrow-left" viewBox="0 0 32 32">
        <path fill="currentColor" d="m13.281 6.781l-8.5 8.5l-.687.719l.687.719l8.5 8.5l1.438-1.438L7.938 17H28v-2H7.937l6.782-6.781z"/>
      </symbol>
      <symbol xmlns="http://www.w3.org/2000/svg" id="play" viewBox="0 0 24 24">
        <path fill="currentColor" d="M8 5.14v14l11-7l-11-7Z"/>
      </symbol>
      <symbol xmlns="http://www.w3.org/2000/svg" id="facebook" viewBox="0 0 24 24">
        <path fill="currentColor" d="M9.198 21.5h4v-8.01h3.604l.396-3.98h-4V7.5a1 1 0 0 1 1-1h3v-4h-3a5 5 0 0 0-5 5v2.01h-2l-.396 3.98h2.396v8.01Z" />
      </symbol>
      <symbol xmlns="http://www.w3.org/2000/svg" id="youtube" viewBox="0 0 32 32">
        <path fill="currentColor" d="M29.41 9.26a3.5 3.5 0 0 0-2.47-2.47C24.76 6.2 16 6.2 16 6.2s-8.76 0-10.94.59a3.5 3.5 0 0 0-2.47 2.47A36.13 36.13 0 0 0 2 16a36.13 36.13 0 0 0 .59 6.74a3.5 3.5 0 0 0 2.47 2.47c2.18.59 10.94.59 10.94.59s8.76 0 10.94-.59a3.5 3.5 0 0 0 2.47-2.47A36.13 36.13 0 0 0 30 16a36.13 36.13 0 0 0-.59-6.74ZM13.2 20.2v-8.4l7.27 4.2Z" />
      </symbol>
      <symbol xmlns="http://www.w3.org/2000/svg" id="twitter" viewBox="0 0 256 256">
        <path fill="currentColor" d="m245.66 77.66l-29.9 29.9C209.72 177.58 150.67 232 80 232c-14.52 0-26.49-2.3-35.58-6.84c-7.33-3.67-10.33-7.6-11.08-8.72a8 8 0 0 1 3.85-11.93c.26-.1 24.24-9.31 39.47-26.84a110.93 110.93 0 0 1-21.88-24.2c-12.4-18.41-26.28-50.39-22-98.18a8 8 0 0 1 13.65-4.92c.35.35 33.28 33.1 73.54 43.72V88a47.87 47.87 0 0 1 14.36-34.3A46.87 46.87 0 0 1 168.1 40a48.66 48.66 0 0 1 41.47 24H240a8 8 0 0 1 5.66 13.66Z" />
      </symbol>
      <symbol xmlns="http://www.w3.org/2000/svg" id="instagram" viewBox="0 0 256 256">
        <path fill="currentColor" d="M128 80a48 48 0 1 0 48 48a48.05 48.05 0 0 0-48-48Zm0 80a32 32 0 1 1 32-32a32 32 0 0 1-32 32Zm48-136H80a56.06 56.06 0 0 0-56 56v96a56.06 56.06 0 0 0 56 56h96a56.06 56.06 0 0 0 56-56V80a56.06 56.06 0 0 0-56-56Zm40 152a40 40 0 0 1-40 40H80a40 40 0 0 1-40-40V80a40 40 0 0 1 40-40h96a40 40 0 0 1 40 40ZM192 76a12 12 0 1 1-12-12a12 12 0 0 1 12 12Z" />
      </symbol>
      <symbol xmlns="http://www.w3.org/2000/svg" id="linkedin" viewBox="0 0 24 24">
        <path fill="currentColor" d="M6.94 5a2 2 0 1 1-4-.002a2 2 0 0 1 4 .002zM7 8.48H3V21h4V8.48zm6.32 0H9.34V21h3.94v-6.57c0-3.66 4.77-4 4.77 0V21H22v-7.93c0-6.17-7.06-5.94-8.72-2.91l.04-1.68z" />
      </symbol>
    </svg>
    
    <div id="preloader">
      <div id="loader"></div>
    </div>
      <header id="header" class="site-header">
      <nav id="header-nav" class="navbar navbar-expand-lg px-3">
        <div class="container">
          <a class="navbar-brand d-lg-none" href="/petinnature/index.do">
            <img src="<%=project%>resources/images/main-logo.png" class="logo">
          </a>
          <button class="navbar-toggler d-flex d-lg-none order-3 p-2" type="button" data-bs-toggle="offcanvas" data-bs-target="#bdNavbar" aria-controls="bdNavbar" aria-expanded="false" aria-label="Toggle navigation">Menu</button>
          <div class="offcanvas offcanvas-end" tabindex="-1" id="bdNavbar" aria-labelledby="bdNavbarOffcanvasLabel">
            <div class="offcanvas-header px-4 pb-0">
              <a class="navbar-brand" href="/petinnature/index.do">
                <img src="<%=project%>resources/images/main-logo.png" class="logo">
              </a>
              <button type="button" class="btn-close btn-close-black" data-bs-dismiss="offcanvas" aria-label="Close" data-bs-target="#bdNavbar"></button>
            </div>
            <div class="offcanvas-body">
              <ul id="navbar" class="navbar-nav w-100 d-flex justify-content-between align-items-center">
                
                <ul class="list-unstyled d-lg-flex justify-content-md-between align-items-center">
                  <li class="nav-item">
                    <a class="nav-link ms-0" href="<%=project%>shopping/dogmain.do">강아지</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link ms-0" href="<%=project%>shopping/catmain.do">고양이</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link ms-0" href="<%=project%>gallery.do">갤러리</a>
                  </li>                  
                </ul>
                
                <a class="navbar-brand d-none d-lg-block me-0" href="<%=project%>index2.do">
                  <img src="<%=project%>resources/images/main-logo.png" class="logo">
                </a>

                <ul class="list-unstyled d-lg-flex justify-content-between align-items-center" id="login_mypage_cart">
                  <li class="nav-item search-item">
                    <div id="search-bar accountpage" class="border-right d-none d-lg-block">
                        <span id="search" class="text-dark" name="search"/>
                        <% if (session.getAttribute("logname") == null) { %>
                        <a type="submit" class="nav-link me-0" href="<%=project%>member/login.do">계정</a>
                        <% } else {%>
                        <a type="submit" class="nav-link me-0" href="<%=project%>index2.do">계정</a>
                        <% }%>
                    </div>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link me-0" href="<%=project%>mypage/mypage_memberinfo.do">마이페이지</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link me-0" href="<%=project%>shopping/cart.do">장바구니</a>
                  </li>
                </ul>
              </ul>
            </div>
          </div>
        </div>
      </nav>
    </header>
    <section id="billboard" class="position-relative overflow-hidden">
      <div class="swiper main-swiper">
        <div class="swiper-wrapper">
          <div class="swiper-slide" style="background-image: url(<%=project%>resources/images/mainimage2.jpg); background-size: 100%; background-repeat: no-repeat; height: 650px; background-position: center;">
            <div class="container ">
              <div class="row">
                <div class="offset-md-1 col-md-6">
                  <div class="banner-content">
                    <h2></h2>
                    <p class="fs-3"></p>
                  </div>
                </div>
                <div class="col-md-5"></div>
              </div>
            </div>
          </div>
          <div class="swiper-slide" style="background-image: url(<%=project%>resources/images/banner-image1.jpg); background-size: 100%; background-repeat: no-repeat; height: 650px; background-position: center;">
            <div class="container">
              <div class="row">
                <div class="offset-md-6 col-md-6">
                  <div class="banner-content">
                    <h2></h2>
                    <p class="fs-3"></p>
                  </div>
                </div>
                <div class="col-md-5"></div>
              </div>
            </div>
          </div>
          <div class="swiper-slide" style="background-image: url(<%=project%>resources/images/banner-image.jpg); background-size: 100%; background-repeat: no-repeat; height: 650px; background-position: center;">
            <div class="container">
              <div class="row">
                <div class="offset-md-1 col-md-6">
                  <div class="banner-content">
                    <h2></h2>
                    <p class="fs-3"></p>
                  </div>
                </div>
                <div class="col-md-5"></div>
              </div>
            </div>
          </div>
        </div>
        <div class="main-slider-pagination position-absolute text-center"></div>
      </div>
    </section>
    <section id="about" class="padding-xlarge">
      <div class="container">
        <div class="row">
          <div class="offset-md-2 col-md-8">
            <span class="title-accent fs-6 text-uppercase" data-aos="fade" data-aos-easing="ease-in" data-aos-duration="1000" data-aos-once="true">About us</span>
            <h3 class="py-3" data-aos="fade" data-aos-easing="ease-in" data-aos-duration="1500" data-aos-once="true">자연에 안긴 반려동물</h3>
            <p data-aos="fade" data-aos-easing="ease-in" data-aos-duration="1800" data-aos-once="true">펫인네이처는 다양한 반려동물 용품을 안심하고 구매할 수 있고,
처음 반려동물을 키우는 반려인들에게 길잡이가 될 수 있는 환경을 구축하였습니다. 사랑스러운 반려동물을 안정감 있게 키우며 반려인들에게 기쁨과 감동을 선사할 수 있는, 새로운 패러다임을 제시합니다.</p>
          </div>
        </div>
      </div>
    </section>
    <section id="products" class="product-store position-relative">
      <div class="container display-header d-flex flex-wrap justify-content-between pb-4">
        <h3 class="mt-3">MD 추천 상품</h3>
        <div class="btn-right d-flex flex-wrap align-items-center">
          <div class="swiper-buttons">
            <button class="swiper-prev product-carousel-prev me-2">
              <svg width="41" height="41"><use xlink:href="#angle-left"></use></svg>
            </button>
            <button class="swiper-next product-carousel-next">
              <svg width="41" height="41"><use xlink:href="#angle-right"></use></svg>
            </button>
          </div>
        </div>
      </div>
      
      <div class="swiper product-swiper">
      <div class="swiper-wrapper">
      
      <c:forEach items="${productlist}" var="vo">
            
             
	                <div class="swiper-slide recom-products">
	                  <div class="product-card position-relative">
	                  <div class="image-holder zoom-effect">
	                    <img src="<%=project%>resources/images/${vo.product_img}" alt="${vo.product_no}" class="img-fluid zoom-in pdimglist">
	                    <div class="cart-concern position-absolute">
	                    </div>
	                  </div>
	                  <div class="card-detail text-center pt-3 pb-2">
	                    <h5 class="card-title fs-3 text-capitalize">
	                      <a href="/petinnature/shopping/single-product.do?productNo=${vo.product_no}">${vo.product_name}</a>
	                    </h5>
	                    <span class="item-price text-primary fs-3 fw-light">${vo.product_price}</span>
	                  </div>
	                </div>
	             </div>

              
              </c:forEach>
</div>
</div>


    </section>
    
    <section id="faqs" class="padding-xlarge">
      <div class="container">
        <div class="row">
          <div class="offset-md-2 col-md-8">
            <h3 class="text-center mb-5" data-aos="fade" data-aos-easing="ease-in" data-aos-duration="1000" data-aos-once="true">Some FAQs</h3>
            <div class="accordion accordion-flush" id="accordionFlush" data-aos="fade" data-aos-easing="ease-in" data-aos-duration="1500" data-aos-once="true">
              <div class="accordion-item">
                <h4 class="accordion-header" id="flush-headingOne3">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="true" aria-controls="flush-collapseOne">
                    회원탈퇴는 어떻게 하나요?
                  </button>
                </h4>
                <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                  <div class="accordion-body">
                    <p>탈퇴는 마이페이지 > 회원정보에서 직접 신청해주셔야 합니다. 탈퇴 후 탈퇴 아이디로는 재가입이 불가능합니다.</p>
                  </div>
                </div>
              </div>
      
              <div class="accordion-item">
                <h4 class="accordion-header" id="flush-headingTwo3">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="true" aria-controls="flush-collapseTwo">
                    아이디와 비밀번호가 기억나지 않아요.
                  </button>
                </h4>
                <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
                  <div class="accordion-body">
                    <p>로그인 화면에서 아이디/비밀번호 찾기를 통해 확인 가능합니다.</p>
                  </div>
                </div>
              </div>
              <div class="accordion-item">
                <h4 class="accordion-header" id="flush-headingFour3">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="true" aria-controls="flush-collapseFour">
                    주문을 취소하고 싶어요.
                  </button>
                </h4>
                <div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
                  <div class="accordion-body">
                    <p>주문 후 주문 상태에 따라 마이페이지 > 주문내역에서 취소 요청이 가능합니다.</p>
                  </div>
                </div>
              </div>
      
              <div class="accordion-item">
                <h4 class="accordion-header" id="flush-headingFive3">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFive" aria-expanded="true" aria-controls="flush-collapseFive">
                    환불 금액은 언제 입금되나요?
                  </button>
                </h4>
                <div id="flush-collapseFive" class="accordion-collapse collapse" aria-labelledby="flush-headingFive" data-bs-parent="#accordionFlushExample">
                  <div class="accordion-body">
                    <p>결제했던 수단으로 환불이 진행되며 카드 결제의 경우 카드사에 따라 환불 기간이 다를 수 있습니다. 보통 1일에서 3일 정도 소요됩니다.</p>
                  </div>
                </div>
              </div>
      
            </div>      
          </div>
        </div>
      </div>
    </section>    
    <section id="banner" data-aos="fade" data-aos-once="true">
      <div class="banner-content-1 position-relative">
        <div class="video-container" id="player-container">
            <div id="player"></div>
          <h2></h2>
        </div>
      </div>

      <div class="banner-content-2 position-relative" style="background:url('<%=project%>resources/images/cat2.jpg') no-repeat left; background-size: cover; height: 100%;">
        <div class="banner-content-text position-absolute" data-aos="fade" data-aos-delay="1000" data-aos-easing="ease-in" data-aos-duration="1000" data-aos-once="true">
          <h2></h2>
        </div>
      </div>
      <div class="banner-content-3 position-relative" style="background:url('<%=project%>resources/images/mainimage4.jpg') no-repeat left; background-size: cover; height: 100%;">
        <div class="banner-content-text position-absolute" data-aos="fade" data-aos-delay="1000" data-aos-easing="ease-in" data-aos-duration="1000" data-aos-once="true">
          <h2></h2>
        </div>
      </div>
    </section>
    <footer id="footer" class="overflow-hidden padding-xlarge pb-0">
      <div class="container">
        <div class="row">
          <div class="footer-top-area pb-5">
            <div class="row d-flex flex-wrap justify-content-between">
              <div class="col-lg-3 col-sm-6 pb-3" data-aos="fade" data-aos-easing="ease-in" data-aos-duration="1000" data-aos-once="true">
                <div class="footer-menu">
                  <img src="<%=project%>resources/images/main-logo.png" alt="logo" class="mb-2">
                  <p>불안한 한숨 대신 내쉰 새 숨,<br/> 자연에 안긴 반려동물</p>
                </div>
              </div>
              <div class="col-lg-2 col-sm-6 pb-3" data-aos="fade" data-aos-easing="ease-in" data-aos-duration="1200" data-aos-once="true">
                <div class="footer-menu">
                  <h4 class="widget-title pb-2">쇼핑</h4>
                  <ul class="menu-list list-unstyled">
                    <li class="menu-item pb-2">
                      <a href="<%=project%>shopping/dogmain.do">강아지</a>
                    </li>
                    <li class="menu-item pb-2">
                      <a href="<%=project%>shopping/catmain.do">고양이</a>
                    </li>
                  </ul>
                </div>
              </div>
              <div class="col-lg-3 col-sm-6 pb-3" data-aos="fade" data-aos-easing="ease-in" data-aos-duration="1400" data-aos-once="true">
                <div class="footer-menu contact-item">
                  <h4 class="widget-title pb-2">Contact info</h4>
                  <ul class="menu-list list-unstyled">
                    <li class="menu-item pb-2">
                      서울 마포구 백범로 23 3층
                    </li>
                    <li class="menu-item pb-2">
                      02-739-7235
                    </li>
                    <li class="menu-item pb-2">
                      petinnature@atosoft.com
                    </li>
                  </ul>
                </div>
              </div>
  <div class="col-lg-3 col-sm-6 pb-3" data-aos="fade" data-aos-easing="ease-in" data-aos-duration="1600" data-aos-once="true">
                <div class="footer-menu">
                  <h4 class="widget-title pb-2">ADMIN</h4>
                  <p></p>
                  <div class="social-links">
                    <ul class="d-flex list-unstyled">
                      <li>
                        <a href="<%=project%>admin/dashboard.do">
                          관리자 페이지
                        </a>
                        <br/>
                        <br/>
                        <% if (session.getAttribute("logname") != null) { %>
                        <h5>[ ${ sessionScope.membername } ] 님, 로그인.</h5>
                        <br/>
                        <form name="frm" id='frm' method="post" action="<%=project%>member/logout.do">
                        <input type="submit" value="로그아웃">
                        </form>
                         <% } %>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <hr>
      </div>
    </footer>
    <div id="footer-bottom">
      <div class="container">
        <div class="row d-flex flex-wrap justify-content-between">
          <div class="col-12">
            <div class="copyright">
              <p>© Copyright 2023 Vaso. Design by <a href="https://templatesjungle.com/" target="_blank"><b>TemplatesJungle</b></a></p>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Video Popup -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">

          <div class="modal-content">
            
              <div class="modal-body">
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"><svg class="bi" width="40" height="40"><use xlink:href="#close-sharp"></use></svg></button>
                  <div class="ratio ratio-16x9">
                    <iframe class="embed-responsive-item" src="" id="video"  allowscriptaccess="always" allow="autoplay"></iframe>
                  </div>
              </div>

          </div>

      </div>
    </div>
    <script type="text/javascript" src="<%=project%>resources/js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="<%=project%>resources/js/plugins.js"></script>
    <script type="text/javascript" src="<%=project%>resources/js/script.js"></script>
    <script type="text/javascript">
    $('.recom-products').on('click','img',function(){
    	location = "/petinnature/shopping/single-product.do?productNo="+$(this).attr('alt');
    });
    
    $('.pdimglist').css('cursor','pointer');
    
    var tag = document.createElement('script');
    tag.src = "https://www.youtube.com/iframe_api";
    var firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

    var player;
    function onYouTubeIframeAPIReady() {
        player = new YT.Player('player', {
            height: '100%',
            width: '100%',
            videoId: 'NTnPzSKDKnU',
            playerVars: {
                'autoplay': 1,
                'mute': 1,
                'controls': 0,
                'modestbranding': 1,
                'rel': 0,
                'showinfo': 0,
                'disablekb': 1,
                'fs': 0,
                'iv_load_policy': 3,
                'suggestedQuality': 'hd1080' 
            },
            events: {
                'onReady': onPlayerReady,
                'onStateChange': onPlayerStateChange
            }
        });
    }

    function onPlayerReady(event) {
        event.target.playVideo();
    }

    function onPlayerStateChange(event) {
        if (event.data == YT.PlayerState.PLAYING) {
            var iframe = document.getElementById("player");
            iframe.style.pointerEvents = 'none'; // Disable pointer events to prevent pausing
        }
    }

    </script>
  </body>
</html>