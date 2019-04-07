package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Toll Plaza</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <img src=\"images/banner.jpg\" width=\"100%\" height=\"250px\"><hr>\n");
      out.write("        <table>\n");
      out.write("            <tr>\n");
      out.write("                <td><img src=\"images/road1.jpg\" width=\"300px\" height=\"150px\"></td><td>\n");
      out.write("            <marquee><img src=\"images/road4.jpg\" width=\"300px\" height=\"150px\"><img src=\"images/road5.jpg\" width=\"300px\" height=\"150px\"><img src=\"images/road6.png\" width=\"300px\" height=\"150px\"><img src=\"images/road7.jpg\" width=\"300px\" height=\"150px\"><img src=\"images/road8.png\" width=\"300px\" height=\"150px\"><img src=\"images/road9.jpg\" width=\"300px\" height=\"150px\"></marquee>\n");
      out.write("        </td><td>\n");
      out.write("            <form method='post'>\n");
      out.write("            <table>\n");
      out.write("                <tr>\n");
      out.write("                    <th colspan=\"3\">User Authentication</th>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Email:</td><td><input type='email' name='t1'></td><td></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Password:</td><td><input type='password' name='t2'></td><td></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td></td><td><input type='submit' name='b1' value='Login'></td><td></td>\n");
      out.write("                </tr>\n");
      out.write("                 <tr>\n");
      out.write("                     <td></td><td><font color=\"red\">");
      out.print(msg);
      out.write("</font></td><td></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td></td><td><a href='register.jsp'>New Registration</a></td><td></td>\n");
      out.write("                </tr>\n");
      out.write("            </table></form>\n");
      out.write("        </td>\n");
      out.write("            </tr>\n");
      out.write("        </table>\n");
      out.write("        <hr><img src=\"images/footer.jpg\" width=\"100%\" height=\"200px\">\n");
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
