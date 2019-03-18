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
				<%if (status.equals("1")){ %>
				<div class="alert alert-success" role="alert">
  					Save the new Board Game Successfully.
				</div>
				<%} %>
				<%if(status.equals("0")){ %>
				<div>
				 Welcome to Create New BoardGame 
				</div>
				<%} %>
              <tr >
                  <td>
                      <form name="frm" action="/doCreateBoardGame" method="post" enctype="multipart/form-data">
                        <fieldset><legend align="center"><h1><b>Create Boardgame :</b></h1></legend>
                          
                          <div class="form-group row">
                            <label class="col-sm-4 col-form-label"><h2><b>Boardgame Name :</b></h2></label>
                            <div class="col-sm-4">
                              <input type="text" class="form-control"  name="nameBoardGame" placeholder="BoardgameName">
                            </div>
                          </div>
                        
                          <div class="form-group row">
                              <label class="col-sm-4 col-form-label"><h2><b>Boardgame Detail :</b></h2></label>
                              <div class="col-sm-4">
                                <textarea  class="form-control"  name="gameDetail" placeholder="BoardgameDetail"></textarea>
                              </div>
                           </div>
                           <div class="form-group row">
                              <label class="col-sm-4 col-form-label"><h2><b>Min Time :</b></h2></label>
                              <div class="col-sm-4">
                              <input type="number" class="form-control" name="minTime" required="required" min="1" max="240"> Minute.
                              </div>
                           </div>
                           <div class="form-group row">
                              <label class="col-sm-4 col-form-label"><h2><b>Max Time:</b></h2></label>
                              <div class="col-sm-4">
                              <input type="number" class="form-control" name="maxTime" required="required" min="1"> Minute.
                               
                              </div>
                           </div>
                           <div class="form-group row">
                              <label class="col-sm-4 col-form-label"><h2><b>Min Players :</b></h2></label>
                              <div class="col-sm-4">
                              <input type="number" class="form-control"  name="minPeople" placeholder="qtyPeopleEvent" min="1" max="6">
                                
                              </div>
                           </div>
                           <div class="form-group row">
                              <label class="col-sm-4 col-form-label"><h2><b>Max Players :</b></h2></label>
                              <div class="col-sm-4">
                              
                               <input type="number" class="form-control"  name="maxPeople" placeholder="qtyPeopleEvent" min="2" max="10">
                              </div>
                           </div>
                             <div class="form-group row">
                              <label class="col-sm-4 col-form-label"><h2><b>Suggested Age :</b></h2></label>
                              <div class="col-sm-8">
                                <select name="ageBoardGame">
                                <option value="0+">0+</option>
                                  <option value="8+">8+</option>
                                  <option value="10+">10+</option>
                                  <option value="12+">12+</option>
                                  <option value="14+">14+</option>
                                  <option value="16+">16+</option>
                                  <option value="18+">18+</option>
                                </select>
                              </div>
                            </div>
                            
                            <div class="form-group row">
                              <label class="col-sm-4 col-form-label"><h2><b>StatusBoardGame :</b></h2></label>
                              <div class="col-sm-8">
                                <select name="statusBoardGame">
                                <option value="Normal">Normal</option>
                                  <option value="Repair">Repair</option>
                                  <option value="Reserve">Reserve</option>
                                </select>
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
                              <button type="submit" class="btn btn-primary" onClick="return validate(frm)"><span class="glyphicon glyphicon-pencil" aria-hidden="true"  ></span>Add BoardGame</button>
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

	if(frm.categoryboardgame.value == ""){
		alert("Pleace input categoryboardgame"); //เช็คค่าว่าง
		return false ;
	}
	  if(!regexLetter.test(frm.categoryboardgame.value)){
		alert("Please fill in English ");
		return false ;
	}
	
	
	if(frm.boardgamename.value == ""){
		alert("Pleace input boardgamename");
		return false ;
	}
	 if(!regexLetter.test(frm.boardgamename.value)){
			alert("Please fill in English");
			return false ;
		}
	
	
	
	if(frm.boardgamedetail.value == ""){
		alert("Pleace input boardgamedetail");
		return false ;
	}
	if(!regexLetter.test(frm.boardgamedetail.value)){
		alert("Please fill in English");
		return false ;
	}

	
	if(frm.numberofplayers.value == ""){
		alert("Pleace input numberofplayers");
		return false ;
	}
	
	

}
</script>

</html>
