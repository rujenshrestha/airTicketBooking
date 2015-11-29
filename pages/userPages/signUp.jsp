<%@page contentType="text/html; charset=iso-8859-1" language="java" import="user.User" errorPage="" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Online Air Ticketing</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<%
String firstName = request.getParameter("fname").toString();
String middleName = request.getParameter("mname").toString();
String lastName = request.getParameter("lname").toString();
String username = request.getParameter("username").toString();
String pwd = request.getParameter("pwd").toString();
String address = request.getParameter("address").toString();
String phone = request.getParameter("phone").toString();
String mobileNo = request.getParameter("mobileNo").toString();
String email = request.getParameter("email").toString();
String bnkId = request.getParameter("bnkId").toString();
String accountNo = request.getParameter("accountNo").toString();

User user = new User();

%>
<body>

<%

try{
		user.addUser(firstName,middleName,lastName,address,phone,mobileNo,email,bnkId, accountNo,username,pwd);
		%><jsp:forward page="../../login/login.jsp" >
			<jsp:param name="msg" value="Please log in to continue" />
		  </jsp:forward>
	<%
}catch (Exception err){
	System.out.println("Exception in signUp.jsp: "+err);
}%>
		<jsp:forward page="../../login/login.jsp" >
			<jsp:param name="msg" value="Please log in to continue" />
		</jsp:forward>

</body>
</html>
