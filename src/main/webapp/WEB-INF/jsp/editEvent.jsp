<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*"%>
<%@ page import="project.com.entity.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	Event event = (Event) request.getAttribute("event");
SimpleDateFormat time = new SimpleDateFormat("HH:mm");
SimpleDateFormat sm = new SimpleDateFormat("dd-MM-yyyy");
%>
<%
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
									Event Successfully.</div>
								<%
									}
								%>
								<%
									if (status.equals("0")) {
								%>
								<div>Welcome to Update Event</div>
								<%
									}
								%>
              <tr>
                  <td>
                      <form name="frm" action="/doEditEvent" method="post" enctype="multipart/form-data">
                        <fieldset><legend align="center"><h1><b>Edit Event :</b></h1></legend>
                          <div class="form-group row">
                            <label  class="col-sm-4 col-form-label"><h2><b>Event Name :</b></h2></label>
                            <div class="col-sm-4">
                              <input type="text" class="form-control"  name="nameEvent" value="<%=event.getNameEvent()%>">
                               <input type="hidden" class="form-control"  name="idEvent" value="<%=event.getIdEvent()%>">
                            </div>
                          </div>
                          
                          <div class="form-group row">
                            <label class="col-sm-4 col-form-label"><h2><b>Event Detail :</b></h2></label>
                            <div class="col-sm-4">
                            <textarea class="form-control" name="detailEvent" placeholder="detail"><%=event.getDetailEvent()%></textarea>
                             </div>
                          </div>
                         
                          <div class="form-group row">
                            <label class="col-sm-4 col-form-label"><h2><b>EventDate :</b></h2></label>
                            <div class="col-sm-4">
                              <input type="date" class="form-control"  name="eventDate" value='<%=event.getEventDate()%>' required="required">
                            </div>
                          </div>
                          <%-- <%String TimeStart =sm.format(event.getStartTime());  %> --%>
                          <div class="form-group row">
                            <label class="col-sm-4 col-form-label"><h2><b>Start Time :</b></h2></label>
                            <div class="col-sm-4">
                              <input type="time" class="form-control" name="startTime" value='<%=event.getStartTime() %>' required="required">
                          
                            </div>
                          </div>
                                           
                           <div class="form-group row">
                            <label class="col-sm-4 col-form-label"><h2><b>Entry Fee :</b></h2></label>
                            <div class="col-sm-4">
                              <input type="text" class="form-control"  name="price" value="<%=event.getPrice()%>">
                            </div>
                          </div>
                            
                           <div class="form-group row">
                            <label class="col-sm-4 col-form-label"><h2><b>Quality:</b></h2></label>
                            <div class="col-sm-4">
                              <input type="text" class="form-control"  name="qtyPeopleEvent" value="<%=event.getQuatity()%>">
                            </div>
                          </div>
                                 <div class="form-group row">
                            <div class="col-sm-4">
                              <img alt="" width="200" height="200" src="Image/EventImg/<%=event.getPictureEvent() %>">
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
                              <button type="submit" class="btn btn-primary" onClick="return validate(frm)"><span class="glyphicon glyphicon-pencil" aria-hidden="true"  ></span>Save Event</button>
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
	if(frm.nameEvent.value == ""){
		alert("Pleace input nameEvent");
		return false ;
	}
	if(frm.detail.value == ""){
		alert("Pleace input detail");
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
	if(frm.price.value == ""){
		alert("Pleace input price");
		return false ;
	}
	if(frm.qtyPeopleEvent.value == ""){
		alert("Pleace input qtyPeopleEvent");
		return false ;
	}
	
}
</script>

</html>
