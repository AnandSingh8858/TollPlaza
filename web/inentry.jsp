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
        if(!session.getAttribute("UTYPE").toString().equals("staff"))
        {
            response.sendRedirect("index.jsp");
        }
        Connection con=db.getConnection();
        PreparedStatement stmt;
        ResultSet rs;
        if(request.getParameter("b1")!=null)
        {
            stmt=con.prepareStatement("Select count(*)+1 from journey_details");
            rs=stmt.executeQuery();
            String jid="";
            if(rs.next()) jid=rs.getString(1);
            stmt=con.prepareStatement("Insert into journey_details values(?,?,?,null,?)");
            stmt.setString(1,jid);
            stmt.setString(2,request.getParameter("t0"));
            java.util.Date ddt=new java.util.Date();
            String dt=(ddt.getYear()+1900)+"-"+(ddt.getMonth()+1)+"-"+ddt.getDate();
            String time=ddt.getHours()+":"+ddt.getMinutes()+":"+ddt.getSeconds();
            stmt.setString(3,dt+" "+time);            
            stmt.setString(4,request.getParameter("t7"));
            stmt.executeUpdate();
            
            stmt=con.prepareStatement("Select count(*)+1 from amount_transactions");
            rs=stmt.executeQuery();
            String tid="";
            if(rs.next()) tid=rs.getString(1);
            stmt=con.prepareStatement("Insert into amount_transactions values(?,?,?,?,?,?,?)");
            stmt.setString(1,tid);
            stmt.setString(2,request.getParameter("t2"));
            stmt.setString(3,request.getParameter("t7"));
            stmt.setString(4,dt);
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
                        
                        var amt=0;
                        if(arr[2]=="Personal Car") amt=80;
                        if(arr[2]=="Commercial Car") amt=100;
                        if(arr[2]=="Tempo") amt=150;
                        if(arr[2]=="Mini Truck") amt=250;
                        if(arr[2]=="Truck") amt=500;
                        if(arr[2]=="16 Tyre Truck") amt=800;
                        document.getElementById("t7").value=amt;
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
                    <td>Toll Amount:</td><td><input type="number" name="t7" id="t7" readonly></td><td></td>
                </tr>
                <tr>
                    <td></td><td><input type="submit" name="b1" value="   Done   " onclick="return confirm('Are you sure?');"></td><td></td>
                </tr>
            </table></form>
        </div>
        <img src="images/footer.jpg" width="100%" height="200px">
    </body>
</html>
