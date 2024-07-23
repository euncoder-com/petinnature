<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String project = "/petinnature/";
%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon"
	href="<%=project%>resources/images/favicon/favicon.ico">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>문의 답변 작성</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
<!-- https://fonts.google.com/specimen/Roboto -->
<link rel="stylesheet"
	href="<%=project%>resources/css/fontawesome.min.css" />
<!-- https://fontawesome.com/ -->
<link rel="stylesheet"
	href="<%=project%>resources/css/bootstrap.min.css" />
<!-- https://getbootstrap.com/ -->
<link rel="stylesheet"
	href="<%=project%>resources/css/templatemo-style.css">
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
	color: white;
}
</style>

<!--
        Product Admin CSS Template
        https://templatemo.com/tm-524-product-admin
        -->
</head>

<body id="reportsPage">
	<div class="" id="home">
		<nav class="navbar navbar-expand-xl">
			<div class="container h-100">
				<a class="navbar-brand" href="<%=project%>index2.do">
					<h1 class="tm-site-title mb-0">
						<img src="/petinnature/resources/images/main-logo.png">
					</h1>
				</a>
				<button class="navbar-toggler ml-auto mr-0" type="button"
					data-toggle="collapse" data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<i class="fas fa-bars tm-nav-icon"></i>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mx-auto h-100">

						<li class="nav-item"><a class="nav-link" href="dashboard.do">
								<i class="fa fa-chart-bar"></i> 차트
						</a></li>
						<li class="nav-item"><a class="nav-link" href="products.do">
								<i class="fa fa-cart-arrow-down"></i> 상품
						</a></li>

						<li class="nav-item"><a class="nav-link" href="order.do">
								<i class="fa fa-car"></i> 주문
						</a></li>
						<li class="nav-item"><a class="nav-link" href="accounts.do">
								<i class="fa fa-user"></i> 회원
						</a></li>
						                        <li class="nav-item">
                            <a class="nav-link" href="qna.do">
                                <i class="fa fa-question-circle"></i>
                                문의
                            </a>
                        </li>
						<li class="nav-item dropdown">
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="#">Profile</a> <a
									class="dropdown-item" href="#">Billing</a> <a
									class="dropdown-item" href="#">Customize</a>
							</div>
						</li>
					</ul>
					<ul class="navbar-nav">
						<li class="nav-item">
							<form name="frm" id='frm' method="post"
								action="<%=project%>member/logout.do">
								<span class="username">[ ${ sessionScope.membername } ]</span>&nbsp;<input
									type="submit" class="lgb" value="logout">
							</form>
						</li>
					</ul>
				</div>
			</div>

		</nav>
		<div class="container mt-5">
			<!-- row -->
			
			<div class="row tm-content-row">
				<div class="tm-block-col tm-col-account-settings_eun">
					<div class="tm-bg-primary-dark tm-block tm-block-settings">
						<h2 class="tm-block-title">상품문의</h2>
						<table class="table">
							<thead>
								<tr>
									<td width="100" align="center">상품번호</td>
									<td width="250" align="center">상품이름</td>
									<td width="360" align="center">제목</td>
									<td width="120" align="center">문의유형</td>
									<td width="120" align="center">작성일</td>
									<td width="120" align="center">처리상태</td>
								</tr>
							</thead>
							<tbody>
							<tbody id='tbd'>

								<c:forEach var="qna" items="${qnalist}">
									<tr id="qnaRow_${qna.qNo}" class="qna-row" data-qno="${qna.qNo}" data-process="${qna.process}">
										<td width="100" align="center">${qna.productNo}</td>
										<td width="250" align="center">${qna.productName}</td>
										<td width="360" align="center">${qna.title}</td>
										<td width="120" align="center">${qna.qnaType}</td>
										<td width="120" align="center">${qna.qdate}</td>
										<td width="120" align="center">${qna.process}</td>
									</tr>
								</c:forEach>
						</tbody>
						  <tfoot id='footer'>
            <tr>
                        <td colspan='6' align="center">
                        	<c:forEach begin="1" end="${totalPage}" var="page">
                              <c:choose>
                                 <c:when test="${page == currentPage}">
                                    <strong>${page}</strong>
                                 </c:when>
                                 <c:otherwise>
                                    <c:if test="${page <= totalPage}">
                                       <a href="?pageNum=${page}">${page}</a>
                                    </c:if>
                                 </c:otherwise>
                              </c:choose>
                              <c:if test="${page != totalPage}"> | </c:if>
                           </c:forEach></td>
                     </tr>
            </tfoot>
						</table>

					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<script src="<%=project%>resources/js/jquery-3.3.1.min.js"></script>
	<!-- https://jquery.com/download/ -->
	<script src="<%=project%>resources/js/bootstrap.min.js"></script>
	<!-- https://getbootstrap.com/ -->


	<script>

    document.addEventListener("DOMContentLoaded", function() {
        const rows = document.querySelectorAll(".qna-row");
        rows.forEach(row => {
            const process = row.dataset.process;
            if (process !== "처리완료") {
            	

                row.addEventListener("click", function() {
                    const qNo = row.dataset.qno;
                    window.location.href = "answer.do?qNo=" + qNo;
                });
            }
        });
    });
</script>
</body>
</html>
