<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">

input[type=submit] {
    width: 40%;
    background-color: #4CAF50;
    color: white;
    padding: 8px 12px;
    margin: 3px 0;
    border: none;
    border-radius: 2px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}

div {
    border-radius: 2px;
    background-color: #f2f2f2;
    padding: 2px;
}
</style>
</head>
<body bgcolor="lightpink">
<form action="release">
<center>
<%@page import="java.sql.*,p1.*,java.util.*" %>
<table align="right">
<tr>
<td><font color="#ffb3b3">Welcome: &nbsp&nbsp</font></td>
<%
session=request.getSession();
String user=(String)session.getAttribute("users");
%>
<td><%=user%>&nbsp&nbsp</td>
<td><a href="logout1">Logout</a></td>
</tr>
</table>
<br><br><br>
<table border="4" style="background-color:#b3fff0">
<tr>
<th>uid</th>
<th>Name</th>
<th>Email</th>
<th>cardno</th>
</tr>
<%
try
{
Connection cn=connect.getcon();
PreparedStatement ps=cn.prepareStatement("select * from usr");
ResultSet rs=ps.executeQuery();
while(rs.next())
{
%>
<tr>
<td><%=rs.getString(7) %></td>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(8) %></td>
</tr>
<%}%>
</table>
<br><br><br>
<table border="2">
<tr><td style="background-color:#ccffcc">Enter the card number to Delete</td><td><input type="text" name="t1"></td></tr>
</table>
<%}
catch(Exception e){
	e.printStackTrace();
}%>
<br><br><br><br><br>
<input type="submit" value="proceed">

</center>
</form>
</body>
</html>
