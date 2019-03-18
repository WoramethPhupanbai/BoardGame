<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*"%>
<%@ page import="project.com.entity.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%List<Event> listEvent = (List<Event>) request.getAttribute("listEvent");
List<ReserveEvent> listReserveEvent = (List<ReserveEvent>) session.getAttribute("listReserveEvent");
SimpleDateFormat sm = new SimpleDateFormat("dd-MM-yyyy");
String datenow = (String) session.getAttribute("datenow");
Date dateNow = sm.parse(datenow);
Member mem = (Member)session.getAttribute("mem"); %>
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
							<th> <h1 style="margin-top: 20px; width: 250px;"><b>List Event</b></h1>  
							<% if(cafeEmail !=null){%>
							<a href="/createEvent" ><button type="button" class="button1">Create Event</button></a></th>
							<% }%>
						</tr>
					</thead>
					
					<tbody>

						<%for(Event event : listEvent){ %>
						<% if (cafeEmail !=null){ %>
						<% if (cafeEmail.getEmail().equals(event.getCafe().getEmail())){ %> 
						<tr>
							<td class="product-name">
								<div class="product-thumbnail" >
									<img src="Image/EventImg/<%=event.getPictureEvent() %>" alt=""  style="width:150px;height:150px;"> 
								</div>
								<div class="product-detail">

										<h3 class="product-title"style="color: #333;"><%=event.getNameEvent()%></h3>
									<%String eventdate = sm.format(event.getEventDate()); %>
									<p class="product-title" style="color: #333;"><b>EventDate :</b> &nbsp;<%=eventdate %></p>
									<p class="product-title" style="color: #333;"><b>Hurry :</b> &nbsp;<%=event.getQuatity() %> &nbsp; seat left ! </p>
									<p class="product-title" style="color: #32CD32;"><b>Entry Fee :</b> &nbsp; <%=event.getPrice() %></p><br>						
									<a href="/editEvent?idEvent=<%=event.getIdEvent()%>"><button type="button" class="button1">Edit Event</button></a>
									<a href="/listNameReserveEvent?nameEvent=<%=event.getNameEvent()%>"><button type="button" class="button2" style="margin-right: 10px">List Name Reserved Event</button></a>
									<p></p>
								</div>
							</td>
						</tr>
				        <%} %> 
						<% }else{ %>					
						<%if (mem == null){ %>
						<tr>
							<td class="product-name">
								<div class="product-thumbnail" >
									<img src="Image/EventImg/<%=event.getPictureEvent() %>" alt=""  style="width:150px;height:150px;"> 
								</div>
								<div class="product-detail">

									<h3 class="product-title"style="color: #333;"><%=event.getNameEvent()%></h3>
									<p class="product-title" style="color: #333;"><b>Location :</b> &nbsp;<%=event.getCafe().getNameCafe() %></p>
									<%String eventdate = sm.format(event.getEventDate()); %>
									<p class="product-title" style="color: #333;"><b>EventDate :</b> &nbsp;<%=eventdate %></p>
									<p class="product-title" style="color: #333;"><b>Hurry :</b> &nbsp;<%=event.getQuatity() %> &nbsp; seat left ! </p>
									<p class="product-title" style="color: #32CD32;"><b>Entry Fee :</b> &nbsp; <%=event.getPrice() %></p><br>						
									<a href="/doviewEvent?idEvent=<%=event.getIdEvent()%>"><button type="button" class="button1">Event Details</button></a>										
									<p></p>
								</div>
							</td>
						</tr>						
						<% } %>
						<!-- MEMBER -->

						<% if (mem != null && mem.getStatus().equals("member")){ %>
						<%
 HashMap<Integer, Integer> hmap = new HashMap<>();
 for (ReserveEvent reserveEvent : listReserveEvent) {
	if(reserveEvent.getMember_email().getEmail().equals(mem.getEmail())){
 		hmap.put( reserveEvent.getEvent().getIdEvent(),reserveEvent.getIdReserveEvent());
 	}
	
 }

%>
						<%if(event.getCafe().getStatusCafe().equals("Open")){ %>
						<%if(event.getEventDate().after(dateNow)) {%>
						
						<tr>
							<td class="product-name">
								<div class="product-thumbnail" >
									<img src="Image/EventImg/<%=event.getPictureEvent() %>" alt=""  style="width:150px;height:150px;"> 
								</div>
								<div class="product-detail">

									<h3 class="product-title"style="color: #333;"><%=event.getNameEvent()%></h3>
									<p class="product-title" style="color: #333;"><b>Location :</b> &nbsp;<%=event.getCafe().getNameCafe() %></p>
									<%String eventdate = sm.format(event.getEventDate()); %>
									<p class="product-title" style="color: #333;"><b>EventDate :</b> &nbsp;<%=eventdate %></p>
									<p class="product-title" style="color: #333;"><b>Hurry :</b> &nbsp;<%=event.getQuatity() %> &nbsp; seat left ! </p>
									<p class="product-title" style="color: #32CD32;"><b>Entry Fee :</b> &nbsp; <%=event.getPrice() %></p><br>						
									<a href="/doviewEvent?idEvent=<%=event.getIdEvent()%>" ><button type="button" class="button1" >Detail Event</button></a>
						
			 <% if(!hmap.containsKey(event.getIdEvent())){ %>
			   
				<%} %>
				 
				<%} %>								
								</div>
							</td>
						</tr>
						<%} %>
						<%} %>
						
						
						
						
<!-- MEMBER -->	
						
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
