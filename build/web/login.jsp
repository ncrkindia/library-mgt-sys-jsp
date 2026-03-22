<%
session.setAttribute("library_status",0);
session.setAttribute("connecton",null);
session.setAttribute("userid",null);
session.setAttribute("password",null);
session.setAttribute("studentid",null);
session.setAttribute("viewport",1);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Login Page</title>
</head>

<body>
<div align="center"  >
	<form id="login" name="login" method="post" action="login.jsp">
		<select id="who" >
		<option value="Library Assistent" >Library Assistent </option>
		<option value="Student" >Student</option>
		</select><br />
		User Id : <input type="text" id="userid" name="userid"  value=""   border="1"/><br />
		Password: <input type="password" id="password" name="password"  value="" /><br />
		<input type="submit" value="submit" name="submit"  />
	</form>
</div>
<%
	String userid ="";
	String password="";
	java.sql.Connection con=null;
	//userid = request.getParameter("userid");
	password = request.getParameter("password");
	try
	{
		Class.forName("org.gjt.mm.mysql.Driver");
		con = java.sql.DriverManager.getConnection("jdbc:mysql://127.0.0.1:306",userid,password);
		session.setAttribute("connection",con);
		session.setAttribute("userid",userid);
		session.setAttribute("password",password);
		session.setAttribute("library_status",1);
		//response.sendRedirect("welcome.jsp");
		
	
	}
	catch(com.mysql.jdbc.exceptions.jdbc4.CommunicationsException e)
	{
		out.println("Server is not available."+e.getMessage());
	}
	catch(java.sql.SQLException e)
	{
		
		out.print("Sorry , invalid UserName/Password .");
	}
	

%>
</body>
</html>
