<%@ page contentType="text/html" %>
<%
if((Integer)session.getAttribute("library_status")==0)
{
	response.sendRedirect("login.jsp");
}
java.sql.Connection con = (java.sql.Connection)(session.getAttribute("connection"));
java.sql.PreparedStatement st = null,st1=null;
java.sql.ResultSet rs = null,rs1=null;
int bookno = 0;
int bookid = 0;
String bookname = null,studentid=null,bookauthor=null,issuedate=null;
if(request.getParameter("bookno_submit")!=null)
{
	try
	{
		bookno = Integer.parseInt(request.getParameter("bookno"));
	}
	catch(Exception e)
	{
		out.println("Please enter Book NO.");
	}
	st = con.prepareStatement(" select BookID from BookNo where BookNo = ?");
	st.setInt(1,bookno);
	rs = st.executeQuery();
	if(!rs.next())
	{
		System.out.println("No result founded in DataBase .") ;
		return;
	}
	else
	{
		bookid = rs.getInt(1);
		st = con.prepareStatement(" select * from BookDetail where BookID = ?") ;
		st.setInt(1,bookid);
		rs = st.executeQuery();
		if(!rs.next())
		{
			System.out.println("DataBase Error :: Details of Book No. { bookno} corresponds to Book ID { bookid} is not founded in Database" );
			return;
		}
		bookname = rs.getString(2);
		bookauthor = rs.getString(3);
		st = con.prepareStatement(" select * from Issue where BookNo = ?");
		st.setInt(1,bookno);
		rs = st.executeQuery();
		if(!rs.next())
		{
			studentid="-";
			issuedate="-";
		}
		else
		{
			studentid=rs.getString(1);
			issuedate= rs.getString(3);
		}
			%>
<div align="center">
  <table width="597" border="1" cellspacing="5">
    <tr align="center">
      <th scope="col">Book ID </th>
      <th scope="col">Book Title </th>
      <th scope="col">Author</th>
      <th scope="col">Issued by</th>
      <th scope="col">Issued on </th>
    </tr>
    <tr align="center">
      <td>  <a href=./search_result.jsp?bookid_submit=true&bookid=<%=bookid%> target=search_result> <%=bookid%></a>&nbsp;</td>
      <td> <%=bookname%>&nbsp;</td>
      <td> <%=bookauthor%>&nbsp;</td>
      <td><a href=./bookissue.jsp?submit=true&studentid=<%=studentid%> target=viewport > <%=studentid%></a>&nbsp;</td>
      <td> <%=issuedate%>&nbsp;</td>
    </tr>
  </table>
</div>
<%
}  
}
%>
<%
if(request.getParameter("bookid_submit")!=null)
{
	try
	{
		bookid = Integer.parseInt(request.getParameter("bookid"));
	}
	catch(Exception e)
	{
		out.println("Please enter Book ID.");
	}
		st = con.prepareStatement(" select * from BookDetail where BookID = ?") ;
		st.setInt(1,bookid);
		rs = st.executeQuery();
		if(!rs.next())
		{
			System.out.println("DataBase Error :: Details of Book ID "+ bookid+" is not founded in Database" );
			return;
		}
		else
		{
			
			bookname = rs.getString(2);
			bookauthor = rs.getString(3);
%>
<div align="center">
  <table width="597" border="1" cellspacing="5">
    <tr align="center">
      <th scope="col">Book ID </th>
      <th scope="col">Book Title </th>
      <th scope="col">Author</th>
      <th scope="col">Books No.</th>
    </tr>
    <tr align="center">
      <td>  <a href=./search_result.jsp?bookid_submit=true&bookid=<%=bookid%> target=search_result> <%=bookid%></a>&nbsp;</td>
      <td> <%=bookname%>&nbsp;</td>
      <td> <%=bookauthor%>&nbsp;</td>
      <td>
	   <%
	   st = con.prepareStatement("select BookNo from BookNo where bookid = ?");
	   st.setInt(1,bookid);
	   rs = st.executeQuery();
	   while(rs.next())
	   {
		   bookno = rs.getInt(1);
	  %>
	  <a href=./search_result.jsp?bookno_submit=true&bookno=<%=bookno%> target=search_result > <%=bookno%></a>&nbsp;
	  <%
	   }
	  %>
	  </td>
    </tr>
  </table>
</div>
<%
} 
} 
%>

