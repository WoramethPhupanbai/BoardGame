<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*"%>
<%@ page import="project.com.entity.*"%>
<%@ page import="java.text.*" %>
<%@page import="java.text.DecimalFormat"%>
<%
	Event event = (Event) request.getAttribute("event");
	Member member = (Member) session.getAttribute("mem");
	Date c = new Date();	
	DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
	String datenow = (String) session.getAttribute("datenow");
	String eventDate = df.format(event.getEventDate());
%>

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

				<table class="cart" align="center">

					<tbody>

              <tr>
                  <td>
                      <form name="frm" action="/doReserveEvent" method="post">
                        <fieldset><legend align="center"><h1><b>Reserve Event :</b></h1></legend>
                          <div class="form-group row">
                            <label  class="col-sm-4 col-form-label"><h2><b>Event Name :</b></h2></label>
                            <div class="col-sm-4">
                              <input type="text" class="form-control"  name="nameEvent" value="<%=event.getNameEvent()%>" readonly>
                            </div>
                          </div>
                          
                          <div class="form-group row">
                            <label class="col-sm-4 col-form-label"><h2><b>Event Detail :</b></h2></label>
                            <div class="col-sm-4">
                              <input type="text" class="form-control"  name="detail" value="<%=event.getDetailEvent()%>" readonly>
                            </div>
                          </div>                     
                           <div class="form-group row">
                            <label class="col-sm-4 col-form-label"><h2><b>Qualifications Fee :</b></h2></label>
                            <div class="col-sm-4">
                              <input type="text" class="form-control"  name="price" value="<%=event.getPrice()%>" readonly>
                            </div>
                          </div>
                            
                           <div class="form-group row">
                            <label class="col-sm-4 col-form-label"><h2><b>Registrant Name:</b></h2></label>
                            <div class="col-sm-4">
                              <input type="text" class="form-control"  name="name" value="<%=member.getName()%>" readonly>
                            </div>
                          </div>
                          
                          <div class="form-group row">
                            <label class="col-sm-4 col-form-label"><h2><b>Registrant Email:</b></h2></label>
                            <div class="col-sm-4">
                              <input type="text" class="form-control"  name="email" value="<%=member.getEmail()%>"readonly >
                            </div>
                          </div>
                          
                          <div class="form-group row">
                            <label class="col-sm-4 col-form-label"><h2><b>Event Date :</b></h2></label>
                            <div class="col-sm-4">
                              <input type="text" class="form-control"  name="resDate" value="<%=eventDate%>" readonly placeholder="dd/mm/yyyy">
                            </div>
                          </div>
                                         
                          <div class="form-group row">
                            <div class="col-sm-12" align="center">
                              <button type="submit" class="btn btn-primary" ><span class="glyphicon glyphicon-pencil" aria-hidden="true"  ></span>Reserve Event</button>
                            </div>
                          </div>
                        </fieldset>
                        </form>
                       
                  </td>
                </tr>
					</tbody>
				</table>
				<!-- .cart -->
			</div>
		</div>
		<!-- .container -->
			</main> <!-- .main-content -->

			<jsp:include page="layout/footer.jsp"/>
		</div>

		<div class="overlay"></div>

		

		<script src="js/jquery-1.11.1.min.js"></script>
		<script src="js/plugins.js"></script>
		<script src="js/app.js"></script>
		
	</body>
	


</html>
