<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<%@ page import="admin.Admin"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Online Air Ticketing</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<%
String username = request.getParameter("username").toString();
String password = request.getParameter("password").toString();


Admin admin = new Admin();

%>
<body>

<%

try{
		admin.addAdmin(fullName, address, phone, mobileNo, email,username,password);
		
}catch (Exception err){
	System.out.println("Exception in doAddAdmin: "+err);
}%>
		<jsp:forward page="addAdmin.jsp" >
			<jsp:param name="msg" value="Admin Added Successfully." />
		</jsp:forward>

</body>
</html>
