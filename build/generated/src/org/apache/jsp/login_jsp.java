package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");


session.setAttribute("library_status",0);
session.setAttribute("connecton",null);
session.setAttribute("userid",null);
session.setAttribute("password",null);
session.setAttribute("studentid",null);
session.setAttribute("viewport",1);

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\r\n");
      out.write("<title>Login Page</title>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("<div align=\"center\"  >\r\n");
      out.write("\t<form id=\"login\" name=\"login\" method=\"post\" action=\"login.jsp\">\r\n");
      out.write("\t\t<select id=\"who\" >\r\n");
      out.write("\t\t<option value=\"Library Assistent\" >Library Assistent </option>\r\n");
      out.write("\t\t<option value=\"Student\" >Student</option>\r\n");
      out.write("\t\t</select><br />\r\n");
      out.write("\t\tUser Id : <input type=\"text\" id=\"userid\" name=\"userid\"  value=\"\"   border=\"1\"/><br />\r\n");
      out.write("\t\tPassword: <input type=\"password\" id=\"password\" name=\"password\"  value=\"\" /><br />\r\n");
      out.write("\t\t<input type=\"submit\" value=\"submit\" name=\"submit\"  />\r\n");
      out.write("\t</form>\r\n");
      out.write("</div>\r\n");

	String userid =null;
	String password=null;
	java.sql.Connection con=null;
	userid = request.getParameter("userid");
	password = request.getParameter("password");
	try
	{
		Class.forName("org.gjt.mm.mysql.Driver");
		con = java.sql.DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/library",userid,password);
		session.setAttribute("connection",con);
		session.setAttribute("userid",userid);
		session.setAttribute("password",password);
		session.setAttribute("library_status",1);
		response.sendRedirect("welcome.jsp");
		
	
	}
	catch(com.mysql.jdbc.exceptions.jdbc4.CommunicationsException e)
	{
		out.println("Server is not available.");
	}
	catch(java.sql.SQLException e)
	{
		
		out.print("Sorry , invalid UserName/Password .");
	}
	


      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
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
