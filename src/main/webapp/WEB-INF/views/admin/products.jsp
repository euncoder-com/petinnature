<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% 
    String project = "/petinnature/";
%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="<%=project%>resources/images/favicon/favicon.ico">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Product Page - Admin do Template</title>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Roboto:400,700"
    />
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href="<%=project%>resources/css/fontawesome.min.css" />
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="<%=project%>resources/css/bootstrap.min.css" />
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="<%=project%>resources/css/templatemo-style.css">
           <style type="text/css">


	.lgb {
            background-color: #495057; /* 어두운 회색 배경색 */
            color: white; /* 흰색 글자 */
            border: none;
            padding: 6px 12px;
            font-size: 12px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s; /* 부드러운 애니메이션 */
        }

        .lgb:hover {
            background-color: #6c757d; /* 밝은 회색 */
            transform: scale(1.05); /* 살짝 확대 */
        }

        .lgb:active {
            background-color: #495057;
            transform: scale(0.95); /* 살짝 축소 */
        }

.username {

color:white;
}

</style>
    <!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
  </head>

  <body id="reportsPage">
<nav class="navbar navbar-expand-xl">
  <div class="container h-100">
    <a class="navbar-brand" href="<%=project%>index2.do">
      <h1 class="tm-site-title mb-0"><img src="/petinnature/resources/images/main-logo.png"></h1>
    </a>
    <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <i class="fas fa-bars tm-nav-icon"></i>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mx-auto h-100">

        <li class="nav-item">
          <a class="nav-link" href="dashboard.do">
            <i class="fa fa-chart-bar"></i>
            차트
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="products.do">
            <i class="fa fa-cart-arrow-down"></i>
            상품
          </a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="order.do">
            <i class="fa fa-car"></i>
            주문
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="accounts.do">
            <i class="fa fa-user"></i>
            회원
          </a>
        </li>
                                <li class="nav-item">
                            <a class="nav-link" href="qna.do">
                                <i class="fa fa-question-circle"></i>
                                문의
                            </a>
                        </li>
        <li class="nav-item dropdown">
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="#">Profile</a>
            <a class="dropdown-item" href="#">Billing</a>
            <a class="dropdown-item" href="#">Customize</a>
          </div>
        </li>
      </ul>
      <ul class="navbar-nav">
        <li class="nav-item">
                            <form name="frm" id='frm' method="post" action="<%=project%>member/logout.do">
                           <span class="username">[ ${ sessionScope.membername } ]</span>&nbsp;<input type="submit" class="lgb" value="logout">
                            </form>
                        </li>
      </ul>
    </div>
  </div>

</nav>
    <div class="container mt-5">
      <div class="row tm-content-row">
        <div class="col-sm-12 col-md-12 col-lg-8 col-xl-12 tm-block-col">
          <div class="tm-bg-primary-dark tm-block tm-block-products">
            
             <form id="productForm" method="post">
            <div class="tm-product-table-container">
                <!-- Product Table -->
                    
                <table id="productTable" class="table table-hover tm-table-small tm-product-table">
                  <!-- Table Head -->
                <thead>
                <h1 class="tm-block-title d-inline-block">상품목록</h1>
                </thead>
                <table class="table">
                  <thead>
                  <tr>
               
                    <th scope="col">상품번호</th>
                    <th scope="col">상품이름</th>
                    <th scope="col">상품단가</th>
                    <th scope="col">재고현황</th>
                  </tr>
                  </thead>
                  <!-- Table Body -->
                  
                  <tbody>
                  <!-- Table Rows -->
                  <!-- list = [1, 2, 3, 4] -->
                  
                  <c:forEach var='vo' items='${list}'>

                  <tr data-pno="${vo.productNo}" class="product-row" >
                  
                    <td><b>${vo.productNo}</b></td>
                    <td scope="row"><b>${vo.productName}</b></td>
                    <td><b>${vo.productPrice}원</b></td>
                    <td><b>${vo.productCnt}개</b></td>
                  </tr>

                  </c:forEach>
                  
                  </tbody>
                </table>
              </table>
          
            </div>
            <!-- table container -->
            <a href="add-product.do" class="btn btn-primary w-100 my-3">상품등록</a>


  </form>
<form method='get' action="products.do">
        <div h1 class="tm-block-title" style="text-align:center;">
          상품검색
            <input type="text" size="30" id="name" name="productName" value="${productName}">
          <input type="submit" id="search" name="search" class="btn btn-primary-eun btn-block mx-auto" value="검색" style="padding: 5px;">
        </div>
        </form>

          </div>
        </div>
      </div>
    </div>
    <footer class="tm-footer row tm-mt-small">
      <div class="col-12 font-weight-light">
      </div>
    </footer>

    <script src="<%=project%>resources/js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="<%=project%>resources/js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
    <script>
  

      // 삭제 버튼 클릭 시
    

      $(".product-row").on("click", function() {

    	  
    	  var pno = $(this).data('pno');
    	  window.location.href='modify.do?pno='+pno;

        });

      $('.product-row').css('cursor','pointer');
      
      
    </script>
  </body>
</html>