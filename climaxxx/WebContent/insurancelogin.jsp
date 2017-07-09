<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insurance</title>
<script>
function check()
{
	var x=document.getElementById("t1").value;
	var y=document.getElementById("t2").value;
	 if((x.length)==0&&(y.length==0))
	{
		window.alert("Password and id must not be empty");
		return false;
	}
	 else if((x.length)==0 )
	{
		window.alert("Password must not be empty");
		return false;
	}
	 else if((y.length)==0 )
		{
			window.alert("ID must not be empty");
			return false;
		}
}
</script>


<style>
#b1{
border-style:ridge;
border-bottom-color:green;
border-top-color:cyan;
padding-top:25px;
padding-left:35px;
padding-right:40px;
padding-bottom:15px;
background-color: gold;
outline-style:solid;
outline-color: red;
}
tr:hover 
{
background-color: green;
}
img {
    float: right;
    margin: 0 0 10px 10px;
}
input[type=text],[type=password],[type=file], select{
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
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

div{
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 40px;
    
}
</style>
</head>
<body bgcolor="lightgreen">
<form onsubmit="return check()" action="userdata2">
<br><br><br>
<img src="C:\Users\ARROW\Desktop\picture\ban.png" align="right" height="120px">
<br><br><br><br><br><br><br>
<div>

    <label for="uid">Enter Admin Id</label>
    <input type="text" id="nm" name="t1">
    <label for="pass">Enter Password</label>
    <input type="password" id="pass" name="t2">
    <input type="submit" value="Login" id="bt" onclick="check()">
</div>
<%session=request.getSession();
session.setAttribute("admin", "admin");
%>
<br><br><br>
</form>
</body>
</html>