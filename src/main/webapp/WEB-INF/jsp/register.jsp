<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*"%>
<%@ page import="project.com.entity.*"%>
<%String status = (String)request.getAttribute("status"); %>
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
					<%if(status.equals("2")){ %>
				<div class="alert alert-danger" role="alert">
  					Error : Please Register .
				</div>
				<%} %>
					<%if (status.equals("1")){ %>
				<div class="alert alert-danger" role="alert">
  					Error : Please Register again.
				</div>
				<%} %>
				<%if(status.equals("0")){ %>
				<div>
				 Welcome to Create New BoardGame 
				</div>
				<%} %>
				

              <tr>
                  <td>
                      <form name="frm" action="/doregister" method="post">
                        <fieldset><legend align="center"><h1><b>Register :</b></h1></legend>
                          <div class="form-group row">
                            <label  class="col-sm-4 col-form-label"><h2><b>Name :</b></h2></label>
                            <div class="col-sm-4">
                              <input type="text" class="form-control"  name="name" placeholder="Name">
                            </div>
                          </div>
                          
                          <div class="form-group row">
                            <label class="col-sm-4 col-form-label"><h2><b>Phone Number :</b></h2></label>
                            <div class="col-sm-4">
                              <input type="text" class="form-control"  name="phone" placeholder="@example 080-12345xx">
                            </div>
                          </div>
                        
                          <div class="form-group row">
                              <label class="col-sm-4 col-form-label"><h2><b>Email :</b></h2></label>
                              <div class="col-sm-4">
                                <input type="Email" class="form-control" name="email" placeholder="@example example@gmail.com">
                              </div>
                            </div>
                            
                             <div class="form-group row">
                              <label class="col-sm-4 col-form-label"><h2><b>Address :</b></h2></label>
                              <div class="col-sm-4">
                                <textarea  class="form-control"  name="address" placeholder="Address"></textarea>
                              </div>
                            </div>
                     
                            <div class="form-group row">
                              <label class="col-sm-4 col-form-label"><h2><b>Password :</b></h2></label>
                              <div class="col-sm-4">
                                <input type="password" class="form-control"  name="password" placeholder="password">
                              </div>
                            </div>
                 
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label"><h2><b>Confirm Password :</b></h2></label>
                                <div class="col-sm-4">
                                  <input type="password" class="form-control" name="password2" placeholder="Confirm password">
                                </div>
                              </div>
                 
                          <div class="form-group row">
                            <div class="col-sm-12" align="center">
                              <button type="submit" class="btn btn-primary" onClick="return validate(frm)"><span class="glyphicon glyphicon-pencil" aria-hidden="true"  ></span>Register</button>
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
	
	var regexLetter = /[a-zA-z]/;
	if(frm.name.value == ""){
		alert("Pleace input name");
		return false ;
	}
	if(!regexLetter.test(frm.name.value)){
		alert("Please fill in English");
		return false ;
	}
	
	if(frm.phone.value == ""){
		alert("Pleace input phoneNumber");
		return false ;
	}
	
	if(frm.email.value == ""){
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

	
	if(frm.password.value == ""){
		alert("Pleace input password");
		return false ;
	}
	if(frm.password2.value == ""){
		alert("Pleace input Confirmpassword");
		return false ;
	}

}
</script>

</html>
