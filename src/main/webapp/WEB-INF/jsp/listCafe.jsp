<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*"%>
<%@ page import="project.com.entity.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>

<%List<Cafe> listCafe = (List<Cafe>) request.getAttribute("listCafe");
String timeNow = (String)session.getAttribute("timeNow");
SimpleDateFormat sm = new SimpleDateFormat("HH:mm");
/* DecimalFormat decimalFormat = new DecimalFormat("0.00"); */
String namecafe = (String)session.getAttribute("namecafe"); 
Member mem = (Member)session.getAttribute("mem"); 

Timestamp timestamp = new Timestamp(System.currentTimeMillis());
Date timenow = sm.parse(timeNow);
String timeS = sm.format(timestamp.getTime());
long diff = 0; 
%>
<%Cafe cafeEmail = (Cafe)session.getAttribute("email");  %>
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
			<div class="page">

				<table class="cart">
					<thead>
						<tr>
							<th class="product-name" style="color: #333;">List Cafe
							</th>
							
						</tr>
					</thead>
					<tbody>
<%if(listCafe !=null||mem!=null){ %>
						<%for(Cafe cafe : listCafe){ %>
						<%if(cafe.getStatusCafe().equals("Open")){ %>
						<tr>
							<td class="product-name">
							
								<div class="product-thumbnail">
									<img src="Image/CafeImg/<%=cafe.getProfilepictureCafe()%>" alt="" width="150px"height="150px">
								</div>
								<div class="product-detail">
								
									<h3 class="product-title"style="color: #333;"><%=cafe.getNameCafe()%></h3>
									
									<%-- <%String price = decimalFormat.format(cafe.getPrice()); %> --%>
									<%String timeOpen = sm.format(cafe.getTimeOpen()); %>
									<%String timeClose = sm.format(cafe.getTimeClosed()); %>
									<%Timestamp timesClose = new Timestamp(cafe.getTimeClosed().getTime()); %>
									<%Timestamp timesOpen = new Timestamp(cafe.getTimeOpen().getTime()); %>
									<p class="product-title" style="color: #333;"><b>Entry Fee : </b> &nbsp;<%=cafe.getPrice()%></p>
									<p class="product-title" style="color: #333;"><b>Open :</b> &nbsp; <%=timeOpen%> - <%=timeClose%></p>
									<%long TimeClose = timesClose.getTime(); %>
									<%long TimeOpen = timesOpen.getTime(); %>
									<%long TimeNow = timenow.getTime(); %>
									<%if(TimeClose > TimeOpen){ %>
									<%diff = (TimeClose-TimeNow)/(60 * 60 * 1000); %>
									<%}else{ %>
									<%diff = (TimeClose-TimeNow)/(60 * 60 * 1000); %>
									<%diff+=24; %>
									<%} %>
 									<%=diff %>
										<a href="/viewCafe?nameCafe=<%=cafe.getNameCafe() %>"><button type="button" class="button1">More Detail</button></a>
										
										<% if (mem != null && mem.getStatus().equals("member")){ %>
										<%if(diff> 0){ %>
						<a href="/selectBoardGame?nameCafe=<%=cafe.getNameCafe()%>"><button type="button" class="button1" style="margin-bottom: 15px;">Select BoardGame</button></a><br>
					<%} %>
					<%} %>
									<p></p>
								</div>
							</td>
						</tr>
							<%}else{ %>
							<%} %>
						<% } %>
<% } %>
					</tbody>
				</table>
				<!-- .cart -->
			</div>
		</div>
		<!-- .container -->
	</main>
	<!-- .main-content -->

			<jsp:include page="layout/footer.jsp"/>
		</div>

		<div class="overlay"></div>

		

		<script src="js/jquery-1.11.1.min.js"></script>
		<script src="js/plugins.js"></script>
		<script src="js/app.js"></script>
		
	</body>
	


</html>
