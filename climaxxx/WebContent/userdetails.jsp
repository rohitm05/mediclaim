<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.*,p1.*,java.util.*" %>
<form>
<center>
<br><br><br><br>
<table border="4" style="color:green">
<tr>
<th>Cardno</th>
<th>Name</th>
<th>Contact</th>
<th>Insured Balance</th>
<th>Previous Claims</th>
<th>Balance Amount</th>

</tr>
<%
try
{
Connection cn=connect.getcon();
PreparedStatement ps=cn.prepareStatement("select * from card");
ResultSet rs=ps.executeQuery();
while(rs.next())
{
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td>
<td><%=rs.getString(6) %></td>
</tr>
<%}%>
<%}
catch(Exception e){
	e.printStackTrace();
}%>
</form>
</center>
</body>
</html>
</body>
</html>