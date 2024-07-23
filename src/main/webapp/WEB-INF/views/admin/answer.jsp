<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>Modify Product - Dashboard do Template</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
<!-- https://fonts.google.com/specimen/Roboto -->

<link rel="stylesheet"
	href="<%=project%>resources/css/fontawesome.min.css" />
<!-- https://fontawesome.com/ -->
<link rel="stylesheet"
	href="<%=project%>resources/jquery-ui-datepicker/jquery-ui.min.css"
	type="text/css" />
<!-- http://api.jqueryui.com/datepicker/ -->
<link rel="stylesheet"
	href="<%=project%>resources/css/bootstrap.min.css" />
<!-- https://getbootstrap.com/ -->
<link rel="stylesheet"
	href="<%=project%>resources/css/templatemo-style.css">
	

<style type="text/css">

#qnalistTable td #frm #writebutton{
	
	border : 1px solid var(--black-color);
	background-color: #495057;
	border-radius: 10px;
	height : 40px;
	width : 120px;
	line-height : 20px;
	float: right;
	
}  

#qnalistTable td #frm #writebutton:hover {
	border : 1px solid var(--black-color);
	background-color: #6c757d;
	color: white;
	border-radius: 10px;
}


#qnaListTable {
color : white;
}


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

.answer-row {color:white}

.answer_content {
	width : 100%;
	height : 200px;
	resize: none;
	background:none;
	border:none;
	color:white;
}


.username {

color:white;
}



.question-row {
	height : 60px;
    border: 1px solid gray;
}

.question-row td {

    border: 1px solid gray;
}

.qnacontent-row {
    border: 1px solid gray;
    height: 150px;
    vertical-align: top;
}

.answer-row {

    border: 1px solid gray;
}

#qnalistTable th {
    border: 1px solid gray;
    text-align : center;
}
</style>


</head>

<body>
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

					<li class="nav-item"><a class="nav-link" href="products.do">
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
                            <form name="frm" id='frm' method="post" action="<%=project%>member/logout.do">
                            <span class="username">[ ${ sessionScope.membername } ]</span>&nbsp;<input type="submit" class="lgb" value="logout">
                            </form>
                        </li>
				</ul>
			</div>
		</div>

	</nav>
	<div class="container tm-mt-big tm-mb-big">
		<div class="row">
			<div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
				<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
					<div class="row" id="qnaListTable">
						<div class="col-12">
							<h2 class="tm-block-title d-inline-block">문의답변</h2>
											<table border=1 id="qnalistTable">
						<thead id='header'>
							<tr>
								<th width="80" align="center">상품번호</td>
								<th width="250" align="center">상품이름</td>
								<th width="360" align="center">제목</td>
								<th width="120" align="center">문의유형</td>
								<th width="120" align="center">작성일</td>
							</tr>
						</thead>
						<tbody id='tbd'>
						
								
								<tr class="question-row" data-question-qno="${qnalist.q_no}">
									<td align="center"><c:out value="${qnalist.product_no}" /></td>
									<td align="center"><c:out value="${qnalist.product_name}" /></td>
									<td align="center"><c:out value="${qnalist.title}" /></td>
									<td align="center"><c:out value="${qnalist.qna_type}" /></td>
									<td align="center"><c:out value="${qnalist.qdate}" /></td>
								</tr>
								<tr class="qnacontent-row">
									<td colspan="6">
										문의 내용 : <c:out value="${qnalist.content}"/>
									</td>
								</tr>
								
								
								<tr class="answer-row">
									<td colspan="6">
										답변 작성 : 
										<form name="frm" id='frm' method="post" action="writeAnswer.do">
										<input type="hidden" name="q_no" value="${qnalist.q_no}"/>
										<br/><textarea name="answer_content" class="wide-input answer_content"></textarea>
										<input type="submit" name="submit" class="writebutton" id="writebutton" value="답변 작성"/>
										</form>
									</td>
								</tr>
								<tr>
								
								
								</tr>
								
								
						</tbody>
						
					</table>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>



	<footer class="tm-footer row tm-mt-small">
		<div class="col-12 font-weight-light"></div>
	</footer>

	<script src="<%=project%>resources/js/jquery-3.3.1.min.js"></script>
	<!-- https://jquery.com/download/ -->
	<script
		src="<%=project%>resources/jquery-ui-datepicker/jquery-ui.min.js"></script>
	<!-- https://jqueryui.com/download/ -->
	<script src="<%=project%>resources/js/bootstrap.min.js"></script>
	<!-- https://getbootstrap.com/ -->

	<script type="text/javascript">
	
		</script>



</body>
</html>
