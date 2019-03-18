<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*"%>
<%@ page import="project.com.entity.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%Cafe mem = (Cafe)session.getAttribute("email");
SimpleDateFormat datefor = new SimpleDateFormat("dd-MM-yyyy");
String status = (String)request.getAttribute("status"); %>
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
				<%if (status.equals("1")){ %>
				<div class="alert alert-success" role="alert">
  					Save the new Event Successfully.
				</div>
				<%} %>
				<%if(status.equals("0")){ %>
				<div>
				 Welcome to Create New Event
				</div>
				<%} %>
              <tr>
                  <td>
                      <form name="frm" action="/doCreateEvent" method="post" enctype="multipart/form-data">
                        <fieldset><legend align="center"><h1><b>Create Event :</b></h1></legend>
                          <div class="form-group row">
                            <label  class="col-sm-4 col-form-label"><h2><b>Event Name :</b></h2></label>
                            <div class="col-sm-4">
                              <input type="text" class="form-control"  name="nameEvent" placeholder="nameEvent">
                              <input type="hidden" class="form-control"  name="nameCafe" value="<%=mem.getEmail()%>">
                            </div>
                          </div>
                          
                          <div class="form-group row">
                            <label class="col-sm-4 col-form-label"><h2><b>Event Detail :</b></h2></label>
                            <div class="col-sm-4">
                             <textarea class="form-control" name="detailEvent" placeholder="detail"></textarea>
                            </div>
                          </div>
                          
                          <div class="form-group row">
                            <label class="col-sm-4 col-form-label"><h2><b>EventDate :</b></h2></label>
                            <div class="col-sm-4">
                           
                              <input type="text" class="form-control" name="eventDate" placeholder="dd-mm-yyyy" required="required">

                            </div>
                          </div>    
                          <div class="form-group row">
                            <label class="col-sm-4 col-form-label"><h2><b>Start Time :</b></h2></label>
                            <div class="col-sm-4">
                              <input type="time" class="form-control" name="startTime" required="required">
                          
                            </div>
                          </div>                           
                           <div class="form-group row">
                            <label class="col-sm-4 col-form-label"><h2><b>Entry Fee :</b></h2></label>
                            <div class="col-sm-4">
                              <input type="text" class="form-control"  name="price" placeholder="price">
                            </div>
                          </div>
                            
                           <div class="form-group row">
                            <label class="col-sm-4 col-form-label"><h2><b>Quality:</b></h2></label>
                            <div class="col-sm-4">
                              <input type="number" class="form-control"  name="qtyPeopleEvent" placeholder="qtyPeopleEvent" min="0" max="50">
                            </div>
                          </div>
                          <div class="form-group row">
                                <label class="col-sm-4 col-form-label"><h2><b>Picture :</b></h2></label>
                                <div class="col-sm-4">
                                  <input type="file" class="form-control" name="file" placeholder=".jpg or .png" required="required"><p>Recommend Size 250*250 px</p>
                                </div>
                              </div>               
                          <div class="form-group row">
                            <div class="col-sm-12" align="center">
                              <button type="submit" class="btn btn-primary" onClick="return validate(frm)"><span class="glyphicon glyphicon-pencil" aria-hidden="true"  ></span>ADD Event</button>
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
	
	if(frm.nameEvent.value == ""){
		alert("Pleace input nameEvent");
		return false ;
	}
	 if(!regexLetter.test(frm.nameEvent.value)){
			alert("Please fill in English");
			return false ;
		}
	
	if(frm.detailEvent.value == ""){
		alert("Pleace input detailEvent");
		return false ;
	}
	if(!regexLetter.test(frm.detailEvent.value)){
		alert("Please fill in English");
		return false ;
	}
	
	if(frm.dateStart.value == ""){
		alert("Pleace input dateStart");
		return false ;
	}
	if(frm.dateEnd.value == ""){
		alert("Pleace input dateEnd");
		return false ;
	}
	
	if(frm.qtyPeopleEvent.value == ""){
		alert("Pleace input qtyPeopleEvent");
		return false ;
	}
	if(isNaN(frm.qtyPeopleEvent.value)){
		alert("Please fill in the numbers.");
		return false ;
	}
	
	
}
</script>

</html>
