<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*"%>
<%@ page import="project.com.entity.*"%>
<%List<Member> listmem = (List<Member>)request.getAttribute("listMem"); %>
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

						<table class="cart">
							<thead>
								<tr>
									<th class="product-name">List Owner</th>
									<th align="right"><a href="/createOwner"><button
												type="button" class="button1">Create Owner</button></a></th>
								</tr>
							</thead>							
							<tbody>							
							<table class="table">															
								<thead>
									<tr>
										<th scope="col">Name</th>
										<th scope="col">Address</th>
										<th scope="col">Email</th>
										<th scope="col">Status</th>


									</tr>
								</thead>

								<%for(Member m : listmem){ %>
								<%if (!m.getStatus().equals("admin")) {%>
								<tbody>
									<tr>
										<td><%=m.getName()%></td>
										<td><%=m.getAddress() %></td>
										<td><%=m.getEmail() %></td>
										<td><%=m.getStatus() %></td>
										<td><a href="deleteMember?email=<%=m.getEmail()%>"> <%if (m.getStatus().equals("owner")) {%>
												<button type="button" class="btn btn-danger" onclick="return confirm('Do you want remove Owner?')">Delete
													Owner</button> <%} %> <%if (m.getStatus().equals("member")) {%>
												<button type="button" class="btn btn-danger" onclick="return confirm('Do you want remove Member?')">Delete
													Member</button> <%} %>
										</a></td>
									</tr>
								</tbody>
								<%} %>
								<% } %>
								
							</table>						
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



</html>
