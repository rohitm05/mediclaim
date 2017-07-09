<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
div.end{
    border:10px solid lightgreen;
    width:100%;
}
#br1
{
border-style:solid;
border-color:red;
margin-left:200px;
margin-right:200px;
margin-top:100px;
margin-bottom:100px;
padding-left:65px;
background-color:light;
}
#br2
{
background-color:orange;
}
tr:hover
{
background-color:lightgreen;
}
input[type=submit] {
    width: 70%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #333;
}

</style>
</head>
<body bgcolor="lightcyan">
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
<fieldset id="br1">
<Form action="users.jsp">
<input type="submit" value="Manage users" id="bt">
</Form>
<br><br>
<Form action="staff_main.jsp">
<input type="submit" value="Smart card balance entry" id="bt">
</Form>
</fieldset>
<div class="end" style="background-color:lightgreen;">
<h2>Instruction</h2>
<p align="center">
<ul>
<li>If u want to <u>manage the users</u> click on "Manage user"</li>
<li>If u want to <u>Enter balance in smart card</u> click on  "Smart Card balance entry"</li>
</ul>
</div>

</body>
</html>