<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<script>
function check()
{
	var x=document.getElementById("pass").value;
	var y=document.getElementById("nm").value;
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
tr:hover
{
background-color:magenta;
}
#b1{
border-style:ridge;
border-bottom-color:green;
border-top-color:cyan;
margin-top:50px;
padding-top:25px;
padding-left:160px;
padding-right:50px;
padding-bottom:35px;
background-color: silver;
outline-style:solid;
outline-color: red;
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

div {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 40px;
}
</style>
<body style="background:linear-gradient(#ccffff,#ccffcc);">
<form onsubmit="return check()" action="signincheck" >
<div>
    <label for="uid">Enter User Id</label>
    <input type="text" id="log" name="t1" id="b1">
    <label for="pass">Enter Password</label>
    <input type="password" id="log" name="t2" id="b1">
    <input type="submit" value="Login">
</div>
</form>
</body>
</html>