<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<style>
#pr
{
border-style:solid;
border-color:red;
padding-bottom:25px;
}
.dropbtn {
    background-color: #333;
    color: white;
    padding: 16px;
    font-size: 16px;
    border: none;
    cursor: pointer;
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: lightgreen;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

.dropdown-content a {
    color: red;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {background-color: #ff99dd}

.dropdown:hover .dropdown-content {
    display: block;
}

.dropdown:hover .dropbtn {
    background-color: #cc22cc;

}
.dropbtn:hover{
background-color: magenta;
}
li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}
div.end{
    border:10px solid lightgreen;
    width:100%;
}

</style>
<body bgcolor="lightcyan">
<form action="connector" method="get">
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
<br><br><br><br><br><br>

 <div class="dropdown" align="center">
<button class="dropbtn"align="center">Manage User</button>
<div class="dropdown-content">
<ul>
<li><a href="userdetails.jsp">Display all</a></li>
	<li><a href="searchuser.jsp">Search User</a></li>
	<li><a href="deluser.jsp">Delete User</a></li>
	</ul>
</div>
</div>
 <div class="dropdown" align="center">
 <button class="dropbtn"align="center">Send Mail</button>
<div class="dropdown-content">
<ul>
<li><a href="index.jsp">Send Mail</a></li>
</ul>
</div>
</div>
</center>

<br><br><br><br><br><br><br><br><br><br>

<div class="end" style="background-color:lightgreen;">
<h2>Instruction</h2>
<p>
<ul>
<li>If u want to manage the users click on "Manage user"</li>
<li>If u want to <u>Send Mail</u> click on  "Send Mail"</li>
</ul>
</div>

</form>
</body>
</html>