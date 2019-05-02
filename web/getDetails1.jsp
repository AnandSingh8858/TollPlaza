<%-- 
    Document   : getDetails
    Created on : Mar 2, 2019, 3:57:23 PM
    Author     : Administrator
--%>

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="db" class="com.tollplaza.bean.DBConnector" />

<%
    String vno=request.getParameter("vno");
    
    Connection con=db.getConnection();

    PreparedStatement stmt=con.prepareStatement("Select V1.*,J1.* from vehicles V1,journey_details J1 where V1.vehicle_id=J1.VID and V1.vnumber=? and J1.OutDate is null");

    stmt.setString(1,vno);
    ResultSet rs=stmt.executeQuery();
    String s="N";
    if(rs.next()) 
    {
        
        s=rs.getString(1)+"#";
        s=s+rs.getString(2)+"#";
        s=s+rs.getString(4)+"#";        
        s=s+rs.getString(6)+"#";        
        s=s+rs.getString(8);        
    }
    out.write(s);
    con.close();
%>