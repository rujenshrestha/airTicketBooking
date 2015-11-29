<%@page contentType="text/html; charset=iso-8859-1" language="java" import="admin.Admin" errorPage="" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Online Air Ticketing</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<%
String fullName = request.getParameter("fullname").toString();
String username = request.getParameter("username").toString();
String password = request.getParameter("password").toString();
String address = request.getParameter("address").toString();
String phone = request.getParameter("phone").toString();
String mobileNo = request.getParameter("mobileNo").toString();
String email = request.getParameter("email").toString();

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
