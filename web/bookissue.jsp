<%@ page contentType="text/html" %>
<%
if((Integer)session.getAttribute("library_status")==0)
{
	response.sendRedirect("login.jsp");
}
session.setAttribute("viewport",1);
String studentid=null;
String name = null;
String father =null;
int delay_fine = 0;
int bookissued =0;
int[] issuedBookNo = new int[4];
if(session.getAttribute("studentid")!=null)
{
 studentid = session.getAttribute("studentid").toString();
}
session.setAttribute("viewport",1);
java.sql.Connection con=null;
java.sql.PreparedStatement st = null,st1=null,st2=null;
java.sql.ResultSet rs = null,rs1=null,rs2=null;
try
	{
	String userid = session.getAttribute("userid").toString();
	String password = session.getAttribute("password").toString();
	con = (java.sql.Connection)session.getAttribute("connection");
	}
	catch(Exception e)
	{
		out.println("Sorry , connection lost.");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Book Issue</title>
</head>

<body>
<input type=button value=Print onclick="parent.print();" />
<font size="+2" face="Courier New, Courier, monospace"  color="#553F00" >
<form id="form1" name="form1" method="get" action="bookissue.jsp">
  <div align="center">Student ID
    <input type="text" name="studentid" /> 
    <input type="submit" name="submit" value="Submit" />
	</div>
</form>
 
<%
if( request.getParameter("submit")!=null|| studentid!=null)
{
	if(request.getParameter("submit")!=null)
	{
	 studentid = request.getParameter("studentid") ;
	}
	st = con.prepareStatement("select * from StudentDetail where Id = ?");
	st.setString(1,studentid);
	rs = st.executeQuery();
	if(rs.next())
	{
		session.setAttribute("studentid",studentid);
		name = rs.getString(2);
		father = rs.getString(3);
		delay_fine = rs.getInt(4);
		st = con.prepareStatement("select count(*) from issue where id = ?");
		st.setString(1,studentid);
		rs = st.executeQuery();
		if(rs.next())
		{
			bookissued = rs.getInt(1);
		}
		else
		{
			bookissued = 0;
		}
%> 

<div align="center">
   <table  border="5" cellspacing="1">
     <tr height=40>
       <th width="139" scope="col">Student ID </th>
       <th width="215" scope="col">Name</th>
       <th width="220" scope="col">Father's Name </th>
       <th width="280" scope="col"><p>No. of Book Issued </p>      </th>
       <th width="150" scope="col">Fine</th>
     </tr>
     <tr>
       <td height="39"><div align="center"><%=studentid %>&nbsp;
       </div></td>
       <td><div align="center"><%=name%>&nbsp;
       </div></td>
       <td><div align="center"><%= father %>&nbsp;
       </div></td>
       <td><div align="center"><%=bookissued%>&nbsp;
       </div></td>
       <td><div align="center">Rs <%=delay_fine %>&nbsp;
       </div></td>
     </tr>
   </table>
 <%
	
	if(bookissued>0)
	{
		
	%>
	 <div align="center">
  <table   border="1" cellspacing="2">
      <tr>
         <th width="30" scope="col">S.No.</th>
      <th width="50" scope="col">Book No. </th>
      <th width="50" scope="col">Book ID </th>
      <th width="650" scope="col">Book Title </th>
      <th width="500" scope="col">Authors</th>
    </tr>
<%
		
		st2 = con.prepareStatement("select BookNo from issue where id = ?");
		st2.setString(1,studentid);
		rs2 = st2.executeQuery();
		int sno=0;
		int bn=0;
		while(rs2.next())
		{
			bn= rs2.getInt(1);
			sno++;
			st = con.prepareStatement("select BookID from BookNo where bookno = ?");
			st.setInt(1,bn);
			rs = st.executeQuery();
			if(rs.next())
			{
				int bid = rs.getInt(1);
				st1 = con.prepareStatement("select * from BookDetail where BookID = ?");
				st1.setInt(1,bid);
				rs1 = st1.executeQuery();
				if(rs1.next())
				{
					String bname = rs1.getString(2);
					String bauthor = rs1.getString(3);
		%>
	 <tr>
       <th width="58" scope="col"><%=sno%></th>
      <td width="76" scope="col"> <%=bn %></th>
      <td width="71" scope="col"> <%=bid%></th>
      <td width="276" scope="col"> <%=bname%></th>
	        <td width="360" scope="col"> <%=bauthor%></th>
    </tr>

   <% 
				}
			}
		}
	}

	%>
	   </table>
   </div> 
	<%
	if(bookissued<4)
	{
	%>
	 <form name="issue" id="issue" method="get" action="bookissue.jsp">
		Book No <input type="number" name="bookno" />
		<input type="submit" name="add" value="Issue" />
	 </form>
	<%
	}
	if(request.getParameter("add")!=null)
	{
		int bookno=0;
		try
		{
			 bookno = Integer.parseInt(request.getParameter("bookno"));
			 out.println(bookno+"<br>");
			 st = con.prepareStatement("select * from BookNo where BookNo = ?");
			 st.setInt(1,bookno);
			 rs = st.executeQuery();
			 if(!rs.next())
			 {
				 out.println("Sorry , Invalid Book No.");
			 }
			 else
			 {
				st = con.prepareStatement("select * from BookAvailable where BookNo = ?");
				st.setInt(1,bookno);
				rs = st.executeQuery();
				if(!rs.next())
				{
					out.println("Sorry ,Book with given Book No. "+bookno+" is not available in Library .<br> It is issued by another-one.<br>");
				}
				else
				{
					String date_sec = System.currentTimeMillis()+"";
					out.println(date_sec);
					st = con.prepareStatement("delete from BookAvailable where BookNo = ?");
					st.setInt(1,bookno);
					st.executeUpdate();
					st = con.prepareStatement("INSERT INTO  issue (Id ,BookNo ,Date)VALUES (?,  ?,  ?);");
					st.setString(1,studentid);
					st.setInt(2,bookno);
					st.setString(3,date_sec);
					st.executeUpdate();
					response.sendRedirect("bookissue.jsp");
				}
			 }
		}
		catch(NumberFormatException e)
		{
			out.println("Please enter a Book No.");
		}
		catch(java.sql.SQLException e)
		{
			out.println(e+"");
		}
		catch(Exception e)
		{
			out.println(e+"");
		}
	}
	}
	else
	{
		out.println("Sorry , Invalid Student ID.");
	}
}
	
	%>
  	</div>
	</font>
</body>
</html>
