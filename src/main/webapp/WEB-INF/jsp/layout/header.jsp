<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="project.com.entity.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%SimpleDateFormat sm = new SimpleDateFormat("dd-MM-yyyy");%>
<%-- DecimalFormat decimalFormat = new DecimalFormat("0.00");%> --%>
<%Member mem = (Member)session.getAttribute("mem"); %>
<%String nameCafe = (String)session.getAttribute("nameCafe");  %>
<%Cafe cafeEmail = (Cafe)session.getAttribute("email");  %>
<%ArrayList<Event> listEvent = (ArrayList<Event>)session.getAttribute("listEvent"); 
Date c = new Date();	
String NowDate = sm.format(c.getYear());
%>
<div class="right-section pull-right">
	
		<%if(cafeEmail==null&&mem == null){ %>
			<a href="#" class="login-button">Login</a>
			<a href="/register">Register</a>
	<%} %>
			<% if (mem != null && (!(mem.getStatus().equals("")))){%>
				<a href="/editProfile?email=<%=mem.getEmail()%>" ><%= mem.getName()%></a>
				<input type="hidden" name="email"value="<%=mem.getEmail()%>">
				<a href="/doLogout">Logout</a>
			<%} else if (cafeEmail != null && (!(cafeEmail.getNameOwner().equals("")))){%>
				<a href="/editProfile?email=<%=cafeEmail.getEmail()%>" ><%= cafeEmail.getNameOwner()%></a>
				<input type="hidden" name="email"value="<%=cafeEmail.getEmail()%>">
				<a href="/doLogout">Logout</a>
			<%}else{ %>
				<a href="#"></a>
			<%} %>
</div>
<!-- .right-section -->
<div class="main-navigation">
	<button class="toggle-menu">
		<i class="fa fa-bars"></i>
	</button>
	<ul class="menu">
		<li class="menu-item home"><a href="/"><i
				class="glyphicon glyphicon-home"></i></a></li>
		<li class="menu-item"><a href="/searchboardgame">BoardGame</a></li>
		<li class="menu-item"><a href="/listEvent">Event</a></li>
		<li class="menu-item"><a href="/listCafe">Cafe</a></li>
		<%if(cafeEmail!=null){ %>
		<div class="dropdown">
			<li class="menu-item"><a href="#" class="dropbtn">Cafe Management</a></li>
				<div class="dropdown-content">
				<%if(cafeEmail.getAddress()==null){ %>
				<a href="/createCafe">Cafe</a>
				<%}else{ %>
				<a href="/editCafe">Cafe</a>
				<%} %>
				<a href="/listBoardGame">Boardgame</a>
					<a href="/listEvent">Event</a> 
					<a href="/listTableCafe">Table</a>
					<a href="/listupdateTableCafe?status=1">UpdateStatusTable</a>
				<%} %>
		<c:if test="${mem != null && mem.getStatus().equals('member')}">
			<div class="dropdown">
				<li class="menu-item"><a href="#" class="dropbtn">MyReservetion</a></li>
				<div class="dropdown-content">
					<a href="/listMyReserveEvent">Event</a> 
					<a href="/listReserveTable">Table</a>
				</div>
			</div>
		</c:if>
		<c:if test="${mem != null && mem.getStatus().equals('admin')}">
			<li class="menu-item"><a href="/listAllMember">List All Member</a></li>
		</c:if>
	</ul>
	<!-- .menu -->
	<div class="search-form"></div>
	<!-- .search-form -->

</div>
<!-- .main-navigation -->
</div>
<!-- .container -->
</div>
<!-- .site-header -->

<div class="home-slider">
	<ul class="slides">
<%for(Event e : listEvent){ %>	
<%if(e.getEventDate().after(c)||e.getEventDate().equals(c)){ %>
		<li data-bg-image="images/back.jpg" >
			<div class="container">
				<div class="slide-content">
					<h2 class="product-title"style="color: #fff;"><b><%=e.getNameEvent() %></b></h2>
					<%-- <%String price = decimalFormat.format(e.getPrice()); %> --%>
					<h4 class="product-title" style="color: #32CD32;"><b>Entry Fee :</b> <%=e.getPrice() %> </h4>
					<%String eventdate = sm.format(e.getEventDate()); %>
					<p style="color: #fff;"><b>EventDate :</b> <%=eventdate %></p>
					<p style="color: #fff;"><b>Hurry : &nbsp; <%=e.getQuatity() %> &nbsp;seat left !  </b></p>
					<h5 style="color: #fff;"><b><%=e.getCafe().getNameCafe() %></b></h5>
					<c:if test="${mem != null}">
					<a href="/doviewEvent?idEvent=<%=e.getIdEvent()%>" class="button">Detail Event</a>
					</c:if>
				</div>
				<img src="image/EventImg/<%=e.getPictureEvent() %>" class="slide-image"style="width:400px;height:350px;">			
			</div>
		</li>
		<%} %>
	<%} %>	
	</ul>
	<!-- .slides -->
</div>
<!-- .home-slider -->


<div class="auth-popup popup">
	<a href="#" class="close"><i class="fa fa-times"></i></a>
	<div class="row">
		<div class="col-md-12">
			<h2 class="section-title">Login</h2>
			<form action="/doLogin" method="post">
				<input type="text" name="email" class="form-control"
					placeholder="Email......"
					onBlur="javascript:if(this.value==''){this.value=this.defaultValue;}"
					onFocus="javascript:if(this.value==this.defaultValue){this.value='';}">

				<input type="password" name="password" class="form-control"
					placeholder="Password......"
					onBlur="javascript:if(this.value==''){this.value=this.defaultValue;}"
					onFocus="javascript:if(this.value==this.defaultValue){this.value='';}">


				<button class="btn btn-primary" type="submit">
					<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
					Login
				</button>

			</form>
		</div>
		<!-- .column -->
	</div>
	<!-- .row -->
</div>
<!-- .auth-popup -->