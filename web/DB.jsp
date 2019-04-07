<%-- 
    Document   : DB
    Created on : Mar 2, 2019, 8:25:16 AM
    Author     : Administrator
--%>

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
                Class.forName("org.gjt.mm.mysql.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1","root","8858");
                PreparedStatement stmt=con.prepareStatement("Create Database TollApp");
                stmt.executeUpdate();
                stmt=con.prepareStatement("Use TollApp");
                stmt.executeUpdate();
                stmt=con.prepareStatement("Create Table Users(ulogin varchar(30),upass varchar(30),utype varchar(30))");
                stmt.executeUpdate();
                stmt=con.prepareStatement("Create Table TollStaff(ulogin varchar(30),name varchar(30),father varchar(30),DOA date,DOB date,DOL date,Address varchar(30),post varchar(30))");
                stmt.executeUpdate();
                stmt=con.prepareStatement("Create Table VehicleOwners(ulogin varchar(30),name varchar(30),father varchar(30),DOB date,Address varchar(30),Mobile varchar(30))");
                stmt.executeUpdate();
                stmt=con.prepareStatement("Create Table Vehicles(VID int primary key,ulogin varchar(30),VehicleNo varchar(20),VehicleType varchar(20),RegistrationDate Date)");
                stmt.executeUpdate();
                stmt=con.prepareStatement("Create Table AmountTransactions(TID int primary key,ulogin varchar(30),Amt int,TDate date,tType varchar(1),details varchar(20),tby varchar(30))");
                stmt.executeUpdate();
                stmt=con.prepareStatement("Create Table JourneyDetails(JID int primary key,VID int,InDate DateTime,OutDate DateTime,Amt int)");
                stmt.executeUpdate();
                stmt=con.prepareStatement("Create Table Feedback(FID int primary key,Email varchar(30),FeedBack varchar(100),Feeddate date)");
                stmt.executeUpdate();
                stmt=con.prepareStatement("Insert into users values('admin@admin.com','admin123','admin')");
                stmt.executeUpdate();
        %>
        <h1>Done</h1>
    </body>
</html>
