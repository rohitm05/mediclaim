<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
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
<body>
<body bgcolor="lightcyan"">
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
<br><br>
<form action="searchdetails.jsp">
<br><br>
<table border="4" >
<tr>
<br><br><br><br><br>
<td>Enter userid to search</td><td><Input type ="text" name="t1"  width="100"></td></tr>
</table>
<br>
<br><br>
<Input type ="submit" value="search" id="bt">
</center>
</form>
</body>
</html>