<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome Users</title>
<style type="text/css">
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
#ck
{
 width: auto;
height:200px;
background-color: red;
position: relative;
animation-name: example;
animation-delay:0s;
animation-duration: 10s;
animation-iteration-count:4;
animation-direction:alternate;
}
@keyframes example
{
0%{background-color:#b3ffb3;}
25%{background-color:#ccffff;}
50%{background-color:#ffffcc;}
75%{background-color:#ff9999;}
100%{background-color:#ffb3ff;}
}
</style>
</head> 
<body id="ck">
<br>
<br>
<br>
<br>
<br>
<br>
<div align="center">
<a href="clientsignin.jsp" class="dropbtn" role="button" id="b2" >Sign In</a>
<a href="clientsignup.jsp" class="dropbtn" role="button" id="b2">New User?Sign Up</a>
</div>
</body>
</html>