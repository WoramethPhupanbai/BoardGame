<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*"%>
<%@ page import="project.com.entity.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%Cafe cafe = (Cafe)request.getAttribute("cafe");%>
<%
SimpleDateFormat sm = new SimpleDateFormat("HH:mm");
	String status = (String) request.getAttribute("status");
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
<%
									if (status.equals("1")) {
								%>
								<div class="alert alert-success" role="alert">Update 
									Cafe Successfully.</div>
								<%
									}
								%>
								<%
									if (status.equals("0")) {
								%>
								<div>Welcome to Update Cafe</div>
								<%
									}
								%>
              <tr>
                  <td>
                       <form name="frm" action="/doEditCafe" method="post" enctype="multipart/form-data">
                        <fieldset><legend align="center"><h1><b>Edit Cafe :</b></h1></legend>
                          <div class="form-group row">
                            <label  class="col-sm-4 col-form-label"><h2><b>Cafe Name :</b></h2></label>
                            <div class="col-sm-4">
                              <input type="text" class="form-control" name="nameCafe" value="<%=cafe.getNameCafe() %>"readonly="readonly">
                            </div>
                          </div>
                          
                          <div class="form-group row">
                            <label class="col-sm-4 col-form-label"><h2><b>Cafe About :</b></h2></label>
                            <div class="col-sm-4">
                              <textarea class="form-control" name="about"><%=cafe.getAbout() %></textarea>
                            </div>
                          </div>
                          <%String TimeOpen =sm.format(cafe.getTimeOpen());  %>
                      <div class="form-group row">
                            <label class="col-sm-4 col-form-label"><h2><b>TimeOpen :</b></h2></label>
                            <div class="col-sm-4">
                              <input type="time" class="form-control" name="timeOpen" value='<%=TimeOpen %>' placeholder="Work Time">
                            </div>
                          </div>
                          <%String TimeClose =sm.format(cafe.getTimeClosed());  %>
                          <div class="form-group row">
                            <label class="col-sm-4 col-form-label"><h2><b>TimeClosed :</b></h2></label>
                            <div class="col-sm-4">
                              <input type="time" class="form-control" name="timeClosed" value='<%=TimeClose %>' placeholder="Work Time">
                            </div>
                          </div>
                          <div class="form-group row">
                              <label class="col-sm-4 col-form-label"><h2><b>Map :</b></h2></label>
                              <div class="col-sm-4">
                                <input type="text" class="form-control" name="map" value='<%=cafe.getMap()%>'>
                              </div>
                            </div>
                           
                            <div class="form-group row">
                              <label class="col-sm-4 col-form-label"><h2><b>Address :</b></h2></label>
                              <div class="col-sm-4">
                                <textarea class="form-control" name="address"><%=cafe.getAddress() %></textarea>
                              </div>
                            </div>
                           <div class="form-group row">
                              <label class="col-sm-4 col-form-label"><h2><b>Tel :</b></h2></label>
                              <div class="col-sm-4">
                                <input type="text" class="form-control" name="tel" value="<%=cafe.getTel()%>"placeholder="000-000-0000"/>
                              </div>
                            </div>
                           <div class="form-group row">
                            <label  class="col-sm-4 col-form-label"><h2><b>Cafe Email :</b></h2></label>
                            <div class="col-sm-4">
                              <input type="email" class="form-control" name="email" value="<%=cafe.getEmail() %>" readonly="readonly">
                            </div>
                          </div>
                             
                              <div class="form-group row">
                            <label  class="col-sm-4 col-form-label"><h2><b>Price :</b></h2></label>
                            <div class="col-sm-4">
                              <input type="text" class="form-control" name="price" value="<%=cafe.getPrice() %>">
                            </div>
                          </div>
                          <div class="product-thumbnail">
									<img src="Image/CafeImg/<%=cafe.getProfilepictureCafe()%>" alt="" width="100px"height="100px">
								</div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label"><h2><b>Logo Cafe :</b></h2></label>
                                <div class="col-sm-4">
                                  <input type="file" class="form-control" name="logo" placeholder=".jpg or .png" required="required"><p>Recommend Size 250*250 px</p>
                                </div>
                              </div>
                              <%-- <div class="product-thumbnail">
									<img src="Image/CafeImg/<%=picturecCafe.getPictureCafe()%>" alt="" width="100px"height="100px">
								</div> --%>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label"><h2><b>Picture :</b></h2></label>
                                <div class="col-sm-4">
                                  <input type="file" class="form-control" name="file" placeholder=".jpg or .png" multiple required="required"><p>Recommend Size 250*250 px</p>
                                </div>
                              </div>
                              
                           <div class="form-group row">
                            <div class="col-sm-12" align="center">
                              <a href="/doEditCafe?nameCafe=<%=cafe.getNameCafe() %>"><button type="submit" class="btn btn-success" ><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"  ></span>Save Cafe</button></a>
                               <a href="/deleteCafe?nameCafe=<%=cafe.getNameCafe() %>"><button type="button" class="btn btn-danger" ><span class="glyphicon glyphicon-remove" aria-hidden="true"  ></span>Remove Cafe</button></a>
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
