<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="lightcyan">
<!-- Add this two packages -->
<%@page import="java.util.*,javax.mail.*" %>
<%@page import="javax.mail.internet.*" %>
<!-- creating a result for getting status that message is delivered or not -->
<%
String result;
//get recipient's emaid,message & subject line from index.jsp
session=request.getSession(false);
String user=(String)session.getAttribute("uid");
String pr1=(String)session.getAttribute("pr");
final String to="cse1405256@gmail.com";
final String subject=("CLAIM DECLINE CONFIRMATION");
final String messg=("CLAIM OF USERID: " + user+ " is REJECTED WITH PROCEDURE CODE: "+pr1);
//sender's emailid and password needs to be mentioned

final String from="alittlebirds@gmail.com";
final String pass="ranabhattacharyya";

//defining the gmail host
String host="smtp.gmail.com";


//creating properties object
Properties props=new Properties();

//defining properties

props.put("mail.smtp.host", host);
props.put("mail.transport.protocol", "smtp");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.user", from);
props.put("mail.password", pass);
props.put("mail.port","465");

//Authorized the session object

Session mailSession=Session.getInstance(props,new Authenticator(){
	@Override
	
	protected PasswordAuthentication getPasswordAuthentication(){
		return new PasswordAuthentication(from,pass);
	}	
});
try{
	//create a default MimeMessage object
	MimeMessage message=new MimeMessage(mailSession);
	
	//set From : header field of header
	
	message.setFrom(new InternetAddress(from));
	
	//set To : header field of header
	
		message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
	
	// set Subject : header field
	message.setSubject(subject);
	
	//set actual message
	
	message.setText(messg);
	
	//send message
	
	Transport.send(message);
	
	result="Mail sent successfully";	
}
catch(MessagingException mex)
{
	mex.printStackTrace();
	result="error : unable to send mail";
}
%>
<h1><center><font color="blue">sending mail using jsp</font></center></h1>
<b><center><font color="red"><%out.print(result); %></center>
<br><br>
<center>
<a href="cal1">PROCEED</a>
</center>
</body>
</html>