<%-- 
    Document   : index
    Created on : 17-Apr-2022, 2:08:50 PM
    Author     : Kartik
--%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
        crossorigin="anonymous">
	<link rel="stylesheet" href="https://kit-free.fontawesome.com/releases/latest/css/free.min.css" media="all">
	<link href="https://fonts.googleapis.com/css?family=Merriweather&display=swap" rel="stylesheet">
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css'>
    <style>
        #myimg:hover { 
        transform: scale(1.2); 
    }
    </style>
    <script type="module" src="./index.js"></script>
    <style>
      

</style>
</head>
	<body style="background-color:white">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">Aiding India <i class="fab fa-angellist"></i>
</a>
            
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home<span class="sr-only">(current)</span></a>
                    </li>
                     <li class="nav-item">
                         <p id="demo"></p>
                       <li><a href="#" class="btn btn-default btn-rounded mb-4" data-toggle="modal" data-target="#modalLocation" style="color:white" onclick="getLocation()">Location </a></li>

 <div class="modal" id="modalLocation">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">See Your Current Location</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">                    
<div id="mapholder"></div>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCXozFNsQbVU-Xh6pIZRYN0CLK1KqQexYg&callback=myMap"></script>

<script>
var x = document.getElementById("demo");
function getLocation() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition, showError);
  } else { 
    x.innerHTML = "Geolocation is not supported by this browser.";
  }
}

function showPosition(position) {
  var lat = position.coords.latitude;
  var lon = position.coords.longitude;
  var latlon = new google.maps.LatLng(lat, lon)
  var mapholder = document.getElementById('mapholder')
  mapholder.style.height = '250px';
  mapholder.style.width = '450px';

  var myOptions = {
    center:latlon,zoom:14,
    mapTypeId:google.maps.MapTypeId.ROADMAP,
    mapTypeControl:false,
    navigationControlOptions:{style:google.maps.NavigationControlStyle.SMALL}
  }
    
  var map = new google.maps.Map(document.getElementById("mapholder"), myOptions);
  var marker = new google.maps.Marker({position:latlon,map:map,title:"You are here!"});
}

function showError(error) {
  switch(error.code) {
    case error.PERMISSION_DENIED:
      x.innerHTML = "User denied the request for Geolocation."
      break;
    case error.POSITION_UNAVAILABLE:
      x.innerHTML = "Location information is unavailable."
      break;
    case error.TIMEOUT:
      x.innerHTML = "The request to get user location timed out."
      break;
    case error.UNKNOWN_ERROR:
      x.innerHTML = "An unknown error occurred."
      break;
  }
}

</script>

        </div>

       
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>

      </div>
    </div>
  </div>
                </li> 
                    
                        </ul>
        <ul class="nav navbar-nav navbar-right">
            <div class="main">
    <div class="panel">
        <form action="login.jsp" method="post" role="form">
        <div class="modal fade" id="modalLoginForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">Sign in</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        
      <div class="modal-body mx-3">
        <div class="md-form mb-5">
            
          <i class="fas fa-envelope prefix grey-text"></i>
          <label data-error="wrong" data-success="right" for="defaultForm-email">Your email</label>
          <input type="email" id="email" name="email" class="form-control validate" required="">
          
        </div>

        <div class="md-form mb-4">
          <i class="fas fa-lock prefix grey-text"></i>
          <label data-error="wrong" data-success="right" for="defaultForm-pass">Your password</label>
          <input type="password" name="pass" id="pass" class="form-control validate">
          
        </div>

      </div>
      <div class="modal-footer d-flex justify-content-center">
        <button type="submit" class="btn btn-success" style="color:white;">Login</button><br/>
        <button type="reset" class="btn btn-default pull-left">Reset</button>
<button class="btn btn-default"><a href="" class="btn btn-default btn-rounded mb-4" data-toggle="modal" data-target="#modalRegisterForm">New User Sign Up</a></button>
<!--<button class="btn btn-default"><a href="" class="btn btn-default btn-rounded mb-4" data-toggle="modal" data-target="#modalforgetpassword">Forgot Password</a></button>-->
      </div>
    </div>
  </div>
</div>
        </form>
        <!--
<form action="ForgetPassword" method="post" role="form">
<div class="modal fade" id="modalforgetpassword" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">Forget Password</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-3">
        <div class="md-form mb-5">
          <i class="fas fa-envelope prefix grey-text"></i>
          <label data-error="wrong" data-success="right" for="defaultForm-email">Your email</label>
          <input type="email" id="email" name="email" class="form-control validate">
          
        </div>

      </div>
      <div class="modal-footer d-flex justify-content-center">
        <button type="submit" class="btn btn-success" style="color:white;">Enter</button><br/>
      </div>
    </div>
  </div>
</div>
    </form>
        -->
