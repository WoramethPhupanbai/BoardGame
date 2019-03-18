<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*"%>
<%@ page import="project.com.entity.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%Event Eventdetail = (Event) request.getAttribute("event");
SimpleDateFormat sm = new SimpleDateFormat("dd-MM-yyyy");
String datenow = (String) session.getAttribute("datenow");
Date dateNow = sm.parse(datenow);
List<ReserveEvent> listReserveEvent = (List<ReserveEvent>) session.getAttribute("listReserveEvent");
SimpleDateFormat tm = new SimpleDateFormat("HH:mm");%>
<%Member mem = (Member)session.getAttribute("mem"); %>

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
        <div class="entry-content" >
          <div class="row" >
            <div class="col-sm-6 col-md-4">
              <div class="product-images">
                <figure class="large-image">
                  <a href="Image/EventImg/<%=Eventdetail.getPictureEvent()%>"><img src="Image/EventImg/<%=Eventdetail.getPictureEvent()%>" alt=""style="width:400px;height:350px;"></a>
                </figure>
              </div>
            </div>
            <div class="col-sm-6 col-md-8">
            <%String EventDate = sm.format(Eventdetail.getEventDate());  %>
              <%String StartTime = tm.format(Eventdetail.getStartTime());  %>
              <h3 class="product-title" style="color: #333;"><b><%=Eventdetail.getNameEvent() %></b></h3><br>
              <%-- <%String price = decimalFormat.format(Eventdetail.getPrice()); %> --%>
              <h3 class="product-title" style="color: #32CD32;"><b>Entry Fee :</b> <%=Eventdetail.getPrice() %></h3><br>
              
			  <p style="color: #333;"><b>Event Date: </b><%=EventDate %></p><p style="color: #333;"><b>   Start Time: </b><%=StartTime %></p><br>
			  
              <p style="color: #333;"><b>Event Details: </b><%=Eventdetail.getDetailEvent() %></p><br>
              <p style="color: #333;"><b>Hurry : </b><%=Eventdetail.getQuatity() %><b> seat left ! </b></p><br>
               <h4 class="product-title" style="color: #333;"><b><%=Eventdetail.getCafe().getNameCafe() %></b></h4>
  <%             HashMap<Integer, Integer> hmap = new HashMap<>();
for (ReserveEvent reserveEvent : listReserveEvent) {
	if(reserveEvent.getMember_email().getEmail().equals(mem.getEmail())){
 		hmap.put( reserveEvent.getEvent().getIdEvent(),reserveEvent.getIdReserveEvent());
 	}
 }%>
              <%if(Eventdetail.getQuatity() != 0 ){ %>
               <% if(!hmap.containsKey(Eventdetail.getIdEvent())){ %>
              <%
																Date dnow = sm.parse(datenow);
																Date resDate = Eventdetail.getEventDate();
																int compare = dnow.compareTo(resDate);
																long diff = (dnow.getTime() - resDate.getTime()) / (1000 * 60 * 60 * 24);
																if (diff < 0) {%>
						
              <form name="frm" action="/doReserveEvent" method="post">
              <input type="hidden" name="idevent" value="<%=Eventdetail.getIdEvent() %>">
             <button type="submit" class="btn btn-primary" >
             <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>Reserve Event</button>
             </form>
             <%} %>
             <%} %> <%} %>
            </div>
          </div>
        </div>




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
