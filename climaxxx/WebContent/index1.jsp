<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="cyan">
<form action="mail2.jsp">
<table>
<tr>
<td><b><font color="red">To</font></b></td>
<td><b><input type="text" name="mail" placeholder="sender address"></td><br/>
</tr>
<tr>
<td><font color="red">Subject:</font></td>
<td><input type="text" name="sub" placeholder="Enter subject"></td>
</tr>
<tr>
<td><b><font color="red">Message Text :</font></b></td>
<td><textarea rows="12" cols="80" name="mess"></textarea><br></td>
</tr>
<tr>
<td><input type="submit" value="Send"></td>
<td><input type="reset" value="Reset"></td>
</tr>
</table>
</form>

</body>

</html>