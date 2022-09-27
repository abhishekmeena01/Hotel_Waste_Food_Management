<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.HashMap"%>
        <% 
            try{
            
            //counter=0;
                HashMap h=(HashMap)session.getAttribute("UserDetails");
                //System.out.println("HII"+h);
                //System.out.println((String)h.get("name"));
        if(h!=null){
        DB.DatabaseClass db=(DB.DatabaseClass)application.getAttribute("DBConn");
                if(db==null){
                    db=new DB.DatabaseClass(); 
                    application.setAttribute("DBConn", db);
                }
  %>
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
        <li><a href="index.jsp" style="color:white;text-decoration:none"><i class='fas fa-angle-left' style='font-size:25px'></i>Back</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a href="logout.jsp" style="color:white;text-decoration:none">Sign Out <i class="fas fa-sign-out-alt"></i></a></li>
    </div></div>
      </ul>
        </nav>
            <%
                    String m=(String)session.getAttribute("msg");
                    if(m!=null){
                  %>
                  <div class="alert alert-info text-capitalize text-center  " role="alert">
                      <p><%=m%></p></div>
                    <%   
                        session.setAttribute("msg",null);
                    }
                    %>
        <center><h3 style="color:red">Check For Donated Items</h3></center>
        	<form action="seeAllDonation" method="post" role="form" style="margin-left:20px;margin-right: 20px"><b>		
                     <div class="form-row">                 
    <div class="form-group col-md-4">
      <label for="inputDonate">Select the donated Item</label>
      <select id="inputDonate" class="form-control" name="donate">
        <option value="Food" selected>Food</option> 
        <option value="Clothes">Clothes</option> 
        <option value="Medicines">Medicines</option> 
        <option value="Money">Money</option> 
      </select>
    </div>
       </div>
                        
                        <button type="submit" name="Submit" class="btn btn-success"> Submit</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="reset" name="reset"class="btn btn-info"> Clear</button>
                        
                    </b> </form>
        <br/><br/><br/>
        <table style="margin-left:70px;margin-right:70px;">
            <tbody>
                <tr><td>
                    
                   
                <img src="https://www.syllad.com/wp-content/uploads/2020/05/Help.jpg"style="width:300px;height:300px"/></div> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <img src="https://images.moneycontrol.com/static-mcnews/2021/10/donation.jpg?impolicy=website&width=770&height=431"style="width:300px;height:300px"/></div> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <img src="https://imgmedia.lbb.in/media/2019/11/5ddd09c236294a4669728c8f_1574767042852.jpg"style="width:300px;height:300px"/></div> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <img src="https://www.success.com/wp-content/uploads/legacy/sites/default/files/1_22.jpg"style="width:300px;height:300px"/></div> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td></tr>
            </tbody>
        </table>
        <br/><br/>
                <!--  <form action="seeAllDonation" method="post" role="form">
                         <Label> Select the donated Item</label>
                        <select name="donate"> 
                        <option value="Food">Food</option> 
                        <option value="Clothes">Clothes</option> 
                        <option value="Medicines">Medicines</option> 
                        <option value="Money">Money</option> 
                        </select>   
                        <button type="submit" name="Submit" class="btn btn-success"> Submit</button>
                        <button type="reset" name="reset"class="btn btn-info"> Clear</button>
                    </form>
                    

                      <form action="seeMyDonation" method="post" role="form">
                      <input type="hidden" name="email" value=""/>
                        <button type="submit" name="Submit"> see my donations</button>
                        <button type="reset" name="reset"> Clear</button>
                        </form>
                  -->
 <%
}else
{
session.setAttribute("msg","Login First");
response.sendRedirect("index.jsp");
}
}catch(Exception e){
e.printStackTrace();
}
%>  
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
                    <p class="text-center" style="font-size:1.5em;">Design and Developed By<b> <i>Kartik Singh</i></b></p>
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