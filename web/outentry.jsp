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
            stmt=con.prepareStatement("Update journey_details set OutDate=? where jid=?");
            stmt.setString(1,request.getParameter("t8")+" "+ request.getParameter("t9"));
            stmt.setString(2,request.getParameter("t5"));
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
                xmlhttp.open("GET","getDetails1.jsp?vno="+s,true);
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
                        document.getElementById("t5").value=arr[3];
                        document.getElementById("t6").value=arr[4];                        
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
                    <th colspan="3">Vehicle Out Details</th>
                </tr>
                <tr>
                    <td>Vehicle No.:</td><td><input type="text" name="t1" id="t1" onblur="getDetails()"></td><td></td>
                </tr>
                <tr>
                    <td>Vehicle Code:</td><td><input type="text" name="t2" id="t2" readonly></td><td></td>
                </tr>
                <tr>
                    <td>Email:</td><td><input type="text" name="t3" id="t3" readonly></td><td></td>
                </tr>                
                <tr>
                    <td>Vehicle Type:</td><td><input type="text" name="t4" id="t4" readonly></td><td></td>
                </tr>
                <tr>
                    <td>Journey Code:</td><td><input type="text" name="t5" id="t5" readonly></td><td></td>
                </tr>
                <tr>
                    <td>In Date/Time:</td><td><input type="text" name="t6" id="t6" readonly></td><td></td>
                </tr>
                <tr>
                    <td>Out Date:</td><td><input type="date" name="t8" id="t8"></td><td></td>
                </tr>
                <tr>
                    <td>Out Time:</td><td><input type="time" name="t9" id="t9"></td><td></td>
                </tr>                
                <tr>
                    <td></td><td><input type="submit" name="b1" value="   Done   " onclick="return confirm('Are you sure?');"></td><td></td>
                </tr>
            </table></form>
        </div>
        <img src="images/footer.jpg" width="100%" height="200px">
    </body>
</html>
