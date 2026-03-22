<%
String viewport=null;
if((Integer)(session.getAttribute("library_status"))==0)
{
	response.sendRedirect("login.jsp");
}
if(session.getAttribute("viewport")==null)
{
session.setAttribute("viewport",1);
}

	switch(Integer.valueOf(session.getAttribute("viewport").toString()))
	{
		case 1:viewport = "bookissue.jsp";
				break;
		case 2:viewport = "bookreturn.jsp";
				break;
		case 3:viewport = "search.jsp";
				break;
		case 4:viewport = "addbook.jsp";
				break;
	}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Welcome Page of NCRK Library Manegement System</title>
</head>
<frameset rows="22%,78%" framespacing="4"  frameborder="yes" bordercolor="#FF99CC" >
	<frame id="header" name="header" src="header.jsp"  />
	<frame id="viewport" name="viewport" src="<%=viewport%>"&lt;/>
</frameset><noframes></noframes>
	</a>
</body>
</html>
