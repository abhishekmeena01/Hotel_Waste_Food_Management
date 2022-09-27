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
                System.out.println("See all donation jsp ke ander hu main");
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
        <li><a href="index.jsp" style="color:white;text-decoration:none"><i class='fas fa-angle-left' style='font-size:25px'></i> Back</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
        		<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Phone</th>
      <th scope="col">Address lane 1</th>
      <th scope="col">Address Lane 2</th>
      <th scope="col">Landmark</th>
      <th scope="col">City</th>
      <th scope="col">State</th>
      <th scope="col">pin</th>
      <th scope="col">Type of Donation</th>
      <th scope="col">Amount</th>
      <th scope="col">Description</th>
      <th scope="col">Date</th>
    </tr>
  </thead>
  <tbody>	
                    <%
            //String c=request.getParameter("donate");
            //System.out.println(c);
            HashMap h4=(HashMap)session.getAttribute("AllDonations");
            
            ResultSet rs=db.viewAllDonations((String)h4.get("item"));
            while(rs.next()){
            %>
              
                        
    <tr>
      <td><%=rs.getString("Name")%></td>
      <td><%=rs.getString("email")%></td>
      <td><%=rs.getString("phone")%></td>
      <td><%=rs.getString("address1")%></td>
      <td><%=rs.getString("address2")%></td>
      <td><%=rs.getString("landmark")%></td>
      <td><%=rs.getString("city")%></td>
      <td><%=rs.getString("state")%></td>
      <td><%=rs.getString("pin")%></td>
      <td><%=rs.getString("item")%></td>
      <td><%=rs.getString("amount")%></td>
      <td><%=rs.getString("comments")%></td>
      <td><%=rs.getString("time")%></td>
      
    </tr>
    <%}%>
  </tbody>
</table>
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