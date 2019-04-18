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
        else if(!session.getAttribute("UTYPE").toString().equals("admin"))
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
            <table width="100%">
                <tr><td>Vehicle Number:</td><td><input type="text" name="t1" style="width:400px"></td><td><input type="submit" name="b1" value="Search"></td></tr>
            </table>
             </form>
            <table align="center">
                <tr>
                    <th>Email</th><th>Name</th><th>Father</th><th>Date of Birth</th><th>Address</th><th>Mobile</th><th>Vehicle No</th><th>Vehicle Type</th><th>Registration Date</th><th></th>
                </tr>
            <%
                if(request.getParameter("b1")!=null)
                {
                stmt=con.prepareStatement("Select V1.*,V2.* from vehicle_owners V1,vehicles V2 where V1.ulogin=v2.ulogin and  vnumber=?");
                stmt.setString(1,request.getParameter("t1"));
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
                    out.write("<td>"+rs.getString(9)+"</td>");
                    out.write("<td>"+rs.getString(10)+"</td>");
                    out.write("<td>"+rs.getString(11)+"</td>");
                    out.write("<td></td>");
                    out.write("</tr>");
                }
                }
            %>
            </table>
        </div>
        <img src="images/footer.jpg" width="100%" height="200px">
    </body>
</html>
