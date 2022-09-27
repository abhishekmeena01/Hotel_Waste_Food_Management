<%-- 
    Document   : feed
    Created on : 18-Apr-2022, 5:04:53 PM
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
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <style>
        #myimg:hover { 
        transform: scale(1.2); 
    }
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
                    
                        </ul>
        <ul class="nav navbar-nav navbar-right">
            <div class="main">
    <div class="panel">
        <li><a href="index.jsp" style="color:white;text-decoration:none"><i class='fas fa-angle-left' style='font-size:25px'></i> Back</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a href="logout.jsp" style="color:white;text-decoration:none">Sign Out <i class="fas fa-sign-out-alt"></i></a></li>
    </div></div>
      </ul>
        </nav><br/><br/>
            <%
                    String m=(String)session.getAttribute("msg");
                    HashMap h=(HashMap)session.getAttribute("UserDetails");
                    System.out.println("feed page"+h.get("name"));
                    if(m!=null){
                  %>
                  <div class="alert alert-info text-capitalize text-center  " role="alert">
                      <p><%=m%></p></div>
                    <%   
                        session.setAttribute("msg",null);
                    }
                    %>
                    
        			<div class="col-md-12 container-fluid bg-about">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-3 about" style="border-style:groove">
                        <div class="border-0">
            <h2 style="color:red"><i class="fas fa-hand-point-right"></i>LET'S DONATE</h2>
            <h3>Aiding India Initiative is pleased to help</h3>
            <p> Your one foot forward can make a huge difference in someone else's life</p>
            <p> Aiding India gives you a platform to be of help to the need.</p>
            <p>Give your old stuffs a second chance</p>
            <h4 class="alert"style="color:red;"><i class="fas fa-hand-point-right"></i>Be the change you want to See</h4>
            <p> Click Below to make the Donations</p>
                <form action="donateFood.jsp" method="post" role="form">
                        <button type="submit" class="btn btn-success" style="color:white">Click here to Donate</button>
                        <br/><br/>
                 </form>
                       </div>
                    </div>
                    <div class="col-sm-3 about"style="border-style:groove">
                        <h2 style="color:red"><i class="fas fa-hand-point-right"></i>Donation Box</h2>
                        <br/>
                        <h6><i>There are many ways to push for much-needed reforms: One way is to make a donation. It doesn't matter much whether you contribute publicly or in a private way - either way is good. What matters is your true intention.</i>
                        </h6><!-- comment -->
                            <h6 style="text-align: left">- Lee Min-ho</h6>
                            <div class="col-lg-1">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuR3oXrJncm3__y1q8vJUJFtcxUF01okv3zA&usqp=CAU"/>
                        </div>
                            <p> See the donations made so far.</p>
                        
                        <form action="seeDonation.jsp" method="post" role="form">
                        <button type="submit" class="btn btn-success" style="color:white">Click here to View Donations</button>
                        </form>
                </div>
                    <div class="col-sm-3 about"style="border-style:groove">
                        <h2 style="color:red"><i class="fas fa-hand-point-right"></i>Raise a Request</h2>
                        <br/>
                        <h4> Aiding India is happy to help those in Need.</h4>
                        <p> Providing you with a platform where you can not only make Donations but can ask for it too</p><!-- comment -->
                        <p> "Help provided in any form is a Help". This is our Moto</p>
                        <p> </p>
                  <h4 class="alert"style="color:red;"><i class="fas fa-hand-point-right"></i>No act of kindness, however small, is ever wasted</h4>
                        <p> Click here to raise a request</p>
                        
                        <form action="raiseRequest.jsp" method="post" role="form">
                        <button type="submit" class="btn btn-success" style="color:white">Raise Request</button>
                        </form>
                </div>
                    <div class="col-sm-3 about"style="border-style:groove">
                        <h2 style="color:red"><i class="fas fa-hand-point-right"></i>Request Queue</h2>
                        <br/>
                        <h6> It is not how much we give but how much love we put into giving.</h6>
                        <p> For it is in the giving that we receive.</p>
                        <p>We can't help everyone but everyone can help someone</p>
                        
                            <div class="col-lg-1">
                            <img src="https://images.unsplash.com/photo-1488521787991-ed7bbaae773c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cG9vciUyMHBlb3BsZXxlbnwwfHwwfHw%3D&w=1000&q=80" style="width:300px;height:200px"/>
                        </div>
                            <p> See the Request Being made.</p>
                        
                         <form action="seeAllRequests.jsp" method="post" role="form">
                        <button type="submit" class="btn btn-success" style="color:white">View Requests</button>
                        </form>
                        <br/>
                        
                </div>
                    
                    
            </div></div>
                                    <br/><br/>
        <div style="background-color:#404040;color:white;padding:10px;">
        <footer>
            <div class=" ufooter ">
                <div class="container ">
                    <div class="row  ">
                        <h6>For any Queries:-</h6>
                        <div class=" col-sm-4  ufooter-a text-center">
                            <p><i class="fas fa-phone-alt"></i> &nbsp;&nbsp;0101010101</p>
                        </div>
                        
                        
                        <div class=" col-sm-4 padding5 ufooter-a text-center">
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
                    <p class="text-center" style="font-size:1em;">Design and Developed By<b> <i>Kartik Singh</i></b></p>
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
 
	</body>
	</html>