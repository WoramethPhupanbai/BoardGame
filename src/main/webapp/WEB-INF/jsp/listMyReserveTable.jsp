<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*"%>
<%@ page import="project.com.entity.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	List<ReserveTable> listreserveTable = (List<ReserveTable>) request.getAttribute("listReserveTable");
%>
<%SimpleDateFormat sm = new SimpleDateFormat("dd-MM-yyyy");
SimpleDateFormat time = new SimpleDateFormat("HH:mm");
String datenow = (String) session.getAttribute("datenow");%>
<%
	Member mem = (Member) session.getAttribute("mem");
%>
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
<!-- Date Time -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!--[if lt IE 9]>
		<script src="js/ie-support/html5.js"></script>
		<script src="js/ie-support/respond.js"></script>
		<![endif]-->
<c:url value="/css/main.css" var="jstlCss" />
<link href="${jstlCss}" rel="stylesheet" />

<%-- 		<script type="text/javascript">
  
  $( function() {
    $( "#datepicker" ).datepicker({
    	dateFormat: 'yy-mm-dd',
        language:'th',
        minDate: 0
    });
    
  } );
  var jdt2=Date.parse(datenow+dt2);
  <%for(ReserveTable listresTable :listreserveTable){%>
  <%=listresTable.getTimeReserve()%> = moment(new Date('#timeres')).format('HH:mm');
  if(timeres>listresTable.getTimeReserve()){
      alert("กรุณาเลือก เวลาสิ้นสุด มากกว่า เวลาเริ่มต้น !!")
      return false;
  }
  <%}%>
} );
  </script> --%>
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
									<th class="product-name">List My Reserve Table</th>

								</tr>
							</thead>
							<tbody>
								<% if (status.equals("1")) {
								%>
								<div class="alert alert-success" role="alert">ReserveTable
									 Successfully.</div>
								<%
									}
								%>
								<%
									if (status.equals("0")) {
								%>
								<div>Welcome to ReserveTable</div>
								<%
									}
								%>
							<%if(listreserveTable == null){ %>
								<tr>
							<td class="product-name">
								<div class="product-detail">

									<h3 class="product-title">There are no Tables.</h3>
									
								</div>
							</td>
						</tr>
							<%} %>
							
							
							<%if(listreserveTable != null){ %>
							<table class="table table-bordered">
														<thead>
															<tr>
																<th scope="col">NumberTable</th>
																<th scope="col">Reserve Date</th>
																<th scope="col">Name</th>
															    <th scope="col">Time</th>
																<th scope="col">NameBoardGame</th>


															</tr>
														</thead>		
								<%for(ReserveTable reservetable: listreserveTable){ %>
								<%if(mem.getEmail().equals(reservetable.getMember_email().getEmail())){ %>
						<tbody>
						<tr>
								<td><%=reservetable.getTablecafe_idtable().getNumberTable()%></td>
									<%String reserveDate= sm.format(reservetable.getDateReserve()); %>
									<td><%=reserveDate%></td>
									<td><%=reservetable.getMember_email().getName() %></td>
									<td><%=reservetable.getTimeReserve() %></td>
									<td><%=reservetable.getBoardgame_id().getNameBoardGame() %></td>
									<td>
									
									</td>
						
							</tr>
						</tbody>
						<% } %>
						<%} %>
						<% } %>
						
						
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
