<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
#b1
{
border-style:solid;
border-color:green; 
padding-left:50px;
margin-top:125px;
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
</head>
<body bgcolor="lightgreen">
<center>
<fieldset id="b1">
<form action="index1.jsp">
<input type="submit" value="Send Mail" id="bt">
</form>
<br><br><br>
<form action="nodalapprove.jsp">
<input type="submit" value="Approve process" id="bt">
</form>
</fieldset>
</center>
</body>
</html>