package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class admin_jsp extends org.apache.jasper.runtime.HttpJspBase
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

        if(session.getAttribute("ULOGIN")==null)
        {
            response.sendRedirect("index.jsp");
        }
        if(!session.getAttribute("UTYPE").toString().equals("admin"))
        {
            response.sendRedirect("index.jsp");
        }
        Connection con=(Connection)session.getAttribute("CON");
        PreparedStatement stmt;
        ResultSet rs;

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Toll Plaza</title>\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <img src=\"images/banner.jpg\" width=\"100%\" height=\"250px\"><hr>\n");
      out.write("        <div style=\"width:15%; height:300px; background-color: lavender; float: left\">\n");
      out.write("            <a href=\"admin.jsp\">Home</a><hr>\n");
      out.write("            <a href=\"managestaff.jsp\">Manage Staff</a><hr>\n");
      out.write("            <a href=\"manageadmin.jsp\">Manage Administrator</a><hr>\n");
      out.write("            <a href=\"memberdetails.jsp\">Member Details</a><hr>\n");
      out.write("            <a href=\"paymentmgmt.jsp\">Payment Management</a><hr>\n");
      out.write("            <a href=\"vsearch.jsp\">Vehicle Search</a><hr>\n");
      out.write("            <a href=\"msearch.jsp\">Member Search</a><hr>\n");
      out.write("            <a href=\"logout.jsp\">Logout</a><hr>\n");
      out.write("        </div>\n");
      out.write("        <div style=\"width:84%;background-color: antiquewhite; float: right\">\n");
      out.write("            <img src=\"images/adminp.png\" width=\"100%\"><br>\n");
      out.write("            <center><h2>Select an Activity from Left Side</h2></center>\n");
      out.write("        </div>\n");
      out.write("        <img src=\"images/footer.jpg\" width=\"100%\" height=\"200px\">\n");
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
