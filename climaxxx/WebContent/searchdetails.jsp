<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="lightcyan">
<%@page import="java.sql.*,p1.*,java.util.*" %>
<form>
<center>
<table align="right">
<tr>
<td><font color="#180FD7">Welcome: &nbsp&nbsp</font></td>
<%
session=request.getSession();
String admin=(String)session.getAttribute("admin");
%>
<td><%=admin%>&nbsp&nbsp</td>
<td><a href="logout">Logout</a></td>
</tr>
</table>
<br><br><br><br>
</tr></table>
<%
try
{
String area=request.getParameter("t2");
Connection cn=connect.getcon();
String name=request.getParameter("t1");
PreparedStatement ps=cn.prepareStatement("select * from usr where uid=?");
ps.setString(1, name);
ResultSet rs=ps.executeQuery();
%>
<table border="4" style="color:green">
<tr>
<th>Userid</th>
<th>Name</th>
<th>Address</th>
<th>Mobile</th>
<th>E-Mail</th>
<th>Photo</th>
</tr>
<%
while(rs.next())
{
%>
<tr>
<td><%=rs.getString(7) %></td>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(6) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(3) %></td>
<td rowspan="2"><img src="<%=rs.getString(5) %>" height=100 width=100 ></td>
</tr>
<%}%>
</table>

<%}
catch(Exception e){
	e.printStackTrace();
}%>
</center>
</form>
</body>
</html>