<form action="Registration" method="post" role="form">
<div class="modal fade" id="modalRegisterForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold" style="font-size:27px;">Sign up</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        
      <div class="modal-body mx-3">
        <div class="md-form mb-5">
          <i class="fa fa-user" aria-hidden="true"></i>
          <label data-error="wrong" data-success="right" for="orangeForm-name">Your name</label>
          <input type="text" id="name" name="name" class="form-control validate">
          </div>
        <div class="md-form mb-5">
          <i class="fas fa-envelope prefix grey-text"></i>
          <label data-error="wrong" data-success="right" for="orangeForm-email">Your email</label>
          <input type="email" id="email" name="email" class="form-control validate">
        </div>

        <div class="md-form mb-4">
          <i class="fa fa-lock" aria-hidden="true"></i>
          <label data-error="wrong" data-success="right" for="orangeForm-pass">Your password</label>
          <input type="password" id="pass" name="pass" class="form-control validate">
          
        </div>
 <div class="md-form mb-4">
          <i class="fa fa-phone" aria-hidden="true"></i>
          <label data-error="wrong" data-success="right" for="orangeForm-pass">Your Phone Number</label>
          <input type="text" id="phone" name="phone" pattern="^[_0-9]{1,}$" maxlength="10" minlength="10" class="form-control validate">
          
        </div>
         <div class="md-form mb-4">
          <i class="fa fa-building" aria-hidden="true"></i>
          <label data-error="wrong" data-success="right" for="orangeForm-pass">Your City</label>
        
          <input type="text" id="city" name="city" class="form-control validate">
        </div>  
      </div>
      <div class="modal-footer d-flex justify-content-center">
        <button class="btn btn-primary" type="submit" >Sign up</button>
        <button class="btn btn-danger" type="reset" >Reset</button>
      </div>
    </div>

  </div>
</div>
</form>
        <li><a href="#" class="btn btn-default btn-rounded mb-4" data-toggle="modal" data-target="#modalLoginForm" style="color:white">SignIn <i class="fas fa-user-alt"></i>/ SignUp <i class="fas fa-user-plus"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a href="logout.jsp" style="color:white;text-decoration:none">Sign Out <i class="fas fa-sign-out-alt"></i></a></li>
    </div></div>
      </ul>
        </nav>
        

        <div class="bg1-success">
        	<div class="bg-about">
            <center>

                <canvas id="mycanvas" width="40" height="0" style="border-top:1px solid; color:#404040"></canvas>
                    <i class="fa fa-cog fa-spin" style="color:#404040"></i>
                    <canvas id="mycanvas" width="40" height="0" style="border-top:1px solid;color:#404040"></canvas>
                        </center> 
            <br>

            <div class="container-fluid">
                <div class="row" style="background-color:#535353; color:white;">
                    <div class="col-sm-6 about">
            
                            
                        <img class="d-block img-fluid sense" src="https://images.unsplash.com/flagged/photo-1567002349727-f1d1dcdab101?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80" class="img_responsive" alt="img2" style="width:40em;height:27em; margin-left:1em;margin-right:1em;margin-top:1em;margin-bottom:1em;">
  
     
                    </div>

                    <div class="col-md-6" style="background-color:#535353; color:white;">
                    
                    	<center><br/><br/><br/>
                    	<h1 style="font-size:200%;color:white" class="mt-xl-5">FOOD AND AID FOR SOUL</h1>
                        <br/><br/>
                        <h3> Change the ending to someone's story</h3>
                    	<h4>Making lives of less priviledged better</h4>
                    	</center>
                    </div>
                </div></div>

            
             <center>

                <canvas id="mycanvas" width="40" height="0" style="border-top:1px solid; color:#404040"></canvas>
                    <i class="fa fa-cog fa-spin" style="color:#404040"></i>
                    <canvas id="mycanvas" width="40" height="0" style="border-top:1px solid;color:#404040"></canvas>
                        </center> 
            <br><br></div></div>
<%
                    String m=(String)session.getAttribute("msg");
                    //HashMap h=(HashMap)session.getAttribute("UserDetails");
                    //System.out.println("index page"+h.get("name"));
                    if(m!=null){
                  %>
                  <div class="alert alert-info text-capitalize text-center  " role="alert">
                      <p><%=m%></p></div>
                    <%   
                        session.setAttribute("msg",null);
                    }
                    %>
        			<div class="container-fluid col-lg-12">
        				<div class="row">
        					<!--<div class="col-md-4"></div>-->
        					<div class="col-md-6">
        						<center>
        						<br/><br/><h1 class="mydesign"><b>ABOUT US</b></h1><br/></center>
        						<p class="parahdesign" style="margin-right:1em;margin-left:1em;"> 
                                    A lot of people in India wish to live a decent life having food to eat, clothes to wear, footwears,medicines etc. On the other hand their are priviledged people like us who have plenty of supplies and tend to find it difficult where to dispose them.
                                    Here, we aim to provide one stop solution to this problem by providing information of the areas that needs help.
                                    We tend to make it easier for the organisations and people associated with social causes to know about the areas where people are deprived of the basic amenities, so that they can provide aid there.
                                    We aim to make it accessible to NGO's and people associated with social cause to know wherever their is abundance of food and less mouths to eat, so that they can contact them and give the food to the needy.
                                    We tend to make it open for all whoever wants to make one life better by giving off the tem they do not use nay further
                                   <!-- WE TEND TO MAKE IT OPEN FOR ALL WHOEVER WANTS TO MAKE ONE LIFE BETTER BY GIVING OFF THE ITEM THEY DO NOT USE ANY FURTHER.
                                   -->
