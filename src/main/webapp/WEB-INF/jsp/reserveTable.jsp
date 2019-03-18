<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*"%>
<%@ page import="project.com.entity.*"%>
<%@page import="java.sql.Timestamp"%>
<%@ page import="java.text.*" %>
<%
SimpleDateFormat sm = new SimpleDateFormat("HH:mm");
	BoardGame boardGame = (BoardGame) request.getAttribute("boardGame");
	Member member = (Member) session.getAttribute("mem");
	TableCafe tableCafe = (TableCafe) request.getAttribute("tableCafe");
	Timestamp timestamp = new Timestamp(System.currentTimeMillis());
	String timeS = sm.format(timestamp.getTime());
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
                      <form name="frm" action="/doReserveTable" method="post">
                        <fieldset><legend align="center"><h1><b>Reserve Table :</b></h1></legend>
                          <div class="form-group row">
                            <label  class="col-sm-4 col-form-label"><h2><b>BoardGame Name :</b></h2></label>
                            <div class="col-sm-4">
                              <input type="text" class="form-control"  name="nameBoardGame" value="<%=boardGame.getNameBoardGame()%>" readonly>
                              <input type="hidden" class="form-control"  name="idBoardGame" value="<%=boardGame.getIdBoardGame()%>" readonly>
                            </div>
                          </div>
                          
                          <div class="form-group row">
                            <label class="col-sm-4 col-form-label"><h2><b>BoardGame Details :</b></h2></label>
                            <div class="col-sm-4">
                              <input type="text" class="form-control"  name="gmaeDetail" value="<%=boardGame.getGameDetail()%>" readonly>
                            </div>
                          </div>                     
                         
                         <div class="form-group row">
                            <label class="col-sm-4 col-form-label"><h2><b>Table No. :</b></h2></label>
                            <div class="col-sm-4">
                              <input type="text" class="form-control"  name="numberTable" value="<%=tableCafe.getNumberTable() %>" readonly>
                              <input type="hidden" class="form-control"  name="idTable" value="<%=tableCafe.getIdTable() %>" readonly>
                            </div>
                          </div><div class="form-group row">
                            
                          <div class="form-group row">
                            <label class="col-sm-4 col-form-label"><h2><b>&nbsp;&nbsp;&nbsp;&nbsp;Reservetion Time:</b></h2></label>
                            <div class="col-sm-4">
                              <input type="time" class="form-control"  name="timeres" required="required">
                            </div>
                          </div>
                          <div class="form-group row">
                            <div class="col-sm-12" align="center">
                              <button type="submit" class="btn btn-primary" ><span class="glyphicon glyphicon-pencil" aria-hidden="true"  ></span>Reserve Table</button>
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
