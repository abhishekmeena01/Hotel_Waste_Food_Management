<%@page import="java.util.HashMap"%>
<%
    HashMap h=(HashMap)session.getAttribute("UserDetails");
    if(h!=null){
    session.setAttribute("msg","Please Login Again");
        session.invalidate();
    }
    
    response.sendRedirect("index.jsp");
%>
