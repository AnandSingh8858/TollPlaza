<%-- 
    Document   : DB
    Created on : Mar 2, 2019, 8:25:16 AM
    Author     : Administrator
--%>

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="db" class="com.tollplaza.bean.DBConnector" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
                
                Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1","root","8858");
                PreparedStatement stmt=con.prepareStatement("Create Database TollApp");
                stmt.executeUpdate();
                stmt=con.prepareStatement("Use TollApp");
                stmt.executeUpdate();
                stmt=con.prepareStatement("CREATE TABLE users(ulogin varchar(30),upass varchar(30),utype varchar(30))");
                stmt.executeUpdate();
                stmt=con.prepareStatement("CREATE TABLE toll_staff(ulogin varchar(30),name varchar(30),father varchar(30),DOA date,DOB date,DOL date,Address varchar(30),post varchar(30))");
                stmt.executeUpdate();
                stmt=con.prepareStatement("CREATE TABLE vehicle_owners(ulogin varchar(30),name varchar(30),father varchar(30),DOB date,Address varchar(30),Mobile varchar(30))");
                stmt.executeUpdate();
                stmt=con.prepareStatement("CREATE TABLE vehicles(vehicle_id int primary key,ulogin varchar(30),vnumber varchar(20),VehicleType varchar(20),RegistrationDate date)");
                stmt.executeUpdate();
                stmt=con.prepareStatement("CREATE TABLE amount_transactions(TID int primary key,ulogin varchar(30),Amt int,TDate date,tType varchar(1),details varchar(20),tby varchar(30))");
                stmt.executeUpdate();
                stmt=con.prepareStatement("CREATE TABLE journey_details(JID int primary key,VID int,InDate datetime,OutDate datetime,Amt int)");
                stmt.executeUpdate();
                stmt=con.prepareStatement("CREATE TABLE feedback(FID int primary key,Email varchar(30),FeedBack varchar(100),Feeddate date)");
                stmt.executeUpdate();
                stmt=con.prepareStatement("INSERT INTO users VALUES('admin@admin.com','admin123','admin')");
                stmt.executeUpdate();
        %>
        <h1>Done</h1>
    </body>
</html>
