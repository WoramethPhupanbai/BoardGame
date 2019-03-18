<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*"%>
<%@ page import="project.com.entity.*"%>
<%
	String nameCafe = (String)session.getAttribute("nameCafe");
%>
<%Cafe mem = (Cafe)session.getAttribute("email"); %>
<%
	String status = (String) request.getAttribute("status");
%>
<%List<TableCafe> listTableCafe = (List<TableCafe>) request.getAttribute("listTableCafe");%>
<%List<TableCafe> listZoneTableCafe = (List<TableCafe>) request.getAttribute("listZoneTableCafe");%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1">

<title>Chiang Mai Board Game</title>

<!-- Loading third party fonts -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link
	href="http://fonts.googleapis.com/css?family=Roboto:100,300,400,700|"
	rel="stylesheet" type="text/css">
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
				<a href="/" id="branding"> <img src="images/logo.png"
					alt="" class="logo">

				</a>
				<!-- #branding -->

				<!-- Start include -->
				<jsp:include page="layout/header.jsp" />
				<!-- End include -->


				<main class="main-content">
				<div class="container">
					<div class="page" style="color: #333;">

						<table class="cart" align="center">

							<tbody>
								<%
									if (status.equals("1")) {
								%>
								<div class="alert alert-success" role="alert">Save the new
									Table Successfully.</div>
								<%
									}
								%>
								<%
									if (status.equals("0")) {
								%>
								<div>Welcome to Create New Table</div>
								<%
									}
								%>
								<tr>
								<%int count = 0; %>
								<%for(TableCafe list : listTableCafe){ %>
								
								<%if(list.getCafe_namecafe().getNameCafe().equals(nameCafe)) {%>
								<%count ++; %>
								<%} %>
								
								<%} %>
								<%if (count == 0) { %>
									<td>								
										<form name="frm" action="/doCreateTable" method="post">
											<span>
												<div class="label1">
													<label>Zone or Floor : </label><input type="text" id="zone"
														name="zone"
														style="width: 100px; margin-right: 50px; margin-left: 20px;">
													<label>Table No. : </label><input type="text"
														id="tables" name="tables"
														style="width: 100px; margin-right: 50px; margin-left: 20px;">
													<button type='submit' class="btn btn-success"
														value='Add Button' id='addButton'
														onClick="return validate(frm)">
														<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
														ADD Table
													</button>
												</div>
											</span> <br>
											</fieldset>
										</form>
									</td>
									<%} %>
									
									<%if (count>0) { %>
									<td>	
									<%int zone=1; %>
									<%for(TableCafe list : listZoneTableCafe) {%>		
									<%int number = 0; %>
									<% if (mem.getEmail().equals(list.getCafe_namecafe().getEmail())){ %>
									<%for(TableCafe listtable : listTableCafe ){ %>																													
																		
									<%if(listtable.getZone().equals(zone+"") && mem.getEmail().equals(listtable.getCafe_namecafe().getEmail())){ %>		
									<%  number ++;   %>			
									<%}%>
									<%} %>
									<%if(number!=0){ %>
									<h4><b>Zone : </b> <%=zone %> <b>Number of tables : </b><%=number %> </h4>
									<%} %>
									<%zone++; %>									
									<%} %>
									<%}%>
										
														
										<form name="frm" action="/doCreateTable" method="post">
											<span>
												<div class="label1">
													<label>Zone or Floor : </label><input type="text" id="zone"
														name="zone"
														style="width: 100px; margin-right: 50px; margin-left: 20px;">
													<label>Table No. : </label><input type="text"
														id="tables" name="tables"
														style="width: 100px; margin-right: 50px; margin-left: 20px;">
													<button type='submit' class="btn btn-success"
														value='Add Button' id='addButton'
														onClick="return validate(frm)">
														<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
														ADD Table
													</button>
												</div>
											</span> <br>
											</fieldset>
										</form>
									</td>
									<%} %>
								</tr>
							</tbody>
						</table>
						<!-- .cart -->
					</div>
				</div>
				<!-- .container --> </main>
				<!-- .main-content -->

				<jsp:include page="layout/footer.jsp" />
			</div>

			<div class="overlay"></div>



			<script src="js/jquery-1.11.1.min.js"></script>
			<script src="js/plugins.js"></script>
			<script src="js/app.js"></script>
</body>

<script type="text/javascript">
	function validate(frm) {

		if (frm.zone.value == "") {
			alert("Pleace input zone");
			return false;
		}
		if (isNaN(frm.zone.value)) {
			alert("Please fill in the numbers.");
			return false;
		}
		if (frm.zone.value == "") {
			alert("Pleace input tables");
			return false;
		}
		if (isNaN(frm.tables.value)) {
			alert("Please fill in the numbers.");
			return false;
		}

	}
</script>

</html>
