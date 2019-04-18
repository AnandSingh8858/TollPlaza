<%-- 
    Document   : index
    Created on : Mar 2, 2019, 9:12:01 AM
    Author     : Administrator
--%>

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="db" class="com.tollplaza.bean.DBConnector" />

<%
        if(session.getAttribute("ULOGIN")==null)
        {
            response.sendRedirect("index.jsp");
        }
        if(!session.getAttribute("UTYPE").toString().equals("member"))
        {
            response.sendRedirect("index.jsp");
        }
        Connection con=db.getConnection();
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
            <a href="member.jsp">Home</a><hr>
            <a href="myvehicles.jsp">My Vehicles</a><hr>
            <a href="mytransactions.jsp">My Transactions</a><hr>
            <a href="mytrack.jsp">My Journey</a><hr>
            <a href="feedback.jsp">Feedback</a><hr>
            <a href="logout.jsp">Logout</a><hr>
        </div>
        <div style="width:84%;background-color: antiquewhite; float: right">
            <%
                    stmt=con.prepareStatement("Select * from vehicle_owners where ulogin=?");
                    stmt.setObject(1,session.getAttribute("ULOGIN"));
                    rs=stmt.executeQuery();
                    if(rs.next())
                    {
            %>
            <table align="center">
                
                    <tr><td>Email:</td><td><b><%=rs.getString(1)%></b></td></tr>
                    <tr><td>Name:</td><td><b><%=rs.getString(2)%></b></td></tr>
                    <tr><td>Father:</td><td><b><%=rs.getString(3)%></b></td></tr>
                    <tr><td>Date of Birth:</td><td><b><%=rs.getString(4)%></b></td></tr>
                    <tr><td>Address:</td><td><b><%=rs.getString(5)%></b></td></tr>
                    <tr><td>Mobile:</td><td><b><%=rs.getString(6)%></b></td></tr>
                    
                
            </table>
            <%
                    }
            %>
        </div>
        <img src="images/footer.jpg" width="100%" height="200px">
    </body>
</html>