</p>
        						
        					
        					</div>
        					
        					<div class="col-md-6">
        						<img src="https://www.ctvnews.ca/polopoly_fs/1.2435652.1435056274!/httpImage/image.jpg_gen/derivatives/landscape_1020/image.jpg" alt="myimage" style="width:45em;height:25em;margin-right:2em;"/>
        					</div>
        				</div>
        			</div>

<br/><br/><br/>
        		
<div class="bg-cust">
	<br/><br/>
        	<div class="container-fluid ">
        		<div class="row" style="background-color:#77bbbb;padding: 30px; margin-top: 10px; margin-bottom: 10px;font-size: 20px;color:white;">
        			<div class="col-md-1">
        			</div>
        			<div class="col-md-2">
        				<a href="feed.jsp" style="color:white">
        				<img src="https://understandingcompassion.com/wp-content/uploads/2017/11/Help-feed-the-hungry.jpg" alt="my" width="250px" height="250px" class="thumbnail" id="myimg"></a><br/><br/>
        				<div class="center"><center><b>Feed the Hungry</b></center></div>
        			</div>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<div class="col-md-2">
        				<a href="feed.jsp" style="color:white"class="thumbnail">
        				<img src="https://moneycrashers-sparkchargemedia.netdna-ssl.com/wp-content/uploads/2011/12/kolkata-october-26-a-girl-child.jpg" alt="my2" width="250px" height="250px"id="myimg" />
        			</a>
                    <br/><br/>
        				<div class="center"><center><b>Give your old clothes a second chance</b></center></div>
        			</div>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<div class="col-md-2">
        				<a href="feed.jsp" style="color:white">
        				<img src="https://www.buzzworthy.com/wp-content/uploads/2015/04/growshoes-970x546.jpg" alt="my2" width="250px" height="250px" class="thumbnail"id="myimg"/>
        			</a><br/><br/>
        				<div class="center"><center><b>Soles for Souls</b></center></div>
        			</div>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        			<div class="col-md-2">
        				<a href="feed.jsp" style="color:white">
        				<img src="https://th.bing.com/th/id/R.0dcb60acdb1b6f3a736c15bdbf648348?rik=QqGBuAyj3Ee6jg&riu=http%3a%2f%2fwww.pure-chemical.com%2fblog%2fwp-content%2fuploads%2f2015%2f07%2fmedicines.jpg&ehk=XUStflloet8EXNZB2%2fzJyUtzv2I556CrYao9S%2fUdEzM%3d&risl=&pid=ImgRaw&r=0" alt="my2" width="250px" height="250px" class="thumbnail"id="myimg"/>
        			</a><br/><br/>
        				<div class="center"><center><b>Help the Needy</b></center></center></div>

        			</div>
        			<div class="col-md-1">
        			</div>
        		</div>
        		<br/>
        		<br/>
         <div style="background-color:#404040;color:white;padding:1em;">
        <footer>
            <div class=" ufooter ">
                <div class="container ">
                    <div class="row  ">
                        <h5>For any Queries:-</h5>
                        <div class=" col-sm-4  ufooter-a text-center">
                            <p><i class="fas fa-phone-alt"></i> &nbsp;&nbsp;0101010101</p>
                        </div>
                        
                        
                        <div class=" col-sm-4 padding10 ufooter-a text-center">
                               <p>  
                                <a href="http://www.facebook.com/" target="new"><i class="fab fa-facebook-square fa-3x" style="background-color:white;width:1em;"></i></a>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="http://www.twitter.com/" target="new"><i class="fab fa-twitter-square fa-3x" style="background-color:white;width:1em;"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="https://plus.google.com/" target="new"><i class="fab fa-google-plus-square fa-3x" style="background-color:white;width:1em;"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="https://www.linkedin.com/" target="new"><i class="fab fa-linkedin fa-3x" style="background-color:white;width:1em;"></i></a>
                                
                             </p>
                        </div>
                    </div>
                </div>
            </div>
            
       
           <div class="row">
                <div class="col-md-12">
                    <p class="text-center" style="font-size:1.5em;"><b> <i></i></b></p>
                </div>
           </div>
        
        </footer></div>
          <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
        <script src="includes/js/modernizr-2.6.2.min.js"></script>
        
  <script>
                      
    $(document).ready(function(){
        // Open modal on page load
        //$("#modalLoginForm").modal('show');
 
        // Close modal on button click
        $(".btn").click(function(){
            $("#modalLoginForm").modal('hide');
        });
    });
    $(document).ready(function(){
        // Open modal on page load
        //$("#modalRegisterForm").modal('show');
 
        // Close modal on button click
        $(".btn").click(function(){
            $("#modalRegisterForm").modal('hide');
        });
    });
    $(document).ready(function(){
        // Open modal on page load
        //$("#modalforgetpassword").modal('show');
 
        // Close modal on button click
        $(".btn").click(function(){
            $("#modalforgetpassword").modal('hide');
        });
    });
</script>
	</body>
	</html>