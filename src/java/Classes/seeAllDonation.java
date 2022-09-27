/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
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
import java.sql.ResultSet;
@MultipartConfig
@WebServlet(name = "seeAllDonation", urlPatterns = {"/seeAllDonation"})
public class seeAllDonation extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
          PrintWriter out=null;
        try {
          
            out=response.getWriter();
             HttpSession session=request.getSession();
            HashMap h=(HashMap)session.getAttribute("UserDetails");
            
if(h!=null){
          
            String item =request.getParameter("donate");
            System.out.println("SeeAlldonation java page"+item);
            ServletContext application=getServletContext();                             
           DB.DatabaseClass db1 = (DB.DatabaseClass)application.getAttribute("DBConn");       
    if(db1==null){                                                               
        db1=new DB.DatabaseClass(); 
        application.setAttribute("DBConn", db1);
    }
    ResultSet rs=db1.viewAllDonations(item);
    if(rs!=null){
        HashMap h4=new HashMap();
   h4.put("Name",rs.getString("Name"));
   h4.put("email",rs.getString("email"));
   h4.put("phone",rs.getString("phone"));
   h4.put("item",rs.getString("item"));
   
   
     session.setAttribute("AllDonations",h4);
        System.out.println("response jayega from seeAll donations page");
        //session.setAttribute("msg","All Items are being fetched");
        response.sendRedirect("seeAllDonation.jsp");
    }else{
        session.setAttribute("msg","No Item available");
        response.sendRedirect("seeDonation.jsp");
    }
                
}else{
    session.setAttribute("msg","Please Login First");
}        
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    



}
