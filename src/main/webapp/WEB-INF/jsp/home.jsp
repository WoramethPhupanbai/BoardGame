<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*"%>
<%@ page import="project.com.entity.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%ArrayList<Cafe> listCafe = (ArrayList<Cafe>)session.getAttribute("listCafe");
String datenow = (String)session.getAttribute("datenow");
SimpleDateFormat datefor = new SimpleDateFormat("dd-MM-yyyy");
SimpleDateFormat sm = new SimpleDateFormat("HH:mm");
Date dateNow = datefor.parse(datenow);
/* DecimalFormat decimalFormat = new DecimalFormat("0.00"); */%>
<%String status = (String)request.getAttribute("status"); %>
<!DOCTYPE html>
<html lang="en">
<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">
		
		<title>Chiang Mai Board Game</title>

		<!-- Loading third party fonts -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link href="http://fonts.googleapis.com/css?family=Roboto:100,300,400,700|" rel="stylesheet" type="text/css">
		<link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="fonts/lineo-icon/style.css" rel="stylesheet" type="text/css">

		<!-- Loading main css file -->
		<link rel="stylesheet" href="sass/style.scss">
		
		<!--[if lt IE 9]>
		<script src="js/ie-support/html5.js"></script>
		<script src="js/ie-support/respond.js"></script>
		<![endif]-->
		<c:url value="/css/main.css" var="jstlCss" />
		<link href="${jstlCss}" rel="stylesheet" />
		

	</head>


	<body class="slider-collapse">
		
		<div id="site-content">
			<div class="site-header">
				<div class="container">
					<a href="/" id="branding">
				<img src="images/logo.png"  alt="" class="logo">

			</a> <!-- #branding -->

					<!-- Start include -->
					<jsp:include page="layout/header.jsp"/>
					<!-- End include -->
					
					
			<main class="main-content">
			
				<div class="container">
					<div class="page" style="color: #333;">
						<%if (status.equals("2")){ %>
				<div class="alert alert-success" role="alert">
  					Register Successfully. Please login.
				</div>
				<%} %>
				<%if(status.equals("0")){ %>
				
				<%} %>
				<%if(status.equals("3")){ %>
				<div class="alert alert-danger" role="alert">
  					Sorry Your Selected Time this not available.
				</div>
				<%} %>
				<%if(status.equals("4")){ %>
				<div class="alert alert-danger" role="alert">
  					Sorry Your Selected Date this not available.
				</div>
				<%} %>
				<%if(status.equals("5")){ %>
				<div class="alert alert-danger" role="alert">
  					Invalid email or password.
				</div>
				<%} %>
				<%if(status.equals("10")){ %>
				<div class="alert alert-danger" role="alert">
  					Password invalid.
				</div>
				<%} %>
<!-- 					<section> -->
<!-- 							<header> -->
<!-- 								<h2 class="section-title">BoardGame </h2> -->
<!-- 								<a href="#" class="all">Show All</a> -->
<!-- 							</header> -->

<!-- 							<div class="product-list"> -->
<%-- 								<%for(BoardGame listB : listBoardGame){ %> --%>
<!-- 								<div class="product"> -->
<!-- 									<div class="inner-product" style="height:500px; "> -->
<!-- 										<div class="figure-image"> -->
<%-- 											<img src="Image/BoardGameImg/<%=listB.getPictureBoardGame()%>" alt="" style="width:200px;height:200px;"> --%>
<!-- 										</div> -->
<%-- 										<h3 class="product-title"><%=listB.getNameBoardGame() %></h3> --%>
<%-- 										<h3 class="product-title">StatusBoardGame : </h3><p> <%=listB.getStatusBoardGame()%></p> --%>
<%-- 										<h3 class="product-title">Type BoardGame : </h3><p><%=listB.getTypeGame() %></p> --%>
<%-- 										<h3 class="product-title">Category BoardGame : </h3><p><%=listB.getCategoryBoardGame()%></p> --%>
<!-- 									</div> -->
<!-- 								</div> .product -->
<%-- 								<%} %> --%>
<!-- 							</div> .product-list -->

<!-- 						</section> -->

						<section>
							<header>
								<h2 class="section-title">Cafe</h2> 
<%-- 								<%=dateNow %> --%>
								
								<a href="/listCafe" class="all">Show All</a>
							</header>
							
							<div class="product-list">
							<%for(Cafe listC : listCafe){ %>
							<%if(listC.getStatusCafe()!=null){ %>
							<%if(listC.getStatusCafe().equals("Open")){ %>
								<div class="product">								
									<div class="inner-product" style="height:270px;">
										<div class="figure-image">
											<a href="/viewCafe?nameCafe=<%=listC.getNameCafe()%>"><img src="Image/CafeImg/<%=listC.getProfilepictureCafe()%>" alt=""style="width:200px;height:200px;"></a>
										</div>
										
										<%-- <a href="/viewCafe?nameCafe=<%=listC.getNameCafe()%>" class="button">More Detail</a> --%>
									</div>									
								</div> <!-- .product -->
								<%}else{ %>
								<%} %>
								<%} %>
								<%} %>
								</div>
								
						</section>

					</div>
				</div> <!-- .container -->
			</main> <!-- .main-content -->

			<jsp:include page="layout/footer.jsp"/>
		</div>

		<div class="overlay"></div>

		<script src="js/jquery-1.11.1.min.js"></script>
		<script src="js/plugins.js"></script>
		<script src="js/app.js"></script>
		
	</body>


</html>
