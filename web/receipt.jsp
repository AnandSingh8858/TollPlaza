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
        String tid="";
        if(request.getParameter("b1")!=null)
        {
            stmt=con.prepareStatement("Select count(*)+1 from amount_transactions");
            rs=stmt.executeQuery();
            if(rs.next()) tid=rs.getString(1);
            stmt=con.prepareStatement("Insert into amount_transactions values(?,?,?,?,?,?,?)");
            stmt.setString(1,tid);
            stmt.setObject(2,session.getAttribute("ULOGIN"));
            stmt.setString(3,request.getParameter("t1"));
            stmt.setString(4,request.getParameter("t3"));
            stmt.setString(5,"C");
            stmt.setString(6,request.getParameter("t2")+","+request.getParameter("t4"));
            stmt.setString(7,"SELF");
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
            <table align="center">
                <tr>
                    <td>Transaction ID:</td><td><b><%=tid%></b></td><td></td>
                </tr>
                <tr>
                    <td>Transaction Date:</td><td><%=request.getParameter("t3")%></td><td></td>
                </tr>
                <tr>
                    <td>Amount:</td><td>Rs. <%=request.getParameter("t1")%>/-</td><td></td>
                </tr>
                <tr>
                    <td>Transaction Type:</td><td><%=request.getParameter("t2")%></td><td></td>
                </tr>
                <tr>
                    <td>Details:</td><td><%=request.getParameter("t4")%></td><td></td>
                </tr>
                <tr>
                    <td></td><td><a href="#" onClick="javascript:window.print()">Print</a></td><td></td>
                </tr>
            </table>
        </div>
        <img src="images/footer.jpg" width="100%" height="200px">
    </body>
</html>
