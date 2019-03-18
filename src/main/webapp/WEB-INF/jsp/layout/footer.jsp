<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="project.com.entity.*"%>
<%@page import="java.util.*"%>
<%ArrayList<Cafe> listCafe = (ArrayList<Cafe>)session.getAttribute("listCafe"); %>
<%Member mem = (Member)session.getAttribute("mem"); %>
  <div class="site-footer">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="widget">
						<h3 class="widget-title">Board Game Cafe</h3>
						<ul class="no-bullet">
						<%for(Cafe listC : listCafe){ %>
							<li><a href="/viewCafe?nameCafe=<%=listC.getNameCafe() %>"><%=listC.getNameCafe() %></a></li>
							<%} %>
						</ul>
					</div> <!-- .widget -->
				</div> <!-- column -->

				<div class="col-md-3">
					<div class="widget">
						<h3 class="widget-title">My Account</h3>
						<ul class="no-bullet">
							<li><a href="/register">Register</a></li>
							<%if(mem != null){ %>
							<li><a href="/editProfile">Edit Profile</a></li>
							<%if (mem != null && mem.getStatus().equals("member")){%>
							<li><a href="/listMyReserveEvent">Event History</a></li>
							<li><a href="/listReserveTable">Reserve Table History</a></li>
							<%} %>
							<li><a href="/doLogout">Logout</a></li>
							<%} %>
						</ul>
					</div> <!-- .widget -->
				</div> <!-- column -->

				<div class="col-md-5">
					<div class="widget">
						<h3 class="widget-title">Contact</h3>
						<ul class="no-bullet">
							<li><b>Tel : </b> 052 016 003 (English & French & Thai)</li>
							<li><b>Address : </b> 555/151 Fifth Avenue Ruam Chok Nong Jom,Sansai Chiang Mai 50210</li>
							<li><b>Map : </b> <a href="https://goo.gl/maps/Lnn9aquGjL12"> https://goo.gl/maps/Lnn9aquGjL12</a></li>
							<li><b>Facebook : </b> <a href="Facebook.com/GoldenGoblinGames">Facebook.com/GoldenGoblinGames</a></li>
							<li><b>Web : </b><a href="https://www.goldengoblingames.com/">https://www.goldengoblingames.com/</a> </li>

						</ul>
					</div> <!-- .widget -->
				</div> <!-- column -->


			</div><!-- .row -->

			<div class="colophon">
				<div class="copy">Copyright 2018 Chiang Mai BoardGame . </div>
				<div class="social-links square">
					<a href="#"><i class="fa fa-facebook"></i></a>
					<a href="#"><i class="fa fa-twitter"></i></a>
					<a href="#"><i class="fa fa-google-plus"></i></a>
					<a href="#"><i class="fa fa-pinterest"></i></a>
				</div> <!-- .social-links -->
			</div> <!-- .colophon -->
		</div> <!-- .container -->
	</div> <!-- .site-footer -->