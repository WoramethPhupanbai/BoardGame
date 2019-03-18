<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*"%>
<%@ page import="project.com.entity.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%List<BoardGame> listBoardGame = (List<BoardGame>) request.getAttribute("listBoardGame");%>
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
   <div class="filter-bar">
   <form action="/doSearchBoardGame" method="post">
							<div class="filter">
								<span> 
								
                                        <input class="form-control " type="search" name="search" placeholder="Search Board Game" style="width:500px;margin-top: 15px;margin-left: 500px">
                                       
								</span>
								
							</div> <!-- .filter -->

							<div class="pagination">
								<button type="summit" class="btn btn-primary glyphicon glyphicon-search"></button>
							</div> <!-- .pagination -->
	</form>
						</div> <!-- .filter-bar -->
						<%if(listBoardGame == null){ %>
						<h1 class="product-name">find not found !</h1>
						<%} %>
    <%if (listBoardGame!=null){ %>
    <div class="product-list" style="  height:500px; overflow: auto;">
    <%for(BoardGame boardgame : listBoardGame){ %>
        <div class="product" style="color: #333;">
          <div class="inner-product" style="height:450px">
            <div class="figure-image">
              <img src="Image/BoardGameImg/<%=boardgame.getPictureBoardGame() %>" alt="<%=boardgame.getNameBoardGame()%>" style="width:200px;height: 250px;" >
            </div>
            <h4 style="margin-top:-10px;margin-bottom: 5px;"><strong><%=boardgame.getNameBoardGame() %></strong></h4>
            <p>Number of player : <%=boardgame.getMinPeople() %>-<%=boardgame.getMaxPeople() %> players</p>
            <p>Age : <%=boardgame.getAgeBoardGame() %></p>
            <%if(boardgame.getMinPlayTime() == boardgame.getMaxPlayTime()) {%>
			<p>Playing Time : <%=boardgame.getMinPlayTime()%> Min</p>
			<%} %>
			<%if(!(boardgame.getMinPlayTime() == boardgame.getMaxPlayTime())){%>
			<p>Playing Time : <%=boardgame.getMinPlayTime()%> - <%=boardgame.getMaxPlayTime()%> Min</p>
			<%} %>
			<h5><b><%=boardgame.getCafe().getNameCafe() %></b></h5>
          </div>
        </div> <!-- .product -->
        <%} %>
    </div> <!-- .product-list -->
	<%} %>
	
	
	
  
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
