<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<!-- Add this two packages -->
<%@page import="java.util.*,javax.mail.*" %>
<%@page import="javax.mail.internet.*" %>
<script>
function check()
{
	var x=document.frm.t1.toString();
	var y=document.otp.toString();
	if(x==y)
		{
			return true;
		}
	else
		{
			return false;
		}
	document.getElementById("demo").innerHTML =typeof(x); 
}
</script>
<!-- creating a result for getting status that message is delivered or not -->
<%
String result;
//get recipient's emaid,message & subject line from index.jsp
session=request.getSession();
String id1=(String)session.getAttribute("userid");
String cno=(String)session.getAttribute("cno");
String pass1=(String)session.getAttribute("pass");
final String to=request.getParameter("t3");
final String subject=("WELCOME TO RM INSURANCE");
String pas=request.getParameter("t2");
final String messg=("CONFIRMATION MAIL.\n\n Your uid is : " + id1+" \n Your card number is: "+cno+"\nYour password is "+pass1);
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
	
	result="Mail sent successfully .Please check your user Id in your mail";	
}
catch(MessagingException mex)
{
	mex.printStackTrace();
	result="error : unable to send mail";
}
%>
<title>Sending mail in jsp</title>
<h1><center><font color="blue">sending mail using jsp</font></center></h1>
<b><center><font color="red"><%out.print(result); %></center>
<br><br>
<center>
<a href="clientsignin.jsp">PROCEED</a>
</center>
</body>
</html>