<%
if(request.getParameter("bookname_submit")!=null)
{
	int count = 0;
	try
	{
		bookname = request.getParameter("bookname");
	}
	catch(Exception e)
	{
		out.println("Please enter Book ID.");
	}
		st = con.prepareStatement(" select * from BookDetail where BookName like ?") ;
		st.setString(1,"%"+bookname+"%");
		rs = st.executeQuery();
		%>
		<div align="center">
  <table width="597" border="1" cellspacing="5">
    <tr align="center">
      <th scope="col">Book ID </th>
      <th scope="col">Book Title </th>
      <th scope="col">Author</th>
      <th scope="col">Books No.</th>
    </tr>

		<%
		while(rs.next())
		{
			
			bookid = rs.getInt(1);
			bookname = rs.getString(2);
			bookauthor = rs.getString(3);
			%>
    <tr align="center">
      <td>  <a href=./search_result.jsp?bookid_submit=true&bookid=<%=bookid%> target=search_result> <%=bookid%></a>&nbsp;</td>
      <td> <%=bookname%>&nbsp;</td>
      <td> <%=bookauthor%>&nbsp;</td>
      <td>
	   <%
	   st1 = con.prepareStatement("select BookNo from BookNo where bookid = ?");
	   st1.setInt(1,bookid);
	   rs1 = st1.executeQuery();
	   while(rs1.next())
	   {
		   bookno = rs1.getInt(1);
	  %>
	  <a href=./search_result.jsp?bookno_submit=true&bookno=<%=bookno%> target=search_result > <%=bookno%></a>&nbsp;
	  <%
	   }
	  %>
	  </td>
    </tr>
	<%
		}
	%>
  </table>
</div>
<%
}  
%>
<%
if(request.getParameter("bookauthor_submit")!=null)
{
	int count = 0;
	try
	{
		bookauthor = request.getParameter("bookauthor");
	}
	catch(Exception e)
	{
		out.println("Please enter Book Author.");
	}
		st = con.prepareStatement(" select * from BookDetail where Author like ?") ;
		st.setString(1,"%"+bookauthor+"%");
		rs = st.executeQuery();
		%>
		<div align="center">
  <table width="597" border="1" cellspacing="5">
    <tr align="center">
      <th scope="col">Book ID </th>
      <th scope="col">Book Title </th>
      <th scope="col">Author</th>
      <th scope="col">Books No.</th>
    </tr>

		<%
		while(rs.next())
		{
			
			bookid = rs.getInt(1);
			bookname = rs.getString(2);
			bookauthor = rs.getString(3);
			%>
    <tr align="center">
      <td>  <a href=./search_result.jsp?bookid_submit=true&bookid=<%=bookid%> target=search_result> <%=bookid%></a>&nbsp;</td>
      <td> <%=bookname%>&nbsp;</td>
      <td> <%=bookauthor%>&nbsp;</td>
      <td>
	   <%
	   st1 = con.prepareStatement("select BookNo from BookNo where bookid = ?");
	   st1.setInt(1,bookid);
	   rs1 = st1.executeQuery();
	   while(rs1.next())
	   {
		   bookno = rs1.getInt(1);
	  %>
	  <a href=./search_result.jsp?bookno_submit=true&bookno=<%=bookno%> target=search_result > <%=bookno%></a>&nbsp;
	  <%
	   }
	  %>
	  </td>
    </tr>
	<%
		}
	%>
  </table>
</div>
<%
}  
%>
</div>
<p>&nbsp;</p>

</body>
</html>
