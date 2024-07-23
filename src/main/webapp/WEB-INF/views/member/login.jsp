<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% 
    String project = "/petinnature/";
%>

<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="<%=project%>resources/images/favicon/favicon.ico">
  <head>
    <title>계정</title>
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
    <!-- script
    ================================================== -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="<%=project%>resources/js/modernizr.js"></script>
  </head>
  <body>
    <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
      <symbol id="search" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32">
        <path fill="currentColor" d="M19 3C13.488 3 9 7.488 9 13c0 2.395.84 4.59 2.25 6.313L3.281 27.28l1.439 1.44l7.968-7.969A9.922 9.922 0 0 0 19 23c5.512 0 10-4.488 10-10S24.512 3 19 3zm0 2c4.43 0 8 3.57 8 8s-3.57 8-8 8s-8-3.57-8-8s3.57-8 8-8z" />
      </symbol>
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
      <symbol xmlns="http://www.w3.org/2000/svg" id="cart-outline" viewBox="0 0 16 16">
        <path fill="currentColor" d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l.84 4.479 9.144-.459L13.89 4H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
      </symbol>
      <symbol xmlns="http://www.w3.org/2000/svg" id="quality" viewBox="0 0 16 16">
        <path fill="currentColor" d="M9.669.864 8 0 6.331.864l-1.858.282-.842 1.68-1.337 1.32L2.6 6l-.306 1.854 1.337 1.32.842 1.68 1.858.282L8 12l1.669-.864 1.858-.282.842-1.68 1.337-1.32L13.4 6l.306-1.854-1.337-1.32-.842-1.68L9.669.864zm1.196 1.193.684 1.365 1.086 1.072L12.387 6l.248 1.506-1.086 1.072-.684 1.365-1.51.229L8 10.874l-1.355-.702-1.51-.229-.684-1.365-1.086-1.072L3.614 6l-.25-1.506 1.087-1.072.684-1.365 1.51-.229L8 1.126l1.356.702 1.509.229z" />
        <path fill="currentColor" d="M4 11.794V16l4-1 4 1v-4.206l-2.018.306L8 13.126 6.018 12.1 4 11.794z" />
      </symbol>
      <symbol xmlns="http://www.w3.org/2000/svg" id="price-tag" viewBox="0 0 16 16">
        <path fill="currentColor" d="M6 4.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm-1 0a.5.5 0 1 0-1 0 .5.5 0 0 0 1 0z" />
        <path fill="currentColor" d="M2 1h4.586a1 1 0 0 1 .707.293l7 7a1 1 0 0 1 0 1.414l-4.586 4.586a1 1 0 0 1-1.414 0l-7-7A1 1 0 0 1 1 6.586V2a1 1 0 0 1 1-1zm0 5.586 7 7L13.586 9l-7-7H2v4.586z" />
      </symbol>
      <symbol xmlns="http://www.w3.org/2000/svg" id="shield-plus" viewBox="0 0 16 16">
        <path fill="currentColor" d="M5.338 1.59a61.44 61.44 0 0 0-2.837.856.481.481 0 0 0-.328.39c-.554 4.157.726 7.19 2.253 9.188a10.725 10.725 0 0 0 2.287 2.233c.346.244.652.42.893.533.12.057.218.095.293.118a.55.55 0 0 0 .101.025.615.615 0 0 0 .1-.025c.076-.023.174-.061.294-.118.24-.113.547-.29.893-.533a10.726 10.726 0 0 0 2.287-2.233c1.527-1.997 2.807-5.031 2.253-9.188a.48.48 0 0 0-.328-.39c-.651-.213-1.75-.56-2.837-.855C9.552 1.29 8.531 1.067 8 1.067c-.53 0-1.552.223-2.662.524zM5.072.56C6.157.265 7.31 0 8 0s1.843.265 2.928.56c1.11.3 2.229.655 2.887.87a1.54 1.54 0 0 1 1.044 1.262c.596 4.477-.787 7.795-2.465 9.99a11.775 11.775 0 0 1-2.517 2.453 7.159 7.159 0 0 1-1.048.625c-.28.132-.581.24-.829.24s-.548-.108-.829-.24a7.158 7.158 0 0 1-1.048-.625 11.777 11.777 0 0 1-2.517-2.453C1.928 10.487.545 7.169 1.141 2.692A1.54 1.54 0 0 1 2.185 1.43 62.456 62.456 0 0 1 5.072.56z" />
        <path fill="currentColor" d="M8 4.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V9a.5.5 0 0 1-1 0V7.5H6a.5.5 0 0 1 0-1h1.5V5a.5.5 0 0 1 .5-.5z" />
      </symbol>
      <symbol id="star-fill" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
        <path fill="currentColor" d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
      </symbol>
      <symbol id="star-empty" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
        <path fill="currentColor" d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z" />
      </symbol>
      <symbol id="star-half" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
        <path fill="currentColor" d="M5.354 5.119 7.538.792A.516.516 0 0 1 8 .5c.183 0 .366.097.465.292l2.184 4.327 4.898.696A.537.537 0 0 1 16 6.32a.548.548 0 0 1-.17.445l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256a.52.52 0 0 1-.146.05c-.342.06-.668-.254-.6-.642l.83-4.73L.173 6.765a.55.55 0 0 1-.172-.403.58.58 0 0 1 .085-.302.513.513 0 0 1 .37-.245l4.898-.696zM8 12.027a.5.5 0 0 1 .232.056l3.686 1.894-.694-3.957a.565.565 0 0 1 .162-.505l2.907-2.77-4.052-.576a.525.525 0 0 1-.393-.288L8.001 2.223 8 2.226v9.8z" />
      </symbol>
      <symbol xmlns="http://www.w3.org/2000/svg" id="plus" viewBox="0 0 24 24">
        <path fill="currentColor" d="M19 11h-6V5a1 1 0 0 0-2 0v6H5a1 1 0 0 0 0 2h6v6a1 1 0 0 0 2 0v-6h6a1 1 0 0 0 0-2Z"/>
      </symbol>
      <symbol xmlns="http://www.w3.org/2000/svg" id="minus" viewBox="0 0 24 24">
        <path fill="currentColor" d="M19 11H5a1 1 0 0 0 0 2h14a1 1 0 0 0 0-2Z"/>
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
    <section class="hero-section jarallax d-flex align-items-center justify-content-center padding-medium pb-5" style="background: url(<%=project%>resources/images/hero-img2.jpg) no-repeat;">
      <div class="hero-content">
        <div class="container">
          <div class="row">
            <div class="text-center padding-large no-padding-bottom">
              <h1>계정</h1>
              <div class="breadcrumbs">
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
     <section class="login-tabs padding-large">
      <div class="container">
        <div class="row">
          <div class="tabs-listing">
            <nav>
              <div class="nav nav-tabs d-flex justify-content-center" id="nav-tab" role="tablist">
                <button class="nav-link text-uppercase active" id="nav-sign-in-tab" data-bs-toggle="tab" data-bs-target="#nav-sign-in" type="button" role="tab" aria-controls="nav-sign-in" aria-selected="true">로그인</button>
                <button class="nav-link text-uppercase" id="nav-register-tab" data-bs-toggle="tab" data-bs-target="#nav-register" type="button" role="tab" aria-controls="nav-register" aria-selected="false">회원가입</button>
              </div>
            </nav>
            <div class="tab-content" id="nav-tabContent">
              <div class="tab-pane fade active show" id="nav-sign-in" role="tabpanel" aria-labelledby="nav-sign-in-tab">
                <div class="form-group py-3">
                <form name="frm" id='frm' method="post" action="loginform.do">
                  <label for="sign-in">아이디</label>
                  <br/>
                  <br/>
                  <input type="text" minlength="2" name="id" id="myId" placeholder="아이디를 입력해주세요" class="w-100" required>
                	<br/>
                	<br/>
                  <label for="sign-in">패스워드</label><br/>
                  <br/>
                  <input type="password" minlength="2" name="pass" id="myPass" placeholder="비밀번호를 입력해주세요" class="w-100" required>
                  <br/>
                  <div class= 'messagebox warnBox'></div>
                <br/>
                <br/>
                <button type="button" id="tryLogin" class="btn btn-dark w-100 my-3">로그인</button><br/>
                </form>
                
                
                <button type="button" name="submit" onclick="location.href='loginFind.do' " class="btn btn-primary w-100 my-3">아이디/비밀번호 찾기</button><br/>
              </div>
              </div>

              
              
              
              <div class="tab-pane fade" id="nav-register" role="tabpanel" aria-labelledby="nav-register-tab">
                <input type="checkbox" required="" id="check-all" class="d-inline">
                <label class="py-3">
                 
                  <span class="label-body">전체 동의하기 </span>
                </label><br/>
                
                  
                <label class="py-3">
                <input type="checkbox" required="" class="d-inline"/>
                  <span class="label-body">이용약관(필수) </span> &nbsp&nbsp&nbsp&nbsp&nbsp<span class="chconfirm1"></span>
                  <div class="terms_box" tabindex="0">
                  <div class="article">제1조(목적)
						이 약관은 OO 회사(전자상거래 사업자)가 운영하는 OO 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.
						※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」<br/>
							제2조(정의)
						① “몰”이란 OO 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
						② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
						③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.
						④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.<br/>
						제3조 (약관 등의 명시와 설명 및 개정)
						① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호․모사전송번호․전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 00 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
						② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회․배송책임․환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.
						③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
						④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다.  이 경우 "몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.
						⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.
						⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.
						
						</div>
						</div>
                  
               </label> <br/>
                <label class="py-3">
                  <input type="checkbox" required="" class="d-inline">
                  <span class="label-body">개인정보 수집 및 이용(필수)</span>&nbsp&nbsp&nbsp&nbsp&nbsp<span class="chconfirm2"></span>
                  <div class="terms_box" tabindex="0">
                  <div class="article">** 본 양식은 쇼핑몰 운영에 도움을 드리고자 샘플로 제공되는 서식으로 쇼핑몰 운영형태에 따른 수정이 필요합니다. 쇼핑몰에 적용하시기 전, 쇼핑몰 운영 사항 등을 확인하시고 적절한 내용을 반영하여 사용하시기 바랍니다. **<br/>								
								1. 개인정보 수집목적 및 이용목적	<br/>						
								가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산	<br/>							
								콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인 인증 및 금융 서비스<br/>								
								나. 회원 관리		<br/>						
								회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리 , 고지사항 전달<br/>
								2. 수집하는 개인정보 항목 : 이름 , 로그인ID , 비밀번호 , 이메일 , 14세미만 가입자의 경우 법정대리인의 정보<br/>								
								3. 개인정보의 보유기간 및 이용기간								<br/>
								원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.	<br/>							
								가. 회사 내부 방침에 의한 정보 보유 사유		<br/>						
								o 부정거래 방지 및 쇼핑몰 운영방침에 따른 보관 : OO년	<br/>							
								나. 관련 법령에 의한 정보보유 사유		<br/>						
								o 계약 또는 청약철회 등에 관한 기록		<br/>						
								-보존이유 : 전자상거래등에서의소비자보호에관한법률	<br/>							
								-보존기간 : 5년				<br/>				
								o 대금 결제 및 재화 등의 공급에 관한 기록	<br/>							
								-보존이유: 전자상거래등에서의소비자보호에관한법률	<br/>							
								-보존기간 : 5년			<br/>					
								o 소비자 불만 또는 분쟁처리에 관한 기록		<br/>						
								-보존이유 : 전자상거래등에서의소비자보호에관한법률	<br/>							
								-보존기간 : 3년	<br/>							
								o 로그 기록<br/>								
								-보존이유: 통신비밀보호법	<br/>							
								-보존기간 : 3개월	<br/>							
								※ 동의를 거부할 수 있으나 거부시 회원 가입이 불가능합니다.
						
						
						</div>
						</div>
						
                </label><br/>
                <label class="py-3">
                  <input type="checkbox" required="" class="d-inline">
                  <span class="label-body">쇼핑정보 수신동의(선택)</span>
                  
                   <div class="terms_box" tabindex="0">
                  <div class="article">
                  쇼핑정보 수집에 동의하시면, 이벤트 및 할인 혜택 안내를 누구보다 빠르게 받아보실 수 있어요!
                  </div>
                  </div>
                  
                </label><br/>
                <label class="py-3">
                  <input type="checkbox" required="" class="d-inline">
                  <span class="label-body">SMS수신동의</span>
                </label>
                
                <label class="py-3">
                  <input type="checkbox" required="" class="d-inline">
                  <span class="label-body">이메일수신동의</span>
 
                </label>

                <button type="button" name="submit" id="checkbtn" class="btn btn-dark w-100 my-3">다음</button>
              </div>
            </div>
          </div>
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
              <p>Â© Copyright 2023 Vaso. Design by <a href="https://templatesjungle.com/" target="_blank"><b>TemplatesJungle</b></a></p>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <script type="text/javascript" src="<%=project%>resources/js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="<%=project%>resources/js/plugins.js"></script>
    <script type="text/javascript" src="<%=project%>resources/js/script.js"></script>
    <script type="text/javascript">
    
    
    $('#check-all').click(function() {
        var isChecked = $(this).prop('checked');
        $('.d-inline').prop('checked', isChecked);

    }); 
    
    $('.d-inline').not('#check-all').click(function() {
        if (!$(this).prop('checked')) {
          $('#check-all').prop('checked', false);
        }
        
        
        
      });
    
 
    
    $('#checkbtn').click(function(){
    	var check1 = $('.d-inline').filter(':eq(1)');
    	var check2 = $('.d-inline').filter(':eq(2)');
    	if(	check1.is(":checked") 
    			&& check2.is(":checked")){
    		location.href = "regist.do";
    	}
    	else if (!check1.is(":checked")){
    		$('.chconfirm1').text("*필수체크 항목입니다");
    		
    	}if (!check2.is(":checked")){
    		$('.chconfirm2').text("*필수체크 항목입니다");
    		
    	}
    
    	
    	
    	
    });
    
    $('#tryLogin').click(function(){

        let id = $('#myId').val();
        let pass = $('#myPass').val();
        let messagebox = $('.messagebox');
        let param = {
            'id': id,
            'pass': pass,
        }
        $.ajax({
            type : "POST",
            url : "<%=project%>member/loginform.do",
            data : param,
            success : function(result){
            	if(result=="1"){
            		messagebox.text('존재하지 않는 아이디입니다.');
            	} else if(result=="2"){
            		window.location.replace(document.referrer);
            	} else {
            		messagebox.text('비밀번호가 일치하지 않습니다.');
            	}
            },
            error : function(err){
            	console.log(err);
            	location.href = "login.do";
            }
        });
    }); 

    
    </script>
    
  </body>
</html>