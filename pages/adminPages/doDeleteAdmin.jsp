<%@page contentType="text/html; charset=iso-8859-1" language="java" import="admin.Admin" errorPage="" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Online Air Ticketing</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<%
String admId = request.getParameter("admId").toString();


Admin admin = new Admin();

%>
<body>

<%

try{
		admin.deleteAdmin(admId);
		
}catch (Exception err){
	System.out.println("Exception in doDeleteAdmin: "+err);
	%>
		<jsp:forward page="viewAdmin.jsp" >
			<jsp:param name="msg" value="Admin Could Not Be Deleted" />
		</jsp:forward>
	<%
}%>
		<jsp:forward page="viewAdmin.jsp" >
			<jsp:param name="msg" value="Admin Deleted Successfully." />
		</jsp:forward>

</body>
</html>
