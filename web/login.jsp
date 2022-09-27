
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%  String e=request.getParameter("email");
    String password=request.getParameter("pass");
    DB.DatabaseClass db1=(DB.DatabaseClass)application.getAttribute("DBConn");
    if(db1==null){
        db1=new DB.DatabaseClass(); 
        application.setAttribute("DBConn", db1);
    }
    ResultSet rs=db1.checkLogin(e, password);
    if(rs!=null){
        //System.out.println(rs);
        //System.out.println("hello");
        HashMap h=new HashMap();
        h.put("name",rs.getString(3));
        h.put("email",rs.getString(1));
        h.put("phone",rs.getString(4));
        h.put("city",rs.getString(5));
        session.setAttribute("UserDetails",h);
        session.setAttribute("msg","Login Successful");
        response.sendRedirect("index.jsp");
          
    }
    
    else{
        
        session.setAttribute("msg","Please login First");
        response.sendRedirect("index.jsp");
    }
%>
