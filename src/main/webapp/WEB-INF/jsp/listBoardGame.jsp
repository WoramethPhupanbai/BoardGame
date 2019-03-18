<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*"%>
<%@ page import="project.com.entity.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%List<BoardGame> listBoardGame = (List<BoardGame>) request.getAttribute("listBoardGame");
String nameCafe = (String)session.getAttribute("nameCafe");%>
<%Cafe cafeEmail = (Cafe)session.getAttribute("email");  %>
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
			<div class="page" style="color: #333;">

				<table class="cart">
					<thead>
						<tr>
							<th> <h1 style="margin-top: 20px; width: 250px;"><b>List Boardgame</b></h1>  
							<% if(cafeEmail !=null){%>
							<a href="/createBoardGame" ><button type="button" class="button1">Create BoardGame</button></a></th>
							<% }%>
						</tr>
					</thead>
					<tbody>

						<%for(BoardGame boardgame : listBoardGame){ %>
						<% if (cafeEmail !=null){ %>
						<% if (cafeEmail.getEmail().equals(boardgame.getCafe().getEmail())){ %> 
						<tr>
							<td class="product-name">
								<div class="product-thumbnail">
								<img width="200" height="200" src="Image/BoardGameImg/<%=boardgame.getPictureBoardGame() %>"> 
								</div>
								<div class="product-detail">

									<h3 class="product-title"><%=boardgame.getNameBoardGame()%></h3>
									<p class="product-title"><%=boardgame.getGameDetail()%></p>
									<p class="product-title"><%=boardgame.getMinPeople()%> - <%=boardgame.getMaxPeople()%> Players</p>
									<%if(boardgame.getMinPlayTime() == boardgame.getMaxPlayTime()) {%>
									<p class="product-title"><%=boardgame.getMinPlayTime()%> Min</p>
									<%} %>
									<%if(!(boardgame.getMinPlayTime() == boardgame.getMaxPlayTime())){%>
									<p class="product-title"><%=boardgame.getMinPlayTime()%> - <%=boardgame.getMaxPlayTime()%> Minute</p>
									<%} %>
									<a href="/editBoardGame?idBoardGame=<%=boardgame.getIdBoardGame()%>"><button type="button" class="button1">Edit BoardGame</button></a>				<p></p>
								</div>
							</td>
						</tr>
						<% } %>
						<% }else{ %>
						<% if (mem != null && mem.getStatus().equals("member")){ %>
							<%if (boardgame.getCafe().getNameCafe().equals(nameCafe)){ %>
						<tr>
							<td class="product-name">
								<div class="product-thumbnail">
								<img width="200" height="200" src="Image/BoardGameImg/<%=boardgame.getPictureBoardGame() %>"> 
								</div>
								<div class="product-detail">

									<h3 class="product-title"><%=boardgame.getNameBoardGame()%></h3>
									<p class="product-title"><%=boardgame.getGameDetail()%></p>
									<p class="product-title">Number of players : <%=boardgame.getMinPeople()%> - <%=boardgame.getMaxPeople()%> Players</p>
									<%if(boardgame.getMinPlayTime() == boardgame.getMaxPlayTime()) {%>
									<p class="product-title">Time :<%=boardgame.getMinPlayTime()%> Minute</p>
									<%} %>
									<%if(!(boardgame.getMinPlayTime() == boardgame.getMaxPlayTime())){%>
									<p class="product-title">Time :<%=boardgame.getMinPlayTime()%> - <%=boardgame.getMaxPlayTime()%> Minute</p>
									<%} %>
									<p class="product-title">Age :<%=boardgame.getAgeBoardGame()%></p>						
									    <%if(boardgame.getStatusBoardGame().equals("Normal")){ %>
										<a href="/listTableCafeIdBoardGame?idBoardGame=<%=boardgame.getIdBoardGame()%>"><button type="button" class="button1">Select BoardGame</button></a>
										<%} %>								
									<p></p>
								</div>
							</td>
						</tr>
						<%} %>
						<% } %>
						<% if (mem == null){ %>
						<tr>
							<td class="product-name">
								<div class="product-thumbnail">
								<img width="200" height="200" src="Image/BoardGameImg/<%=boardgame.getPictureBoardGame() %>"> 
								</div>
								<div class="product-detail">

									<h3 class="product-title"><%=boardgame.getNameBoardGame()%></h3>
									<p class="product-title"><%=boardgame.getGameDetail()%></p>
									<p class="product-title"><%=boardgame.getMinPeople()%> - <%=boardgame.getMaxPeople()%> Players</p>
									<p class="product-title"><%=boardgame.getMinPlayTime()%> - <%=boardgame.getMaxPeople()%> Minute</p>
								</div>
							</td>
						</tr>
						<% } %>
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
