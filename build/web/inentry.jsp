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
        if(!session.getAttribute("UTYPE").toString().equals("staff"))
        {
            response.sendRedirect("index.jsp");
        }
        Connection con=(Connection)session.getAttribute("CON");
        PreparedStatement stmt;
        ResultSet rs;
        if(request.getParameter("b1")!=null)
        {
            stmt=con.prepareStatement("Select count(*)+1 from journeydetails");
            rs=stmt.executeQuery();
            String jid="";
            if(rs.next()) jid=rs.getString(1);
            stmt=con.prepareStatement("Insert into journeydetails values(?,?,?,null,?)");
            stmt.setString(1,jid);
            stmt.setString(2,request.getParameter("t0"));
            stmt.setString(3,request.getParameter("t5")+" "+ request.getParameter("t6"));
            stmt.setString(4,request.getParameter("t7"));
            stmt.executeUpdate();
            
            stmt=con.prepareStatement("Select count(*)+1 from amounttransactions");
            rs=stmt.executeQuery();
            String tid="";
            if(rs.next()) tid=rs.getString(1);
            stmt=con.prepareStatement("Insert into amounttransactions values(?,?,?,?,?,?,?)");
            stmt.setString(1,tid);
            stmt.setString(2,request.getParameter("t2"));
            stmt.setString(3,request.getParameter("t7"));
            stmt.setString(4,request.getParameter("t5"));
            stmt.setString(5,"D");
            stmt.setString(6,"Toll Tax");
            stmt.setObject(7,session.getAttribute("ULOGIN"));
            stmt.executeUpdate();
            
        }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Toll Plaza</title>
        <script>
            var xmlhttp;
            function getDetails()
            {
                s=document.getElementById("t1").value;
                xmlhttp=new XMLHttpRequest();
                xmlhttp.onreadystatechange=showDetails;
                xmlhttp.open("GET","getDetails.jsp?vno="+s,true);
                xmlhttp.send(null);
            }
            function showDetails()
            {
                if(xmlhttp.readyState==4 && xmlhttp.status==200)
                {
                    reply=xmlhttp.responseText.trim();
                    if(reply!="N")
                    {
                        arr=reply.split("#");
                        document.getElementById("t2").value=arr[0];
                        document.getElementById("t3").value=arr[1];
                        document.getElementById("t4").value=arr[2];
                        document.getElementById("t0").value=arr[3];
                    }
                }
            }
        </script>
    </head>
    <body>
        <img src="images/banner.jpg" width="100%" height="250px"><hr>
        <div style="width:15%; height:300px; background-color: lavender; float: left">
            <a href="staff.jsp">Home</a><hr>
            <a href="inentry.jsp">In Entry</a><hr>
            <a href="outentry.jsp">Out Entry</a><hr>
            <a href="logout.jsp">Logout</a><hr>
        </div>
        <div style="width:84%;background-color: antiquewhite; float: right">            
            <form method="post">
            <table align="center">
                <tr>
                    <th colspan="3">Vehicle Entry Details</th>
                </tr>
                <tr>
                    <td>Vehicle No.:</td><td><input type="text" name="t1" id="t1" onblur="getDetails()"></td><td></td>
                </tr>
                <tr>
                    <td>User Email:</td><td><input type="text" name="t2" id="t2" readonly></td><td></td>
                </tr>
                <tr>
                    <td>Vehicle No.:</td><td><input type="text" name="t3" id="t3" readonly></td><td></td>
                </tr>
                <tr>
                    <td>Vehicle Type:</td><td><input type="text" name="t4" id="t4" readonly></td><td></td>
                </tr>
                <tr>
                    <td>Vehicle Code:</td><td><input type="text" name="t0" id="t0" readonly></td><td></td>
                </tr>
                <tr>
                    <td>In Date:</td><td><input type="date" name="t5" id="t5"></td><td></td>
                </tr>
                <tr>
                    <td>In Time:</td><td><input type="time" name="t6" id="t6"></td><td></td>
                </tr>
                <tr>
                    <td>Toll Amount:</td><td><input type="number" name="t7" id="t7"></td><td></td>
                </tr>
                <tr>
                    <td></td><td><input type="submit" name="b1" value="   Done   " onclick="return confirm('Are you sure?');"></td><td></td>
                </tr>
            </table></form>
        </div>
        <img src="images/footer.jpg" width="100%" height="200px">
    </body>
</html>
