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



#description {
	height: 150px;
	resize: none;
}


.username {

color:white;
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
					<div class="row">
						<div class="col-12">
							<h2 class="tm-block-title d-inline-block">상품수정</h2>
						</div>
					</div>
					<form action="modify-product.do" class="tm-edit-product-form" method="post" novalidate enctype="multipart/form-data">
						<div class="row tm-edit-product-row">

						<input type="hidden" name="origin_cate_no" value="${productTypeInfo[0].cate_no}">
						<input type="hidden" name="product_no" value="${productTypeInfo[0].product_no}">
							<div class="col-12">


								<div class="form-group col-12">
									<label for="product_name">상품명 </label> <input id="name" name="product_name"
										type="text" value="${productTypeInfo[0].product_name}"
										class="form-control validate" required />
								</div>
								<div class="form-group col-12">
									<label for="product_content">상품설명</label>
									<textarea id="description" class="form-control validate" name="product_content"
										rows="3" required>${productTypeInfo[0].product_content}</textarea>
								</div>

								<div class="form-group col-12">
									<label for="category">펫 카테고리</label> <select
										class="custom-select-eun tm-select-accounts" id="pet_cate"
										name="pet_cate">
										<option selected value="default">펫 카테고리</option>
										<option value="1" ${productTypeInfo[0].pet_cate == 1 ? "selected" : ''}>강아지</option>
										<option value="2" ${productTypeInfo[0].pet_cate == 2 ? "selected" : ''}>고양이</option>
									</select>
								</div>
								<div class="row">

									<div class="form-group col-12">
										<label for="big_cate">세부 카테고리</label> <select
											class="custom-select-eun tm-select-accounts" id="big_cate"
											name="big_cate">

											<option selected value="default">대분류</option>
											<option value="3" ${productTypeInfo[0].big_cate == 3 ? "selected" : ''}>사료</option>
											<option value="4" ${productTypeInfo[0].big_cate == 4 ? "selected" : ''}>간식</option>
											<option value="5" ${productTypeInfo[0].big_cate == 5 ? "selected" : ''}>장난감</option>

										</select>
									</div>


									


									<div class="form-group col-12">
										<label for="small_cate" id="small_cate_label">소분류</label>
										<select class="custom-select-eun tm-select-accounts" id="cate"
											name="cate_no">

										</select>

									</div>

								</div>

								<div class="form-group col-12">
									<label for="name">상품 단가 </label> <input id="price"
										name="product_price" type="text" class="form-control validate"
										value="${productTypeInfo[0].product_price}" required="">
								</div>
								<div class="form-group col-12">
									<label for="name">상품 재고 </label> <input id="cnt"
										name="product_cnt" type="text" class="form-control validate"
										value="${productTypeInfo[0].product_cnt}" required="">
								</div>

							
							</div>



						</div>
						<div class="col-12">
							<input type="submit" class="btn btn-primary w-100 my-3" value="상품수정">
								

						</div>
					</form>





					<br />

					<div class="row">
<input type="hidden" id="big_cate_value" value="${productBrandInfo[0].big_cate}">
<input type="hidden" id="small_cate_value" value="${productBrandInfo[0].small_cate}">

						<div class="brandcheck form-group col-12">
						
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
		document
				.addEventListener(
						"DOMContentLoaded",
						function(event) {
						
							var big_cate = document.getElementById("big_cate_value").value;
							var small_cate = document.getElementById("small_cate_value").value;


						    if (big_cate == 3 && (small_cate == 6 || small_cate == 7)) {

						        var form = document.createElement("form");
						        form.setAttribute("action", "modify-brand.do");
						        form.setAttribute("class", "tm-edit-product-form");

						        var hiddenInputs = [
						            { name: "small_cate", value: "${productBrandInfo[0].small_cate}" },
						            { name: "product_no", value: "${productBrandInfo[0].product_no}" },
						            { name: "origin_cate_no", value: "${productBrandInfo[0].cate_no}" }
						        ];
						        hiddenInputs.forEach(function(input) {
						            var hiddenInput = document.createElement("input");
						            hiddenInput.setAttribute("type", "hidden");
						            hiddenInput.setAttribute("name", input.name);
						            hiddenInput.setAttribute("value", input.value);
						            form.appendChild(hiddenInput);
						        });

						        // 폼 내부의 label 요소 추가
						        var label = document.createElement("label");
						        label.setAttribute("for", "category");
						        label.textContent = "사료 브랜드 수정";
						        form.appendChild(label);

						        // 폼 내부의 select 요소 추가
						        var select = document.createElement("select");
						        select.setAttribute("class", "custom-select-eun tm-select-accounts");
						        select.setAttribute("id", "cate_brand");
						        select.setAttribute("name", "cate_no");
						        form.appendChild(select);

						        // 폼 내부의 submit input 요소 추가
						        var submitInput = document.createElement("input");
						        submitInput.setAttribute("type", "submit");
						        submitInput.setAttribute("class", "btn btn-primary w-100 my-3");
						        submitInput.setAttribute("value", "브랜드 수정");
						        form.appendChild(submitInput);

						        // brandcheck 요소에 폼 추가
						        var brandcheck = document.querySelector(".brandcheck");
						        brandcheck.appendChild(form);
						    
						    
						    
						        function handleBrandChange() {
									
									var pet_cate_brand = document
									.getElementById('pet_cate').value;
									var cate_brand = document
									.getElementById('cate_brand');
									cate_brand.innerHTML = '';
									
									switch (pet_cate_brand) {

									case '1':
										
										cate_brand.innerHTML = '<option selected value="default">브랜드</option><option value="10" ${productBrandInfo[0].cate_no == 10 ? "selected" : ''}>오리젠</option><option value="11" ${productBrandInfo[0].cate_no == 11 ? "selected" : ''}>지위픽</option><option value="12" ${productBrandInfo[0].cate_no == 12 ? "selected" : ''}>인센트도그</option><option value="13" ${productBrandInfo[0].cate_no == 13 ? "selected" : ''}>로얄캐닌</option><option value="14" ${productBrandInfo[0].cate_no == 14 ? "selected" : ''}>나우</option><option value="15" ${productBrandInfo[0].cate_no == 15 ? "selected" : ''}>스텔라앤츄이스</option>';

										break;

									case '2':

										
										cate_brand.innerHTML = '<option selected value="default">브랜드</option><option value="25" ${productBrandInfo[0].cate_no == 25 ? "selected" : ''}>오리젠</option><option value="26" ${productBrandInfo[0].cate_no == 26 ? "selected" : ''}>지위픽</option><option value="27" ${productBrandInfo[0].cate_no == 27 ? "selected" : ''}>쿠쿳</option><option value="28" ${productBrandInfo[0].cate_no == 28 ? "selected" : ''}>로얄캐닌</option><option value="29" ${productBrandInfo[0].cate_no == 29 ? "selected" : ''}>나우</option>';
										break;


									default:
										break;
									}
									
									
								}
						        document.getElementById('pet_cate')
								.addEventListener('change',
										handleBrandChange);
						        handleBrandChange();
						    
						    
						    
						    }
							
							

							function handleTypeChange() {

								var pet_cate = document
										.getElementById('pet_cate').value;
								var big_cate = document
										.getElementById('big_cate').value;
								var big_cate_select = document
										.getElementById('big_cate');
								var cate_select = document
										.getElementById('cate');

								cate_select.innerHTML = '';

								switch (pet_cate) {

								case '1':
									switch (big_cate) {

									case '3':

										cate_select.innerHTML = '<option selected value="default">타입</option><option value="16" ${productTypeInfo[0].cate_no == 16 ? "selected" : ''}>건식</option><option value="17" ${productTypeInfo[0].cate_no == 17 ? "selected" : ''}>습식</option>';

										break;

									case '4':

										cate_select.innerHTML = '<option selected value="default">타입</option><option value="18" ${productTypeInfo[0].cate_no == 18 ? "selected" : ''}>껌</option><option value="19" ${productTypeInfo[0].cate_no == 19 ? "selected" : ''}>사시미</option><option value="20" ${productTypeInfo[0].cate_no == 20 ? "selected" : ''}>저키_트릿</option><option value="21" ${productTypeInfo[0].cate_no == 21 ? "selected" : ''}>건조간식</option>';

										break;

									case '5':

										cate_select.innerHTML = '<option selected value="default">타입</option><option value="22" ${productTypeInfo[0].cate_no == 22 ? "selected" : ''}>봉제_천</option><option value="23" ${productTypeInfo[0].cate_no == 23 ? "selected" : ''}>터그</option><option value="24" ${productTypeInfo[0].cate_no == 24 ? "selected" : ''}>원반_공</option>';

										break;

									default:
										break;

									}

									break;

								case '2':

									switch (big_cate) {

									case '3':

										cate_select.innerHTML = '<option selected value="default">타입</option><option value="30" ${productTypeInfo[0].cate_no == 30 ? "selected" : ''}>건식</option><option value="31" ${productTypeInfo[0].cate_no == 31 ? "selected" : ''}>습식</option>';

										break;

									case '4':

										cate_select.innerHTML = '<option selected value="default">타입</option><option value="32" ${productTypeInfo[0].cate_no == 32 ? "selected" : ''}>파우치</option><option value="33" ${productTypeInfo[0].cate_no == 33 ? "selected" : ''}>저키_스틱</option><option value="34" ${productTypeInfo[0].cate_no == 34 ? "selected" : ''}>캣닢_그라스</option><option value="35" ${productTypeInfo[0].cate_no == 35 ? "selected" : ''}>건조간식</option>';
										break;

									case '5':

										cate_select.innerHTML = '<option selected value="default">타입</option><option value="36" ${productTypeInfo[0].cate_no == 36 ? "selected" : ''}>인형_쿠션_공</option><option value="37" ${productTypeInfo[0].cate_no == 37 ? "selected" : ''}>낚시_막대</option><option value="38" ${productTypeInfo[0].cate_no == 38 ? "selected" : ''}>자동</option>';

										break;

									default:
										break;

									}

									break;

								default:
									break;
								}
							}
							
							
							

							document.getElementById('pet_cate')
									.addEventListener('change',
											handleTypeChange);
							document.getElementById('big_cate')
									.addEventListener('change',
											handleTypeChange);
							
							handleTypeChange();
							
							
							
					        document.querySelector('.tm-edit-product-form').addEventListener('submit', function(event) {
					            var cateValue = document.getElementById('cate').value;
					            var bigCateValue = document.getElementById('big_cate').value;
					            var petCateValue = document.getElementById('pet_cate').value;
					            
					            var name = $('#name');
					            var description = $('#description');
					            var price = $('#price');
					            var cnt = $('#cnt');
					            
					            let valid = true;

					            if(name.val()===''){
					            	valid = false;
					            	alert('상품 이름을 입력해주세요');
					            }
					            if(description.val()===''){
					            	if (valid) {
					            	alert('상품 설명을 입력해주세요');
					            	}
					            	valid = false;
					            }
					            if (cateValue === 'default' || bigCateValue === 'default' || petCateValue === 'default') {
					            	if (valid) {
					                alert('모든 옵션을 선택해주세요.');
					            	}
					            	valid = false;
					            }
					            if(price.val()===''){
					            	if (valid) {
					            	alert('상품 가격을 입력해주세요');
					            	}
					            	valid = false;
					            }
					            if(cnt.val()===''){
					            	if (valid) {
					            	alert('상품 재고수를 입력해주세요');
					            	}
					            	valid = false;
					            }

					            
					            if (!valid) {
					                event.preventDefault();
					            }
					        });
							
							
							function clearFileInput(button) {
						        // 버튼의 부모 요소(td) 내의 input[type="file"] 요소를 찾아서 값을 초기화
						        const fileInput = button.previousElementSibling;
						        if (fileInput && fileInput.type === "file") {
						            fileInput.value = "";
						        }
						    }
							
					

						});
	
	
		
		
		</script>



</body>
</html>
