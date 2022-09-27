/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Classes;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import static oracle.net.aso.C00.u;
@MultipartConfig
@WebServlet(name = "ForgetPassword", urlPatterns = {"/ForgetPassword"})
public class ForgetPassword extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=null;
        try {
                out= response.getWriter(); 
                String e=request.getParameter("email");
                ServletContext application=getServletContext();
           DB.DatabaseClass db1 = (DB.DatabaseClass)application.getAttribute("DBConn");
    if(db1==null){
        db1=new DB.DatabaseClass(); 
        application.setAttribute("DBConn", db1);
    }
                
                HttpSession session=request.getSession();
                 System.out.println("Before try"+db1);
            try{
                System.out.println("just inside try");
                     String s1=e;
                     ResultSet rs=db1.viewUser(s1);
                     System.out.println(rs);
                     String na=rs.getString("Name");
                     String em=rs.getString("email");
                     String pass=rs.getString("password");
             
                  System.out.println(em);
               if(rs!=null)
               {
                     System.out.println(rs+"inside rs. null");
                       final String aemail="TweetySingh77777@gmail.com";
                       final String apass="Tweety@20";
                       String semail=s1;
                       
                       String SUB="PlaceHawk!!   Welcomes U...";
                       
                       String BODY="<!DOCTYPE html> <html> <head> <title>Aiding India</title> <script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\" integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\" crossorigin=\"anonymous\"></script> <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js\" integrity=\"sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49\" crossorigin=\"anonymous\"></script> <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js\" integrity=\"sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy\" crossorigin=\"anonymous\"></script> <script src=\"includes/js/modernizr-2.6.2.min.js\"></script> <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css\" integrity=\"sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO\" crossorigin=\"anonymous\"> <link rel=\"stylesheet\" href=\"https://kit-free.fontawesome.com/releases/latest/css/free.min.css\" media=\"all\"> </head> <body> <div class=\"container\"> <div class=\"row\"> <div class=\"col-lg-6\"> <h1 style=\"color:#006600\">PlaceHawk<i class=\"fab fa-angellist\"></i></h1> <p><b>Hii,"+rs.getString("Name")+"</b></p> <h3>Login Details:</h3> <p><b>Email= "+semail+"</b></p> <p><b>Password= "+rs.getString("Password")+"</b></p>\n" +
"\n" +
" <p>Thank you for registering on Aiding India.Please note that only a valid user can avail benefits on Aiding India and explore better options</p> <p>If you are facing any issue please contact on details given at the bottom of the website</p> <p>Many Thanks,<br/> Team Aiding India</p> </div> </div> </div> </body> </html>";
                      
                       Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");  
        properties.put("mail.smtp.socketFactory.port", "587"); 
        
        properties.put("mail.smtp.socketFactory.class","jakarta.net.ssl.SSLSocketFactory");  
        properties.put("mail.smtp.auth", "true");  
        properties.put("mail.smtp.port", "587");
        javax.mail.Session ses = javax.mail.Session.getInstance(properties,    
            new javax.mail.Authenticator() {  
             protected javax.mail.PasswordAuthentication getPasswordAuthentication() {  
             return new javax.mail.PasswordAuthentication(aemail, apass); } 
            });  
        
        
            javax.mail.Message message=new javax.mail.internet.MimeMessage(ses);
            message.setFrom(new javax.mail.internet.InternetAddress(aemail));
            message.setRecipients(javax.mail.Message.RecipientType.TO, javax.mail.internet.InternetAddress.parse(semail));
            message.setSubject(SUB);
            message.setContent(BODY,"text/html" );

            javax.mail.Transport.send(message);
            session.setAttribute("msg","Password Sent!!   Check your registered Email ID");
response.sendRedirect("index.jsp");
           
          
}
               else{
      session.setAttribute("msg","Email Id is NOT Registered. Plz SignUp First!");
        response.sendRedirect("index.jsp");
    }            
            }catch(Exception ex){
            ex.printStackTrace();
            session.setAttribute("msg","Mail send Failed! Please Register First");
           response.sendRedirect("index.jsp");

}
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }


    }   
}
