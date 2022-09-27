
package Classes;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
@MultipartConfig
@WebServlet(name = "donateFood", urlPatterns = {"/donateFood"})

public class donateFood extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out =null;
               try {
                   HttpSession session=request.getSession();
            HashMap h2=(HashMap)session.getAttribute("UserDetails");
            System.out.println(h2);
            
if(h2!=null)
{
                   out=response.getWriter(); 
            String n=request.getParameter("name");
            String e=request.getParameter("email");
            String p=request.getParameter("phone");
            String add1=request.getParameter("add1");
            String add2=request.getParameter("add2");
            String lm=request.getParameter("landm");
            String c=request.getParameter("city");
            String state=request.getParameter("state");
            String pin=request.getParameter("pin");
            String d=request.getParameter("donate");
            //System.out.println("Shradha"+d);
            String q=request.getParameter("quantity");
            int quantity=Integer.parseInt(q);
            String comments=request.getParameter("comments");
            
                ServletContext application=getServletContext();                             
           DB.DatabaseClass db1 = (DB.DatabaseClass)application.getAttribute("DBConn");       
    if(db1==null){                                                               
        db1=new DB.DatabaseClass(); 
        application.setAttribute("DBConn", db1);
    }
    
        String rs=db1.donate(n,e,p,add1,add2,lm,c,state,pin,d,quantity,comments);
     if(rs.equalsIgnoreCase("done")){
     
     session.setAttribute("msg","Data inserted successfully");
 
   HashMap h3=new HashMap();
   h3.put("Name",n);
   h3.put("email",e);
   h3.put("phone",p);
   h3.put("address1",add1);
   h3.put("address2",add2);
   h3.put("landmark",lm);
   h3.put("city",c);
   h3.put("state",state);
   h3.put("pin",pin);
   h3.put("item",d);
   h3.put("amount",quantity);
   h3.put("comments",comments);
   
     session.setAttribute("AllDonations",h3);
     response.sendRedirect("seeAllDonation.jsp");
    
}else
     {
         session.setAttribute("msg","Data Insertion Failed");
         response.sendRedirect("donateFood.jsp");
     }
               } else
{
    System.out.println(h2);
    session.setAttribute("msg","please login first!");
    response.sendRedirect("index.jsp");
}
            
          
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    

}
//}
