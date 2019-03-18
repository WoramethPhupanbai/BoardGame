<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*"%>
<%@ page import="project.com.entity.*"%>
<%List<TableCafe> listTableCafe = (List<TableCafe>) session.getAttribute("listTableCafe");
List<ReserveTable> listreserveTable = (List<ReserveTable>) request.getAttribute("listReserveTable");%>
<%Member mem = (Member)session.getAttribute("mem"); %>
<%String status = (String)request.getAttribute("status"); %>
<%String namecafe = (String)session.getAttribute("nameCafe"); %>
<%int id = (Integer)request.getAttribute("id"); %>
<%Cafe cafeEmail = (Cafe)session.getAttribute("email");  %>
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
				<a href="/" id="branding"> <img src="images/logo.png" alt=""
					class="logo">

				</a>
				<!-- #branding -->

				<!-- Start include -->
				<jsp:include page="layout/header.jsp" />
				<!-- End include -->

				<main class="main-content">
				<div class="container">
					<div class="page" style="color: #333;">
						<section>
							<header>
								<h2 class="section-title">List Table <%=namecafe %></h2>
								<%if (cafeEmail !=null){ %>
								<%if (status==null){ %>
							<th align="right"><a href="/createTable" ><button type="button" class="button1">Create Table</button></a></th>
							<% }%>
							<% }%>

							</header>

							<div class="product-list">					
						<%for(TableCafe table : listTableCafe){ %>
						<% if (cafeEmail !=null){ %>
						<% if (cafeEmail.getEmail().equals(table.getCafe_namecafe().getEmail())){ %>
						<div class="product">
									<div class="inner-product" style="height:480px; width: 280px; ">
										<div class="figure-image">
										<%if(table.getStatusTable().equals("Repair")){ %>
											<a href="single.html"><img src="images/tablerepair.png" alt="Game 1"></a>
										<%} %>
										<%if(table.getStatusTable().equals("Reserved")){ %>
											<a href="single.html"><img src="images/tablereserve.png" alt="Game 1"></a>
											
										<%} %>
										<%if(table.getStatusTable().equals("Normal")){ %>
											<a href="single.html"><img src="images/table.png" alt="Game 1"></a>
										<%} %>
										</div>
										<h3 class="product-title">
											<div class="a" align="right">Zone : <%=table.getZone() %></div>
										</h3>
										<h3 class="product-title">
											<div class="a">Table No. : <%=table.getNumberTable() %></div>
										</h3>
										<small><%=table.getStatusTable() %></small>
										<p>Number of seats : <%=table.getChair() %></p>
												
										
										
										
													   										
										<% if (status==null){ %>
										<a href="/editTable?id=<%=table.getIdTable()%>"><button type="button" class="button1" >Edit Table</button></a>
								<%for(ReserveTable reservetable: listreserveTable){ %>
										<%if(reservetable.getTablecafe_idtable().getIdTable()==table.getIdTable()){ %>
										
										<p>Name Reservation : <%=reservetable.getMember_email().getName() %></p>
										<p>Reservation Time : <%=reservetable.getTimeReserve() %></p>			
										<%if(table.getStatusTable().equals("Reserved")){ %>
										<a href="cancelMyTable?idReserveTable=<%=reservetable.getIdReserveTable()%>">
									<button type="button" id="timeres" class="button1" onclick="return confirm('Do you want cancel book a Table?')">Cancel Table</button>
									</a>
									
									<%} %>
									<%} %>
									<%} %>
										<%} %>
										<% if (status!=null){ %>
										
										<a href="/updateStatusTable?idTable=<%=table.getIdTable() %>"><button type="button" class="button1" >Update Table</button></a>
										<%} %>
									</div>
								</div>
						<%} %> 
						<%}else{ %>
						<% if (mem != null && mem.getStatus().equals("member")){ %>
						<% if (table.getCafe_namecafe().getNameCafe().equals(namecafe)){ %>
						<div class="product">
									<div class="inner-product" style="height:480px; width: 280px; ">
										<div class="figure-image">
										<%if(table.getStatusTable().equals("Repair")){ %>
											<a href="single.html"><img src="images/tablerepair.png" alt="Game 1"></a>
										<%} %>
										<%if(table.getStatusTable().equals("Reserved")){ %>
											<a href="single.html"><img src="images/tablereserve.png" alt="Game 1"></a>
										<%} %>
										<%if(table.getStatusTable().equals("Normal")){ %>
											<a href="single.html"><img src="images/table.png" alt="Game 1"></a>
										<%} %>
										</div>
										<h3 class="product-title">
											<div class="a" align="right">Zone : <%=table.getZone() %></div>
										</h3>
										<h3 class="product-title">
											<div class="a">Table No. : <%=table.getNumberTable() %></div>
										</h3>
										<small><%=table.getStatusTable() %></small>
										<p>Number of seats : <%=table.getChair() %></p>
									    <%if(table.getStatusTable().equals("Normal")&& id==1){ %>
									    
										<a href="/reserveTable?idTable=<%=table.getIdTable()%>"><button type="button" class="button1">Reserve Table</button></a>
										<%} %>
										 <%if(table.getStatusTable().equals("Normal")&& id==0){ %>
									    
										<a href="/reserveTable?idTable=<%=table.getIdTable()%>"><button type="button" class="button1" disabled="disabled">Reserve Table</button></a>
										<%} %>
										
									</div>
								</div>
						<%} %> 
						<%} %>
						<% if (mem == null){ %>
						<% if (table.getCafe_namecafe().getNameCafe().equals(namecafe)){ %>
						<div class="product">
									<div class="inner-product" style="height:480px; width: 280px; ">
										<div class="figure-image">
										<%if(table.getStatusTable().equals("Repair")){ %>
											<a href="single.html"><img src="images/tablerepair.png" alt="Game 1"></a>
										<%} %>
										<%if(table.getStatusTable().equals("Reserved")){ %>
											<a href="single.html"><img src="images/tablereserve.png" alt="Game 1"></a>
										<%} %>
										<%if(table.getStatusTable().equals("Normal")){ %>
											<a href="single.html"><img src="images/table.png" alt="Game 1"></a>
										<%} %>
										</div>
										<h3 class="product-title">
											<div class="a" align="right">Zone : <%=table.getZone() %></div>
										</h3>
										<h3 class="product-title">
											<div class="a">Table No. : <%=table.getNumberTable() %></div>
										</h3>
										<small><%=table.getStatusTable() %></small>
										<p>Number of seats : <%=table.getChair() %></p>
										
									</div>
								</div>
						<%} %> 
						<%} %> 
								
								<% } %>
								<% } %>
								<!-- .product -->
							</div>
							<!-- .product-list -->

						</section>
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
