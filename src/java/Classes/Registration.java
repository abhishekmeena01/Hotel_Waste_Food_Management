
package Classes;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Properties;
import javax.mail.*;
import javax.mail.Message;
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
import jakarta.servlet.http.HttpServletRequest;
import static oracle.net.aso.C00.u;
@MultipartConfig
@WebServlet(name = "Registration", urlPatterns = {"/Registration"})
public class Registration extends HttpServlet {

   
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException,RuntimeException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=null;
        try {
                out = response.getWriter(); 
                System.out.println("Inside Register . Java Start");
                String n=request.getParameter("name");
                System.out.println("Inside Register . Java " + n);
                String e=request.getParameter("email");
                System.out.println("Inside Register . Java " + e);
                String p=request.getParameter("pass");
                System.out.println("Inside Register . Java " + p);
                String ph=request.getParameter("phone");
                System.out.println("Inside Register . Java " + ph);
                String c=request.getParameter("city");
                System.out.println("Inside Register . Java " + c);
            ServletContext application=getServletContext();
           DB.DatabaseClass db1 = (DB.DatabaseClass)application.getAttribute("DBConn");
    if(db1==null){
        db1=new DB.DatabaseClass(); 
        application.setAttribute("DBConn", db1);
    }
            String s=db1.insertUser(e,p,n,ph,c);
            System.out.println("Inside Register . Java after insertion" );
            HttpSession session=request.getSession();
            System.out.println("Session created"+s);
            try{
                          String s1=e;
                          System.out.println("Before result set");
             ResultSet rs=db1.viewUser(s1);
             System.out.println("After result set"+rs);
             String na=rs.getString("Name");
             String em=rs.getString("email");
             String pass=rs.getString("password");             
                  System.out.println("project value..."+rs+" "+na+" "+em+" "+pass);
               if(rs!=null)
               {
                   /*
                       final String aemail="kartik310301@gmail.com";
                       final String apass="akshaygupta";
                       String semail=s1;
                       
                       String SUB="PlaceHawk!!   Welcomes U...";
                       
                       String BODY="<!DOCTYPE html> <html> <head> <title>Aiding India</title> <script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\" integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\" crossorigin=\"anonymous\"></script> <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js\" integrity=\"sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49\" crossorigin=\"anonymous\"></script> <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js\" integrity=\"sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy\" crossorigin=\"anonymous\"></script> <script src=\"includes/js/modernizr-2.6.2.min.js\"></script> <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css\" integrity=\"sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO\" crossorigin=\"anonymous\"> <link rel=\"stylesheet\" href=\"https://kit-free.fontawesome.com/releases/latest/css/free.min.css\" media=\"all\"> </head> <body> <div class=\"container\"> <div class=\"row\"> <div class=\"col-lg-6\"> <h1 style=\"color:#006600\">PlaceHawk<i class=\"fab fa-angellist\"></i></h1> <p><b>Hii,"+rs.getString("Name")+"</b></p> <h3>Login Details:</h3> <p><b>Email= "+e+"</b></p> <p><b>Password= "+rs.getString("password")+"</b></p>\n" +
"\n" +
" <p>Thank you for registering on Aiding India.Please note that only a valid user can apply for the benefits we offer on Aiding India platform </p> <p>If you are facing any issue please contact on details given at the bottom of the website</p> <p>Thanks and Regards,<br/> Team Aiding India</p> </div> </div> </div> </body> </html> ";
                      
                       Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");  
        properties.put("mail.smtp.socketFactory.port", "465"); 
        
        properties.put("mail.smtp.socketFactory.class","SSL_FACTORY");    
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable","true");
         properties.put("mail.smtp.socketFactory.fallback", "false");
      
        
        Session ses = Session.getDefaultInstance(properties,    
            new javax.mail.Authenticator() {  
             protected PasswordAuthentication getPasswordAuthentication() {  
             return new PasswordAuthentication(aemail, apass); } 
            });  
        
        
            Message message=new MimeMessage(ses);
            message.setFrom(new InternetAddress(aemail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(e));
            message.setSubject(SUB);
            message.setContent(BODY,"text/html" );

            Transport.send(message);
            session.setAttribute("msg","Registeration Successful , check your registered Email ID for User ID and password");
response.sendRedirect("index.jsp");
*/
           
                 session.setAttribute("msg","Registeration Successful");
response.sendRedirect("index.jsp");  
          }else
{
//session.setAttribute("msg","mail sent failed");
    session.setAttribute("msg","Registeration completed, please login in");
response.sendRedirect("index.jsp");
}  }catch(Exception ex){
            ex.printStackTrace();
            session.setAttribute("msg","Mail send Failed("+ex+")!");
           response.sendRedirect("index.jsp");

}
            
            if(s.equalsIgnoreCase("Done")){
        HashMap h=new HashMap();
        h.put("Name",n);
        h.put("email",e);
        h.put("password",p);
        h.put("Phone",ph);
        h.put("city",c);
        session.setAttribute("UserDetails",h);
       response.sendRedirect("index.jsp");
       
            }
        else if(s.equalsIgnoreCase("Registeration failed")){
        session.setAttribute("msg","Registration Failed.");
        response.sendRedirect("index.jsp");
    }else if(s.equalsIgnoreCase("Already registered")){
        session.setAttribute("msg","Already Registered User.");
        response.sendRedirect("index.jsp");
    }else if(s.equalsIgnoreCase("Exception generated")){
        session.setAttribute("msg","Registration Failed.(Exception Occured)");
        response.sendRedirect("index.jsp");
    }
        }catch(Exception e){
            e.printStackTrace();
            }
    }
}
            
         
