<%-- 
    Document   : index
    Created on : Mar 2, 2019, 9:12:01 AM
    Author     : Administrator
--%>

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="db" class="com.tollplaza.bean.DBConnector" />

<%
        if(request.getParameter("b1")!=null)
        {
Connection con=db.getConnection();
                PreparedStatement stmt=con.prepareStatement("Insert into vehicle_owners values(?,?,?,?,?,?)");
                stmt.setString(1,request.getParameter("t1"));
                stmt.setString(2,request.getParameter("t4"));
                stmt.setString(3,request.getParameter("t5"));
                stmt.setString(4,request.getParameter("t6"));
                stmt.setString(5,request.getParameter("t7"));
                stmt.setString(6,request.getParameter("t8"));                
                stmt.executeUpdate();
                stmt=con.prepareStatement("Insert into users values(?,?,'member')");
                stmt.setString(1,request.getParameter("t1"));
                stmt.setString(2,request.getParameter("t2"));
                stmt.executeUpdate();
                con.close();
        }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Toll Plaza</title>
        
    </head>
    <body>
        <img src="images/banner.jpg" width="100%" height="250px"><hr>
    <center>
        <img src="images/thanks.jpg">
        <h2>Thanks for Your Registration</h2>
        <h2>Please login to complete your profile.</h2>
        <h3><a href="index.jsp">Home</a></h3>
    </center>
        <hr><img src="images/footer.jpg" width="100%" height="200px">
    </body>
</html>
