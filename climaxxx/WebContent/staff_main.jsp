<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
#br1
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
#br2
{
background-color:orange;

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
</head>
<body style="background-color:lightgreen;">

<%@page import="java.sql.*,p1.*,java.util.*" %>
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
<br><br>
<form action="uidcheck.jsp">
<center>
<br><br>
<fieldset id="br1">
<select name="t1">
<option>---Please select an USERID---</option>
<%
Connection cn=connect.getcon();
PreparedStatement ps=cn.prepareStatement("select uid from usr");
ResultSet rs=ps.executeQuery();
while(rs.next())
{
%>
<option><%=rs.getString(1)%></a></option>
<%} %>
</select>
<br><br><br><br><br><br><br><br>
<input type="submit" value="Login" id="bt" >
</center>
</fieldset>
</form>
</body>
</html>