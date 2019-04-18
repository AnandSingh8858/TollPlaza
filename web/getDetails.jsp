<%-- 
    Document   : getDetails
    Created on : Mar 2, 2019, 3:57:23 PM
    Author     : Administrator
--%>
<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="db" class="com.tollplaza.bean.DBConnector" />  

<%
    String vno=request.getParameter("vno");
    Connection con = db.getConnection();
    PreparedStatement stmt=con.prepareStatement("Select * from vehicles where  vnumber=?");
    stmt.setString(1,vno);
    ResultSet rs=stmt.executeQuery();
    String s="N";
    if(rs.next())
    {
        s=rs.getString(2)+"#";
        s=s+rs.getString(3)+"#";
        s=s+rs.getString(4)+"#";        
        s=s+rs.getString(1);        
    }
    out.write(s);
    con.close();
%>