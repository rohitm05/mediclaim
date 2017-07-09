<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>

a:link{
text-decoration: none;
}
.dropbtn {
    background-color: #333;
    color: white;
    padding: 16px;
    font-size: 16px;
    border: none;
    cursor: pointer;
}
.dropbtn:hover{
    background-color: #f98db2;
}
#b1{
border-style:ridge;
border-bottom-color:#555;
border-top-color:#252;
margin-top:50px;
padding-top:25px;
padding-left:20px;
padding-right:10px;
padding-bottom:50px;
background-color: lightcyan;
outline-style:solid;
outline-color: #444;
}
tr:hover
{
background-color:lightgreen;
}
#bt
{
background-color: #gb12cc;
}
</style>
</head>
<body bgcolor="lightgreen">
<form>
<%@page import="java.sql.*,p1.*,java.util.*" %>
<%
session =request.getSession(false);
String user=(String)session.getAttribute("user");
%>
<table align="right" >
<tr><td>welcome:&nbsp&nbsp</td><td><%= user %></td><td><a href="logout">&nbsp logout</a></td></tr>
</table>

<br>
<fieldset id="b1">
<img src="C:\Users\ARROW\Desktop\picture\hos.png" align="right" height="120px">
<br>
<table border="3" style="background-color:#bbccaa;">
<tr>
<th>D_code</th>

</tr>
<%
try
{
String cd=request.getParameter("t1");
String sql=("select uid,dcode,coverage,dname from disease_det join disease2 takes on disease2.code=disease_det.dcode where disease2.procode =?");
Connection cn=connect.getcon();
PreparedStatement ps=cn.prepareStatement(sql);
ps.setString(1, cd);
ResultSet rs=ps.executeQuery();
while(rs.next()) 
{
%>
<br><br><br><br>
<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
</tr>
<%}%>
</table>
<%}
catch(Exception e)
{
	e.printStackTrace();
}
%>
<%
try
{
	String cd=request.getParameter("t1");
	String sql1="select * from disease2 where procode=?";
	Connection cn=connect.getcon();
	PreparedStatement ps1=cn.prepareStatement(sql1);
	ps1.setString(1, cd);
	ResultSet rs1=ps1.executeQuery();
while(rs1.next())
{
	String dc=rs1.getString(2);
%>
<tr>
<td><%=rs1.getString(1) %></td>
<td><%=rs1.getString(2) %></td>
</tr>
<%
String uid=rs1.getString(1);
HttpSession ses=request.getSession();
ses.setAttribute("uid", uid);
String pr=request.getParameter("t1");
HttpSession ses1=request.getSession();
ses1.setAttribute("pr", pr);
HttpSession ses2=request.getSession();
ses2.setAttribute("dc", dc);
System.out.print(dc);
}
%>
<%}
catch(Exception e)
{
	e.printStackTrace();
}
%>
<br><br><br><br><br><br><br><br><br><br><br><br>
</form>
<center>
<a href="approve.jsp" class="dropbtn" role="button" id="bt">Approve claim</a>
<a href="reject.jsp" class="dropbtn" role="button" id="bt">Decline claim</a>

</fieldset>
</center>
</body>
</html>


</body>
</html>