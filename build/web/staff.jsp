<%-- 
    Document   : index
    Created on : Mar 2, 2019, 9:12:01 AM
    Author     : Administrator
--%>

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
        if(session.getAttribute("ULOGIN")==null)
        {
            response.sendRedirect("index.jsp");
        }
        if(!session.getAttribute("UTYPE").toString().equals("staff"))
        {
            response.sendRedirect("index.jsp");
        }
        Connection con=(Connection)session.getAttribute("CON");
        PreparedStatement stmt;
        ResultSet rs;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Toll Plaza</title>
        
    </head>
    <body>
        <img src="images/banner.jpg" width="100%" height="250px"><hr>
        <div style="width:15%; height:300px; background-color: lavender; float: left">
            <a href="staff.jsp">Home</a><hr>
            <a href="inentry.jsp">In Entry</a><hr>
            <a href="outentry.jsp">Out Entry</a><hr>
            <a href="logout.jsp">Logout</a><hr>
        </div>
        <div style="width:84%;background-color: antiquewhite; float: right">            
            <center><h2>Select an Activity from Left Side</h2></center>
        </div>
        <img src="images/footer.jpg" width="100%" height="200px">
    </body>
</html>
