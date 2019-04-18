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
        if(request.getParameter("b1")!=null)
        {
            stmt=con.prepareStatement("Select count(*)+1 from feedback");
            rs=stmt.executeQuery();
            String fid="";
            if(rs.next()) fid=rs.getString(1);
            stmt=con.prepareStatement("Insert into feedback values(?,?,?,?)");
            stmt.setString(1,fid);
            stmt.setObject(2,session.getAttribute("ULOGIN"));
            stmt.setString(3,request.getParameter("t1"));
            java.util.Date dt=new java.util.Date();
            String d=(dt.getYear()+1900)+"-"+(dt.getMonth()+1)+"-"+dt.getDate();
            stmt.setString(4,d);            
            stmt.executeUpdate();
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
        <div style="width:15%; height:300px; background-color: lavender; float: left">
            <a href="member.jsp">Home</a><hr>
            <a href="myvehicles.jsp">My Vehicles</a><hr>
            <a href="mytransactions.jsp">My Transactions</a><hr>
            <a href="mytrack.jsp">My Journey</a><hr>
            <a href="feedback.jsp">Feedback</a><hr>
            <a href="logout.jsp">Logout</a><hr>
        </div>
        <div style="width:84%;background-color: antiquewhite; float: right">
            <form method="post">
            <table align="center">
                <tr><th colspan="3">Feedback</th></tr>
                <tr>
                    <td>Feedback:</td><td><textarea name="t1"></textarea></td><td></td>
                </tr>
                <tr>
                    <td></td><td><input type="submit" name="b1" value="Submit Feedback"></td><td></td>
                </tr>
            </table></form>
            <hr>            
        </div>
        <img src="images/footer.jpg" width="100%" height="200px">
    </body>
</html>
