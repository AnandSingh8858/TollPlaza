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
            stmt=con.prepareStatement("Select count(*)+1 from vehicles");
            rs=stmt.executeQuery();
            String vid="";
            if(rs.next()) vid=rs.getString(1);
            stmt=con.prepareStatement("Insert into vehicles values(?,?,?,?,?)");
            stmt.setString(1,vid);
            stmt.setObject(2,session.getAttribute("ULOGIN"));
            stmt.setString(3,request.getParameter("t1"));
            stmt.setString(4,request.getParameter("t2"));
            stmt.setString(5,request.getParameter("t3"));
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
                <tr><th colspan="3">Vehicle Registration</th></tr>
                <tr>
                    <td>Vehicle No.:</td><td><input type="text" name="t1"></td><td></td>
                </tr>
                <tr>
                    <td>Vehicle Type:</td><td><select name="t2">
                            <option>Personal Car</option>
                            <option>Commercial Car</option>
                            <option>Tempo</option>
                            <option>Mini Truck</option>
                            <option>Truck</option>
                            <option>16 Tyre Truck</option>
                        </select></td><td></td>
                </tr>
                <tr>
                    <td>Registration Date:</td><td><input type="date" name="t3"></td><td></td>
                </tr>
                <tr>
                    <td></td><td><input type="submit" name="b1" value="Register Vehicle"></td><td></td>
                </tr>
            </table></form>
            <hr>
            <table align="center">
                <tr>
                    <th>Vehicle Id</th><th>Vehicle No</th><th>Vehicle Type</th><th>Registration Date</th><th></th>
                </tr>
            <%
                stmt=con.prepareStatement("Select * from vehicles where ulogin=?");
                stmt.setObject(1,session.getAttribute("ULOGIN"));
                rs=stmt.executeQuery();
                while(rs.next())        
                {
                    out.write("<tr>");
                    out.write("<td>"+rs.getString(1)+"</td>");
                    out.write("<td>"+rs.getString(3)+"</td>");
                    out.write("<td>"+rs.getString(4)+"</td>");
                    out.write("<td>"+rs.getString(5)+"</td>");
                    out.write("<td></td>");                    
                    out.write("</tr>");
                }                    
            %>
            </table>
        </div>
        <img src="images/footer.jpg" width="100%" height="200px">
    </body>
</html>
