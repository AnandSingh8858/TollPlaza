package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class DB_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

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
        
      out.write("\n");
      out.write("        <h1>Done</h1>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
