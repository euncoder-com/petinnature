<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c' %>
	<%
    String project = "/petinnature/";
%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="<%=project%>resources/images/favicon/favicon.ico">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Product Admin - Dashboard do Template</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href="<%=project%>resources/css/fontawesome.min.css">
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="<%=project%>resources/css/bootstrap.min.css">

    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="<%=project%>resources/css/templatemo-style.css">
    
    <!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
	 
	<style type="text/css">
	
	/* 관리자페이지 로그아웃 버튼 */
	

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


        
        #chartPadding {
            padding-bottom: 700px;
        }
	
		.pname {
			color: white;
			text-align: center;
			margin-top: 50px;
		}
		
.username {

color:white;
}
	
	</style>
	
	 
     
	
</head>

<body id="reportsPage">
    <div class="" id="home">
        <nav class="navbar navbar-expand-xl">
            <div class="container h-100">
                <a class="navbar-brand" href="../index2.do">
                    <h1 class="tm-site-title mb-0"><img src="<%=project%>resources/images/main-logo.png"></h1>
                </a>
                <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
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
        <div class="container">
            <div class="row">
                <div class="col">
                    <p class="text-white mt-5 mb-5"></p>
                </div>
            </div>
            <!-- row -->
            <div class="row tm-content-row">
                <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
    				<div class="tm-bg-primary-dark tm-block" id="chartPadding">
        				<h2 class="tm-block-title">강아지 상품 판매 현황</h2>
       						 <canvas id="barChart"></canvas>
       						 <div class='pname1 pname'>
       						 
       						 </div>
   							 </div>
								</div>
              		 <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
    					<div class="tm-bg-primary-dark tm-block" id="chartPadding">
        					<h2 class="tm-block-title">고양이 상품 판매 현황</h2>
        						<canvas id="lineChart"></canvas>
        						<div class='pname2 pname'>
       						
       						 </div>
    					</div>
					</div>



            </div>
        </div>
        <footer class="tm-footer row tm-mt-small">
            <div class="col-12 font-weight-light">
            </div>
        </footer>
    </div>

    <script src="<%=project%>resources/js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="<%=project%>resources/js/moment.min.js"></script>
    <!-- https://momentjs.com/ -->
    <script src="<%=project%>resources/js/Chart.min.js"></script>
    <!-- http://www.chartjs.org/docs/latest/ -->
    <script src="<%=project%>resources/js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
    <script src="<%=project%>resources/js/tooplate-scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script type="text/javascript">

   document.addEventListener('DOMContentLoaded', function () {
 
   $.ajax({
	  type : 'post',
	  url : 'chartList.do',
	  data : "cate=강아지",
	  dataType : 'json',
	  success : function(result){
		  var chartpno = [];
		   var chartpcnt = [];
		   var allpname="";
		   
		  for(row of result){
			  chartpno.push(row.product_no);
			  chartpcnt.push(row.cnt);
			  allpname += row.product_no+" : " + row.product_name + "<br/>";
		  }
		  $('.pname1').html(allpname);
		  
		  var barCtx = document.getElementById('barChart').getContext('2d');
	        var barChart = new Chart(barCtx, {
	            type: 'bar',
	            data: {
	                labels: chartpno,
	                datasets: [{
	                    label: '판매량',
	                    data: chartpcnt,
	                    backgroundColor: 'rgba(255, 99, 132, 0.4)',
	                    borderColor: 'rgba(255, 99, 132, 1)',
	                    borderWidth: 1,
	                   
	                }]
	            },
	            options: {
	                scales: {
	                    y: {
	                        ticks: {
	                        	color: '#ffffff'
	                        }
	                    },
	                    x: {
	                    	ticks: {
	                    		color: '#ffffff'
	                    	}
	                    }
	                },
	                plugins: {
	                	legend: {
	                		labels: {
	                			color: '#ffffff'
	                		}
	                    }
	                }
	            }
	        });
		  
	  },
	  error : function(err){
		  alert('실패');
	  }
   });


   $.ajax({
		  type : 'post',
		  url : 'chartList.do',
		  data : "cate=고양이",
		  dataType : 'json',
		  success : function(result){
			  var chartpno = [];			  
			   var chartpcnt = [];
			   var allpname="";
			   
				  for(row of result){
					  chartpno.push(row.product_no);
					  chartpcnt.push(row.cnt);
					  allpname += row.product_no+" : " + row.product_name + "<br/>";
				  }
				  $('.pname2').html(allpname);
			  
			// 라인 차트 데이터와 설정
			    var lineCtx = document.getElementById('lineChart').getContext('2d');
			    var lineChart = new Chart(lineCtx, {
			        type: 'line',
			        data: {
			            labels: chartpno,
			            datasets: [{
			                label: '판매량',
			                data: chartpcnt,
			                backgroundColor: 'rgba(54, 162, 235, 0.4)',
			                borderColor: 'rgba(54, 162, 235, 1)',
			                borderWidth: 1,
			                fill: true
			            }]
			        },
			        options: {
			            scales: {
			                y: {
			                    beginAtZero: true,
			                    position: 'left',
			                    ticks: {
			                    	color: '#ffffff'
			                    }
			                },
			                x: {
			                	ticks: {
			                		color: '#ffffff'
			                	}
			                }
			            },
			            plugins: {
			            	legend: {
			            		labels: {
			            			color: '#ffffff'
			            		}
			            	}
			            }
			            
			        }
			    });
			  
		  },
		  error : function(err){
			  alert('실패');
		  }
	   });
    
});
    </script>
</body>

</html>