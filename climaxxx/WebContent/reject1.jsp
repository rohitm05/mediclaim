<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Declined</title>
</head>
<body bgcolor="lightcyan">
<%
session =request.getSession(false);
String user=(String)session.getAttribute("user");
%>
<table align="right" >
<tr><td>welcome:&nbsp&nbsp</td><td><%= user %></td><td><a href="logout">&nbsp logout</a></td></tr>
</table>
<br><br>
<br><br>
<h1>Claim successfully declined</h1>
<center>
<a href="nodalapprove.jsp">GoTO Approval Page</a> 
</center>
</body>
</html>