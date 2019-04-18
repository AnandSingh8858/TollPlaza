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
            <form method="post" action="receipt.jsp">
            <table align="center">
                <tr><th colspan="3">Add Fund</th></tr>
                <tr>
                    <td>Amount:</td><td><input type="text" name="t1"></td><td></td>
                </tr>
                <tr>
                    <td>Via:</td><td><select name="t2">
                            <option>NEFT</option>
                            <option>Paytm</option>
                            <option>UPI</option>
                            <option>IMPS</option>                            
                             </select></td><td></td>
                </tr>
                <tr>
                    <td>Transaction Date:</td><td><input type="date" name="t3"></td><td></td>
                </tr>
                <tr>
                    <td>Transaction Details:</td><td><input type="text" name="t4"></td><td></td>
                </tr>
                <tr>
                    <td></td><td><input type="submit" name="b1" value="Add Fund"></td><td></td>
                </tr>
            </table></form>
            <hr>
            <table align="center" border="1">
                <tr>
                    <th>Amount</th><th>Transaction Date</th><th>Debit/Credit</th><th>Details</th><th></th>
                </tr>
            <%
                stmt=con.prepareStatement("Select * from amounttransactions where ulogin=? order by tdate");
                stmt.setObject(1,session.getAttribute("ULOGIN"));
                rs=stmt.executeQuery();
                while(rs.next())        
                {
                    out.write("<tr>");
                    out.write("<td>"+rs.getString(3)+"</td>");
                    out.write("<td>"+rs.getString(4)+"</td>");
                    out.write("<td>"+rs.getString(5)+"</td>");
                    out.write("<td>"+rs.getString(6)+"</td>");
                    out.write("<td></td>");                    
                    out.write("</tr>");
                }              
                int credit=0,debit=0,bal=0;                
                stmt=con.prepareStatement("Select sum(amt) from amounttransactions where ulogin=? and ttype='C'");
                stmt.setObject(1,session.getAttribute("ULOGIN"));
                rs=stmt.executeQuery();
                if(rs.next()) credit=rs.getInt(1);
                stmt=con.prepareStatement("Select sum(amt) from amounttransactions where ulogin=? and ttype='D'");
                stmt.setObject(1,session.getAttribute("ULOGIN"));
                rs=stmt.executeQuery();
                if(rs.next()) debit=rs.getInt(1);
                bal=credit-debit;
            %>
            </table>
            <b>Total Credit :<%=credit%></b><br>
            <b>Total Debit :<%=debit%></b><br>
            <b>Total Balance :<%=bal%></b><br>
        </div>
        <img src="images/footer.jpg" width="100%" height="200px">
    </body>
</html>
