<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*"%>
<%@ page import="project.com.entity.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	List<ReserveEvent> listReserveEvent = (List<ReserveEvent>) request.getAttribute("listReserveEvent");
Member mem = (Member) session.getAttribute("mem");
%>
<%SimpleDateFormat sm = new SimpleDateFormat("dd-MM-yyyy"); 
String datenow = (String) session.getAttribute("datenow");%>
<%
	String status = (String) request.getAttribute("status");
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
									<th class="product-name">List My Reserve Event</th>

								</tr>
							</thead>
							<tbody>
							<%
									if (status.equals("1")) {
								%>
								<div class="alert alert-success" role="alert">ReserveEvent
									 Successfully.</div>
								<%
									}
								%>
								<%
									if (status.equals("0")) {
								%>
								<div>Welcome to ReserveEvent</div>
								<%
									}
								%>
							<%if(listReserveEvent == null){%>
								<tr>
							<td class="product-name">
								<div class="product-detail">

									<h3 class="product-title">There are no events.</h3>
									
								</div>
							</td>
						</tr>
							<% }%>
							
							<%if(listReserveEvent != null){%>
							<table class="table table-bordered">
														<thead>
															<tr>
																<th scope="col">ID Event</th>
																<th scope="col">Reserve Date</th>
																<th scope="col">Event Name</th>
															    <th scope="col">Member Name</th>
																<th scope="col">Status Event</th>


															</tr>
														</thead>																										
								<%for(ReserveEvent reservevent : listReserveEvent){ %>
								<%if(mem.getEmail().equals(reservevent.getMember_email().getEmail())){ %>
						<tbody>
															<tr>
																<td><%=reservevent.getEvent().getIdEvent()%></td>
																<%String reserveDate= sm.format(reservevent.getReserveDate()); %>
																<td><%=reserveDate %></td>
																<td><%=reservevent.getEvent().getNameEvent() %></td>
																<td><%=reservevent.getMember_email().getName() %></td>
																<td><%
																Date dnow = sm.parse(datenow);
																Date resDate = reservevent.getEvent().getEventDate();
																int compare = dnow.compareTo(resDate);
																long diff = (dnow.getTime() - resDate.getTime()) / (1000 * 60 * 60 * 24);
																if (diff < -2) {%>
															<a href="cancelMyEvent?idReserveEvent=<%=reservevent.getIdReserveEvent()%>">
															<button type="button" class="button1" onclick="return confirm('Do you want cancel book a Event?')">Cancel My Reserve Event</button>
															</a>
															<%} %></td>
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
