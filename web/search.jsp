<%@ page contentType="text/html" %>
<%
if((Integer)session.getAttribute("library_status")==0)
{
	response.sendRedirect("login.jsp");
}
session.setAttribute("viewport",3);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Search</title>
</head>
<frameset rows="10%,*" framespacing="4"  frameborder="yes" bordercolor="#FF99CC"  >
	<frameset cols="26%,26%,24%,24%" framespacing="4"  frameborder="yes" bordercolor="#FF99CC"  >
		<frame src="bookno.jsp"  />
		<frame src="bookid.jsp"  />
		<frame src="bookname.jsp"  />
		<frame src="bookauthor.jsp"  />
	</frameset>
	// <frame src="search_result.jsp"  id="search_result" name="search_result" />
</frameset>
<body>
</body>
</html>
