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
        if(request.getParameter("b1")!=null)
        {
                stmt=con.prepareStatement("Insert into tollstaff values(?,?,?,?,?,null,?,?)");
                stmt.setString(1,request.getParameter("t1"));
                stmt.setString(2,request.getParameter("t3"));
                stmt.setString(3,request.getParameter("t4"));
                stmt.setString(4,request.getParameter("t5"));
                stmt.setString(5,request.getParameter("t6"));
                stmt.setString(6,request.getParameter("t8"));                
                stmt.setString(7,request.getParameter("t9"));                
                stmt.executeUpdate();
                stmt=con.prepareStatement("Insert into Users values(?,?,'admin')");
                stmt.setString(1,request.getParameter("t1"));
                stmt.setString(2,request.getParameter("t2"));
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
            <form method="post">
            <table align="center">
                <tr><th colspan="3">Manage Administrator</th></tr>
                <tr>
                    <td>Email:</td><td><input type="email" name="t1" id="t1"></td><td></td>
                </tr>
                <tr>
                    <td>Password:</td><td><input type="password" name="t2" id="t2"></td><td></td>
                </tr>
                <tr>
                    <td>Name:</td><td><input type="text" name="t3" id="t3"></td><td></td>
                </tr>
                <tr>
                    <td>Father:</td><td><input type="text" name="t4" id="t4"></td><td></td>
                </tr>
                <tr>
                    <td>Appointment Date:</td><td><input type="date" name="t5" id="t5"></td><td></td>
                </tr>
                <tr>
                    <td>Date of Birth:</td><td><input type="date" name="t6" id="t6"></td><td></td>
                </tr>                
                <tr>
                    <td>Address:</td><td><textarea name="t8" id="t8"></textarea></td><td></td>
                </tr>
                <tr>
                    <td>Post:</td><td><select id="t9" name="t9">
                            <option>Administrator</option>                            
                        </select></td><td></td>
                </tr>
                <tr>
                    <td></td><td><input type="submit" name="b1" value="Save New Record"> <input type="submit" name="b2" value="Update"></td><td></td>
                </tr>
            </table></form>
            <hr>
            <table align="center" border="1">
                <tr>
                    <th>Email</th><th>Name</th><th>Father</th><th>Appointment Date</th><th>Date of Birth</th><th>Resignation Date</th><th>Address</th><th>Post</th><th></th>
                </tr>
            <%
                stmt=con.prepareStatement("Select * from tollstaff where post='Administrator'");
                rs=stmt.executeQuery();
                while(rs.next())        
                {
                    out.write("<tr>");
                    out.write("<td>"+rs.getString(1)+"</td>");
                    out.write("<td>"+rs.getString(2)+"</td>");
                    out.write("<td>"+rs.getString(3)+"</td>");
                    out.write("<td>"+rs.getString(4)+"</td>");
                    out.write("<td>"+rs.getString(5)+"</td>");
                    out.write("<td>"+rs.getString(6)+"</td>");
                    out.write("<td>"+rs.getString(7)+"</td>");
                    out.write("<td>"+rs.getString(8)+"</td>");
                    out.write("<td><a href='setresign.jsp?p=A&email="+rs.getString(1)+"'>Resign</a></td>");
                    out.write("</tr>");
                }                    
            %>
            </table>
        </div>
        <img src="images/footer.jpg" width="100%" height="200px">
    </body>
</html>
