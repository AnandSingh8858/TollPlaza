<%-- 
    Document   : logout
    Created on : Mar 2, 2019, 1:32:53 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
                session.removeAttribute("ULOGIN");
                session.removeAttribute("UTYPE");
                session.removeAttribute("CON");
                session.invalidate();
                response.sendRedirect("index.jsp");
        %>
    </body>
</html>
