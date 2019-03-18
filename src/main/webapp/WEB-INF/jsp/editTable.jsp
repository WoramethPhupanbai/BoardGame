<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*"%>
<%@ page import="project.com.entity.*"%>
<%
	TableCafe table = (TableCafe) request.getAttribute("TableID");
	Cafe mem = (Cafe) session.getAttribute("email");
%>
<%
	String status = (String) request.getAttribute("status");
%>
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
								<div class="alert alert-success" role="alert">Update 
									Table Successfully.</div>
								<%
									}
								%>
								<%
									if (status.equals("0")) {
								%>
								<div>Welcome to Update Table</div>
								<%
									}
								%>
								<tr>
									<td>
										<form name="frm" action="/doEditTable" method="post">
											<span>
												<div class="label1">
													<label>Zone or Floor : </label><input type="text"
														name="zone" value="<%=table.getZone() %>" readonly
														style="width: 100px; margin-right: 50px; margin-left: 20px;">
													<label>Table No.: </label><input type="text"
														name="tables" value="<%=table.getNumberTable() %>"
														readonly
														style="width: 100px; margin-right: 50px; margin-left: 20px;">
														</br>
													<label>StatusTable : </label> <select name="Status" style="width: 100px; margin-right: 50px; margin-left: 20px;" required>
														<option value="Normal">Normal</option>
														<option value="Reserved">Reserved</option>
														<option value="Repair">Repair</option>
													</select> 
													<label>Number of seats : </label>
													<%if(table.getChair()==0){ %>
													<input type="text"name="seats"style="width: 100px; margin-right: 50px; margin-left: 20px;">
													<%} %>
													<%if(table.getChair()!=0){ %>
													<input type="text"name="seats" value="<%=table.getChair()%>" style="width: 100px; margin-right: 50px; margin-left: 20px;">
													<%} %>
													<input type="hidden"name="idTable"value="<%=table.getIdTable()%>">
													<button type='submit' class="btn btn-primary"
														onClick="return validate(frm)">
														<span class="glyphicon glyphicon-floppy-disk"
															aria-hidden="true"></span> Save Table
													</button>
												</div>
											</span> <br>
											</fieldset>
										</form>
									</td>
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

</script>

</html>
