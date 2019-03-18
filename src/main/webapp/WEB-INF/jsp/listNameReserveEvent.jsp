<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*"%>
<%@ page import="project.com.entity.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	List<ReserveEvent> listReserveEvent = (List<ReserveEvent>) request.getAttribute("listReserveEvent");
%>
<%SimpleDateFormat sm = new SimpleDateFormat("dd-MM-yyyy"); %>
<%
	String nameevent = (String)request.getAttribute("nameEvent");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1">

	<title>Chiang Mai Board Game</title>

<!-- Loading third party fonts -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link
	href="http://fonts.googleapis.com/css?family=Roboto:100,300,400,700|"
	rel="stylesheet" type="text/css">
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
				<a href="/" id="branding"> <img src="images/logo.png"
					alt="" class="logo">

				</a>
				<!-- #branding -->

				<!-- Start include -->
				<jsp:include page="layout/header.jsp" />
				<!-- End include -->

				<main class="main-content">
				<div class="container">
					<div class="page" style="color: #333;">

						<table class="cart">
							<thead>
								<tr>
									<th class="product-name"><%=nameevent %></th>

								</tr>
							</thead>
							<tbody>
							<%if (listReserveEvent == null){ %>
								<tr>
							<td class="product-name">
								<div class="product-detail">

									<h3 class="product-title">There are no events.</h3>
									
								</div>
							</td>
						</tr>
							<% }%>
							
							<%if (listReserveEvent != null){ %>
							<table class="table table-bordered">
														<thead>
															<tr>																
																<th scope="col">Reserve Date</th>
															    <th scope="col">Member Name</th>
																<th scope="col">Email</th>
																<th scope="col">Phone Number</th>


															</tr>
														</thead>																										
								<%for(ReserveEvent reservrevent : listReserveEvent){ %>
								<%if(reservrevent.getEvent().getNameEvent().equals(nameevent)){ %>
						<tbody>
															<tr>
																<%String reserveDate= sm.format(reservrevent.getReserveDate()); %>
																<td><%=reserveDate %></td>
																<td><%=reservrevent.getMember_email().getName() %></td>
																<td><%=reservrevent.getMember_email().getEmail() %></td>
																<td><%=reservrevent.getMember_email().getPhone() %></td>
															</tr>
														</tbody>
						<% } %>
						<% } %>
						</table>
						<% }%>
						
							</tbody>
						</table>
						<!-- .cart -->
					</div>
				</div>
				<!-- .container --> </main>
				<!-- .main-content -->

				<jsp:include page="layout/footer.jsp" />
			</div>

			<div class="overlay"></div>



			<script src="js/jquery-1.11.1.min.js"></script>
			<script src="js/plugins.js"></script>
			<script src="js/app.js"></script>
</body>



</html>
