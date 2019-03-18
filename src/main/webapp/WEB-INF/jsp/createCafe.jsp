<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*"%>
<%@ page import="project.com.entity.*"%>
<%Cafe mem = (Cafe)session.getAttribute("email");  %>
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
                       <form action="/doCreateCafe" method="post" enctype="multipart/form-data">
                        <fieldset><legend align="center"><h1><b>Create Cafe :</b></h1></legend>
                          <div class="form-group row">
                            <label  class="col-sm-4 col-form-label"><h2><b>Name Cafe :</b></h2></label>
                            <div class="col-sm-4">
                              <input type="text" class="form-control" name="nameCafe" placeholder="Cafe Name" value="<%=mem.getNameCafe()%>" readonly="readonly">
                            </div>
                          </div>
                          
                          <div class="form-group row">
                            <label class="col-sm-4 col-form-label"><h2><b>Cafe Details :</b></h2></label>
                            <div class="col-sm-4">
                              <textarea class="form-control" name="about" placeholder=" example contact"></textarea>
                            </div>
                          </div>
                       <div class="form-group row">
                            <label class="col-sm-4 col-form-label"><h2><b>Open Time :</b></h2></label>
                            <div class="col-sm-4">
                              <input type="time" class="form-control" name="timeOpen" placeholder="Work Time"required="required">
                            </div>
                          </div>
                          <div class="form-group row">
                            <label class="col-sm-4 col-form-label"><h2><b>Closed Time :</b></h2></label>
                            <div class="col-sm-4">
                              <input type="time" class="form-control" name="timeClosed" placeholder="Work Time" required="required">
                            </div>
                          </div>
                          <div class="form-group row">
                              <label class="col-sm-4 col-form-label"><h2><b>Location :</b></h2></label>
                              <div class="col-sm-4">
                                <input type="text" class="form-control" name="map" placeholder="https://www.google.com/maps/@xx.xxxxx,xx.xxxxx">
                              </div>
                            </div>
                           
                            <div class="form-group row">
                              <label class="col-sm-4 col-form-label"><h2><b>Address :</b></h2></label>
                              <div class="col-sm-4">
                                <textarea class="form-control" name="address" placeholder=" "></textarea>
                              </div>
                            </div>
                            <div class="form-group row">
                              <label class="col-sm-4 col-form-label"><h2><b>Tel :</b></h2></label>
                              <div class="col-sm-4">
                                <input type="text" class="form-control" name="tel" placeholder="000-000-0000"/>
                              </div>
                            </div>
                           <div class="form-group row">
                            <label  class="col-sm-4 col-form-label"><h2><b>Email Cafe :</b></h2></label>
                            <div class="col-sm-4">
                              <input type="email" class="form-control" name="email" value="<%=mem.getEmail() %>" placeholder="email" readonly="readonly">
                            </div>
                          </div>
                            
                              <div class="form-group row">
                            <label  class="col-sm-4 col-form-label"><h2><b>Rate Fee :</b></h2></label>
                            <div class="col-sm-4">
                              <input type="text" class="form-control" name="price" placeholder="example 30/hr.">
                            </div>
                          </div>
                          
                              <div class="form-group row">
                                <label class="col-sm-4 col-form-label"><h2><b>Cafe Logo :</b></h2></label>
                                <div class="col-sm-4">
                                  <input type="file" class="form-control" name="logo" placeholder=".jpg or .png" required="required"><p>Recommend Size 250*250 px</p>
                                </div>
                              </div>
                              
                            
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label"><h2><b>Photos :</b></h2></label>
                                <div class="col-sm-4">
                                  <input type="file" class="form-control" name="file" placeholder=".jpg or .png" multiple required="required"><p>Recommend Size 250*250 px</p>
                                </div>
                              </div>
                              
                           <div class="form-group row">
                            <div class="col-sm-12" align="center">
                              <button type="submit" class="btn btn-primary" onClick="return validate(frm)" ><span class="glyphicon glyphicon-pencil" aria-hidden="true"  ></span>ADD Cafe</button>
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
<script type ="text/javascript">
function validate(frm){
var regexLetter = /[a-zA-z0-9]/;

	if(frm.nameCafe.value == ""){
		alert("Pleace input nameCafe"); //เช็คค่าว่าง
		return false ;
	}
	  if(!regexLetter.test(frm.nameCafe.value)){
		alert("Please fill in English");
		return false ;
	}
	
	
	if(frm.about.value == ""){
		alert("Pleace input Cafe Details");
		return false ;
	}
	if(frm.tel.value == ""){
		alert("Pleace input tel");
		return false ;
	}
	 if(!regexLetter.test(frm.about.value)){
			alert("Please fill in English");
			return false ;
		}
	
	
	
	if(frm.map.value == ""){
		alert("Pleace input map");
		return false ;
	}
	
	if(frm.map.value == ""){
		alert("Pleace input email");
		return false ;
	}
	
	if(frm.address.value == ""){
		alert("Pleace input address");
		return false ;
	}
	
	if(!regexLetter.test(frm.address.value)){
		alert("Please fill in English");
		return false ;
	}

	
	
	if(isNaN(frm.priceOfHr.value)){
		alert("Please fill in the numbers.");
		return false ;
	}
	
	

}
</script>

</html>
