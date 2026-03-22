<%
if((Integer)session.getAttribute("library_status")==0)
{
	response.sendRedirect("login.jsp");
}
session.setAttribute("viewport",2);
java.sql.Connection con = (java.sql.Connection)(session.getAttribute("connection"));
java.sql.PreparedStatement st = null;
java.sql.ResultSet rs = null;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Book Return</title>
</head>

<body>
<font size="+2" face="Courier New, Courier, monospace"  color="#553F00" >
<div align="center" >
	<form name="bookreturn" action="bookreturn.jsp" method="get" >
		Book NO. : <input type="number" name="bookno" value="" /><br />
		<input type="submit" name="return" value="Return"  />
	</form>
</div>
<%

if(request.getParameter("return")!=null)
{
	int bookno=0;
	boolean check=false;
	try
	{
		bookno =  Integer.parseInt(request.getParameter("bookno"));
		check = true;
	}
	catch(NumberFormatException e)
	{
		out.println("Please enter a Book NO .");
		return;
	}
	if(check)
	{
		st = con.prepareStatement("select * from BookNo where BookNo = ?");
		st.setInt(1,bookno);
		rs = st.executeQuery();
		if(!rs.next())
		{
			out.println("Invalid Book No. "+bookno);
		}
		else
		{
			st = con.prepareStatement("select * from Issue where BookNo = ?");
			st.setInt(1,bookno);
			rs = st.executeQuery();
			if(!rs.next())
			{
				out.println("Book is not issued by any Student.");
			}
			else
			{
				st = con.prepareStatement("delete from issue where BookNo = ?");
				st.setInt(1,bookno);
				int success = st.executeUpdate();
				if(success>0)
				{
					out.println("Successfully returned.");
				}
				else
				{
					out.println("An error occured during the process of returning .<br>Please tyr again.");
				}
			}
		}
	}
}
	%>
</font>
</body>
</html>
