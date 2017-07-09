<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#b1
{
border:5px solid grey;
padding-left:50px;
padding-top:25px;
margin-left:40px;
margin-right:40px;
background-color:lightcyan;
}
tr:nth-child(even)
{
background-color:grey;
}
tr:nth-child(odd)
{
background-color:lime;
}
input[type=submit] {
    width: 40%;
    background-color: #4CA049;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45af50;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@page import="java.sql.*,p1.*,java.util.*" %>
<%
session =request.getSession();
String user=(String)session.getAttribute("users");
%>
<body style="background-color:lightgreen;">
<form action="diseasesubmit">
<center>
<table align="right">
<tr><td>welcome:&nbsp&nbsp</td><td><%= user %></td><td><a href="logout">&nbsp logout</a></td></tr>
</table>
<br><br>
<fieldset id="b1">
<table border="2" style="text-align:left;">
<tr>
<th>Disease code</th>
<th>Disease name</th>
<tr>
<%
try
{
Connection cn=connect.getcon();
String name=request.getParameter("t1");
PreparedStatement ps=cn.prepareStatement("select * from disease_det");
ResultSet rs=ps.executeQuery();
while(rs.next())
{
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td> 
</tr>
<%}%>
</table>
<%}
catch(Exception e)
{
	e.printStackTrace();
}%>
<br><br>
<input type="text" placeholder="Enter the disease code for which you want to avail the insurance" size="65" name="t1">
<br><br>
 <input type="submit" value="Proceed">
</center>
</fieldset>
</form>
</body>
</html>