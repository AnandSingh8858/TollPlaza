<%-- 
    Document   : setresign
    Created on : Mar 2, 2019, 2:20:51 PM
    Author     : Administrator
--%>

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
        <%
                Connection con=(Connection)session.getAttribute("CON");
                PreparedStatement stmt;
                ResultSet rs;
                java.util.Date dt=new java.util.Date();
                String d=(dt.getYear()+1900)+"-"+(dt.getMonth()+1)+"-"+dt.getDate();
                stmt=con.prepareStatement("Update tollstaff set DOL=? where ulogin=?");
                stmt.setString(1,d);
                stmt.setString(2,request.getParameter("email"));
                stmt.executeUpdate();
                if(request.getParameter("p").equals("S"))
                    response.sendRedirect("managestaff.jsp");
                else
                    response.sendRedirect("manageadmin.jsp");
        %>
