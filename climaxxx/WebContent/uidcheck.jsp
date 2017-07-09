<%@page import="p1.connect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter,java.util.*,java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
input[type=submit] {
    width: 30%;
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
</head>
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
<body bgcolor="lightcyan">
<br><br>
<center>
<% 
try
{
	String crd="";
	String uid=request.getParameter("t1");
	String sql="select cardno from usr where uid=?";
	Connection cn=connect.getcon();
	PreparedStatement ps=cn.prepareStatement(sql);
	ps.setString(1, uid);
	ResultSet rs=ps.executeQuery();
	PrintWriter pr=response.getWriter();
	if(rs.next())
		{
			crd=rs.getString(1);
			rs.getString(1);	
			pr.println("Card number is "+rs.getString(1));
%> 
<%}%>
<% session=request.getSession();
session.setAttribute("curd", crd);
%>
<%
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
<br><br><br><br><br>
<form action="balinput">
<input type="text" placeholder="Enter the balance amount to input" size="40" name="t1">
<input type="submit" value="Continue">
</form>
</center>
</body>
</html>