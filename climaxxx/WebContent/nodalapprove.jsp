<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
#b1
{
border-style:solid;
border-color:green; 
padding-left:50px;
padding-top:25px;
margin-left:50px;
margin-right:50px;
margin-bottom:50px;
background-color:cyan;
}
tr:hover
{
background-color:grey;
}
input[type=submit] {
    width: 40%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}

</style>
<body style="background-color:lightgreen;">
<%@page import="java.sql.*,p1.*,java.util.*" %>
<%
session =request.getSession(false);
String user=(String)session.getAttribute("user");
%>
<table align="right">
<tr><td>welcome:&nbsp&nbsp</td><td><%= user %></td><td><a href="logout">&nbsp logout</a></td></tr>
</table>
<form action="nodalapprove1.jsp">
<br><br><br><br><br>
<center>
<fieldset id="b1">
<select name="t1">
<option>---Select a procedure code---</option>
<%
try
{
Connection cn=connect.getcon();
String name=request.getParameter("t1");
PreparedStatement ps=cn.prepareStatement("select procode from disease2");
ResultSet rs=ps.executeQuery();
while(rs.next())
{
%>
<option><%=rs.getString(1) %></option>
<%}%>
</select>
<%}
catch(Exception e){
	e.printStackTrace();
}%>
<br><br>
<br><br>
<input type="submit" value="Proceed" id="bt" onclick="check()">
</fieldset>
</form>
</center>
</body>
</html>