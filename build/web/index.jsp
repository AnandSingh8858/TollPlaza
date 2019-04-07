<%-- 
    Document   : index
    Created on : Mar 2, 2019, 9:12:01 AM
    Author     : Administrator
--%>

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
        String msg="";
        if(request.getParameter("b1")!=null)
        {
                Class.forName("org.gjt.mm.mysql.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1/TollApp","root","8858");
                PreparedStatement stmt=con.prepareStatement("Select * from users where ulogin=? and upass=?");
                stmt.setString(1,request.getParameter("t1"));
                stmt.setString(2,request.getParameter("t2"));
                ResultSet rs=stmt.executeQuery();
                if(rs.next())
                {
                    String utype=rs.getString(3);
                    session.setAttribute("UTYPE",utype);
                    session.setAttribute("ULOGIN",request.getParameter("t1"));
                    session.setAttribute("CON",con);
                    if(utype.equals("admin"))
                    {
                        response.sendRedirect("admin.jsp");
                    }
                    if(utype.equals("member"))
                    {
                        response.sendRedirect("member.jsp");
                    }
                    if(utype.equals("staff"))
                    {
                        response.sendRedirect("staff.jsp");
                    }
                }
                else
                {
                    msg="Invalid Login/Password!!!";
                }
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
        <table>
            <tr>
                <td><img src="images/road1.jpg" width="300px" height="150px"></td><td>
            <marquee><img src="images/road4.jpg" width="300px" height="150px"><img src="images/road5.jpg" width="300px" height="150px"><img src="images/road6.png" width="300px" height="150px"><img src="images/road7.jpg" width="300px" height="150px"><img src="images/road8.png" width="300px" height="150px"><img src="images/road9.jpg" width="300px" height="150px"></marquee>
        </td><td>
            <form method='post'>
            <table>
                <tr>
                    <th colspan="3">User Authentication</th>
                </tr>
                <tr>
                    <td>Email:</td><td><input type='email' name='t1'></td><td></td>
                </tr>
                <tr>
                    <td>Password:</td><td><input type='password' name='t2'></td><td></td>
                </tr>
                <tr>
                    <td></td><td><input type='submit' name='b1' value='Login'></td><td></td>
                </tr>
                 <tr>
                     <td></td><td><font color="red"><%=msg%></font></td><td></td>
                </tr>
                <tr>
                    <td></td><td><a href='register.jsp'>New Registration</a></td><td></td>
                </tr>
            </table></form>
        </td>
            </tr>
        </table>
        <hr><img src="images/footer.jpg" width="100%" height="200px">
    </body>
</html>
