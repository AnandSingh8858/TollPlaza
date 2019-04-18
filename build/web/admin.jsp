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
        if(!session.getAttribute("UTYPE").toString().equals("admin"))
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
            <a href="admin.jsp">Home</a><hr>
            <a href="managestaff.jsp">Manage Staff</a><hr>
            <a href="manageadmin.jsp">Manage Administrator</a><hr>
            <a href="memberdetails.jsp">Member Details</a><hr>
            <a href="paymentmgmt.jsp">Payment Management</a><hr>
            <a href="vsearch.jsp">Vehicle Search</a><hr>
            <a href="msearch.jsp">Member Search</a><hr>
            <a href="vehiclereport.jsp">Vehicle Report</a><hr>
            <a href="logout.jsp">Logout</a><hr>
        </div>
        <div style="width:84%;background-color: antiquewhite; float: right">
            <img src="images/adminp.png" width="100%"><br>
            <center><h2>Select an Activity from Left Side</h2></center>
        </div>
        <img src="images/footer.jpg" width="100%" height="200px">
    </body>
</html>
