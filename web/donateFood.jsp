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
        </nav><br/><br/>
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
                    <h3 style="color:red"><center> Fill This Form to Make Donations</center></h3><br/><!-- comment -->
                 
                    <form action="donateFood" method="post" role="form" style="margin-left:20px;margin-right: 20px"><b>
  <div class="form-group row"> 
      <label for="inputName"class="col-sm-2 col-form-label">Enter The Name:-</label>
      <div class="col-sm-10">
      <input type="text" class="form-control" id="name" name="name" placeholder="Name" required/>
      </div></div>
                        <div class="form-group row"> 
      <label for="inputEmail"class="col-sm-2 col-form-label">Enter The Email:-</label>
      <div class="col-sm-10">
      <input type="email" class="form-control" id="email" name="email" placeholder="Email" required/>
      </div></div>
                        <div class="form-group row"> 
      <label for="inputPhone"class="col-sm-2 col-form-label">Enter Contact Number:-</label>
      <div class="col-sm-10">
      <input type="text" class="form-control" pattern="^[_0-9]{1,}$" maxlength="10" minlength="10"  id="phone" name="phone" placeholder="Your Contact Number" required/>
      </div></div>
           <div class="form-row">
    <div class="form-group col-md-4">            
    <label for="inputAddress">Address(Lane 1 )</label>
    <input type="text" class="form-control" id="inputAddress" name="add1" placeholder="Enter HNo, Flat No">
  </div>
  <div class="form-group col-md-4">
    <label for="inputAddress2">Address(Lane 2)</label>
    <input type="text" class="form-control" id="inputAddress2" name="add2" placeholder="Building Name, Area, Street">
  </div>
               <div class="form-group col-md-4">
    <label for="inputAddress2">Landmark</label>
    <input type="text" class="form-control" id="inputAddress2" name="landm" placeholder="Nearest Landmark in Your Area ">
  </div>
                        </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputCity">City</label>
      <input type="text" class="form-control" id="inputCity" name="city" placeholder="Enter the City">
    </div>
    <div class="form-group col-md-4">
      <label for="inputState">State</label>
      <input type="text" class="form-control" id="inputState" name="state" placeholder="Enter the State">
    </div>
    <div class="form-group col-md-2">
      <label for="inputpin">PinCode</label>
      <input type="text" class="form-control" id="inputpin" name="pin" placeholder="Enter the PinCode"  pattern="^[_0-9]{1,}$" maxlength="6">
    </div>
  </div>
       <div class="form-row">                 
    <div class="form-group col-md-4">
      <label for="inputDonate">What you want to Donate</label>
      <select id="inputDonate" class="form-control" name="donate">
        <option value="Food" selected>Food</option> 
        <option value="Clothes">Clothes</option> 
        <option value="Medicines">Medicines</option> 
        <option value="Money">Money</option> 
      </select>
    </div>
       </div>
                         <div class="form-row">
    <div class="form-group col-md-6">            
    <label for="inputAmount">Amount/ Quantity</label>
    <input type="text" class="form-control" id="inputAddress" name="quantity" placeholder="Enter the Amount of Item you want to Donate">
  </div>
  <div class="form-group col-md-6">
    <label for="inputAddress2">Comments( if any ))</label>
    <input type="text" class="form-control" id="inputAddress2" name="comments" placeholder="Enter the Description of Item Donated">
  </div>
                         </div>
                        <a href="#" class="btn btn-default btn-rounded mb-4" data-toggle="modal" data-target="#qr_code" style="color:red"><i class='fas fa-qrcode' style='font-size:24px'></i> <b>Click on the icon to make payment</b></a>
                        <div class="modal fade" id="qr_code" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">Scan This QR code</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        
      <div class="modal-body mx-3">
        <div class="md-form mb-5">
            
          <img src="qr_code_new.jpeg" alt="QR code" width="400px" height="400px"/>
          
        </div>
      </div></div></div></div>
                        <br/><br/>
                        <center>
                        <button type="submit" name="Submit" class="btn btn-success"> Submit</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="reset" name="reset" class="btn btn-info"> Clear</button>
                        </center>
                        </b></form>
                    <br/>
                    <!--            
                    
                        <Label>Name </label>
                        <
                         <Label>Email ID  </label>
                        <input type="email" id="email" name="email" required/>
                         <Label>Contact Number </label>
                        <input type="text" id="phone" name="phone" required/>
                         <Label>address(lane 1) </label>
                        <input type="text" id="add1" name="add1"/>
                         <Label> address(lane 2) </label>
                        <input type="text" id="add2" name="add2"/>
                         <Label> Nearest Landmark </label>
                        <input type="text" id="landm" name="landm"/>
                         <Label> City </label>
                        <input type="text" id="city" name="city"/>
                         <Label> State </label>
                        <input type="text" id="state" name="state"/>
                         <Label> pin </label>
                        <input type="text" id="pin" name="pin"/>
                         <Label> What you want to Donate </label>
                        <select name="donate"> 
                        <option value="Food">Food</option> 
                        <option value="Clothes">Clothes</option> 
                        <option value="Medicines">Medicines</option> 
                        <option value="Money">Money</option> 
                        </select> 
                        <Label>Amount/ Quantity </label>
                        <input type="number" id="quantity" name="quantity"/>
                        <Label> Comments( if any ) </label>
                        <input type="text" id="comments" name="comments"/>   
                        <a href="#" class="btn btn-default btn-rounded mb-4" data-toggle="modal" data-target="#qr_code" style="color:blue"><i class="fa-solid fa-qrcode"></i>Click on the icon to make payment</a>
                        <div class="modal fade" id="qr_code" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">Scan This QR code</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        
      <div class="modal-body mx-3">
        <div class="md-form mb-5">
            
          <img src="qr_code.jpeg" alt="QR code" width="400px" height="400px"/>
          
        </div>
      </div></div></div></div>
                        <button type="submit" name="Submit"> Submit</button>
                        <button type="reset" name="reset"> Clear</button>
                    </form>
                  -->  
                    
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