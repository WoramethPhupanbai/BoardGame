<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*"%>
<%@ page import="project.com.entity.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%Cafe Cafedetail = (Cafe)request.getAttribute("c");
SimpleDateFormat sm = new SimpleDateFormat("HH:mm");%>
<%List<PictureCafe> pictureCafe = (List<PictureCafe>) request.getAttribute("listPictureCafe");%>

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
											<a href=""><img src="Image/CafeImg/<%=Cafedetail.getProfilepictureCafe()%>" alt=""></a>
										
										</figure>
										
										<div class="thumbnails">
										 <%for(PictureCafe p : pictureCafe){ %>
										
										<%if(p.getNameCafe().getNameCafe().equals(Cafedetail.getNameCafe())){%>
											<a href="Image/CafeImg/<%=p.getPictureCafe()%>"><img src="Image/CafeImg/<%=p.getPictureCafe()%>" alt="" width="100px"height="100px"></a>
											<%} %>
											<%} %>
										</div>
									</div>
									
								</div>
            <div class="col-sm-6 col-md-8">
              <h2 class="product-title" style="color: #333;"><b><%=Cafedetail.getNameCafe() %></b></h2>
              <h4 class="product-title" style="color: #32CD32;">Entry Fee : <%=Cafedetail.getPrice()%></h4>

              <p style="color: #333;"><b>About Cafe:</b> <%=Cafedetail.getAbout() %></p><br>
              <p style="color: #333;"><b>Tel:</b> <%=Cafedetail.getTel()%></p><br>
              <p style="color: #333;"><b>Address:</b> <%=Cafedetail.getAddress()%></p><br>
              <%String timeOpen = sm.format(Cafedetail.getTimeOpen()); %>
              <%String timeClose = sm.format(Cafedetail.getTimeClosed()); %>
              <p style="color: #333;"><b>Open:</b> <%=timeOpen%> - <%=timeClose%></p><br>
              <p style="color: #333;"><b>Map:</b> <a href="<%=Cafedetail.getMap()%>"><%=Cafedetail.getMap() %></a></p>
              
             <%--   <a href="/listTableCafe?namecafe=<%=Cafedetail.getNameCafe()%>"><button type="button" class="button1">Table in the Cafe</button></a>
            --%>

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
