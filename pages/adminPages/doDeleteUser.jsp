<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<jsp:include page="/include/adminSessionManager.jsp" />
<%@ page import="user.User"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Online Air Ticketing</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<%
String usrId = request.getParameter("usrId").toString();

User user = new User();

%>
<body>

<%

try{
		user.deleteUser(usrId);
		
}catch (Exception err){
	System.out.println("Exception in doAddAdmin: "+err);
	%>
		<jsp:forward page="viewUser.jsp" >
			<jsp:param name="msg" value="User Could Not Be Disabled" />
		</jsp:forward>
	<%
}%>
		<jsp:forward page="viewUser.jsp" >
			<jsp:param name="msg" value="User Disabled Successfully." />
		</jsp:forward>

</body>
</html>
