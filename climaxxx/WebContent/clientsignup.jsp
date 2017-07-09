<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
input[type=text],[type=password],[type=file],[type=email], select{
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type=submit] {
    width: 100%;
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
</head>
<body>
<form action="userdata"  method="post" enctype="multipart/form-data">
<div>
  <!--  <label for="uid">Enter User Id</label>
    <input type="text" id="log" name="uid">-->
     <label for="t1">Enter Name</label>
    <input type="text" id="log" name="t1">
    <label for="t2">Enter Password</label>
    <input type="password" id="log" name="t2">  
    <label for="t3">Enter Email</label>
    <input type="email" id="log" name="t3">
    <label for="t4">Enter Phone number</label>
    <input type="text" id="log" name="t4">
    <label for="t5">Enter Address</label>
    <input type="text" id="log" name="t5">
    <label for="file">Upload Photo</label>
    <input type="file" id="log"  name="file">
  
    <input type="submit" value="Submit">
  </form>
</div>
</form>
</body>
</html>