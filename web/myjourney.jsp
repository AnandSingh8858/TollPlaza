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
        if(!session.getAttribute("UTYPE").toString().equals("member"))
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
            <a href="member.jsp">Home</a><hr>
            <a href="myvehicles.jsp">My Vehicles</a><hr>
            <a href="mytransactions.jsp">My Transactions</a><hr>
            <a href="mytrack.jsp">My Journey</a><hr>
            <a href="feedback.jsp">Feedback</a><hr>
            <a href="logout.jsp">Logout</a><hr>
        </div>
        <div style="width:84%;background-color: antiquewhite; float: right">
            <table align="center">
                <tr>
                    <th>Vehicle Id</th><th>Vehicle No</th><th>Vehicle Type</th><th>In Date</th><th>Out Date</th><th>Amount</th>
                </tr>
            <%
                stmt=con.prepareStatement("Select V1.*,V2.* from Vehicles,JourneyDetails where v1.vid=v2.vid and v1.ulogin=?");
                stmt.setObject(1,session.getAttribute("ULOGIN"));
                rs=stmt.executeQuery();
                while(rs.next())        
                {
                    out.write("<tr>");
                    out.write("<td>"+rs.getString(1)+"</td>");
                    out.write("<td>"+rs.getString(3)+"</td>");
                    out.write("<td>"+rs.getString(4)+"</td>");
                    out.write("<td>"+rs.getString(8)+"</td>");
                    out.write("<td>"+rs.getString(9)+"</td>");
                    out.write("<td>"+rs.getString(10)+"</td>");                    
                    out.write("</tr>");
                }                    
            %>
            </table>
        </div>
        <img src="images/footer.jpg" width="100%" height="200px">
    </body>
</html>
