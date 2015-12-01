<%@page contentType="text/html; charset=iso-8859-1" language="java" import="admin.Admin" errorPage="" %>
<jsp:include page="/include/adminSessionManager.jsp" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Online Air Ticketing</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<%
String admId = request.getParameter("admId").toString();
String fullname = request.getParameter("fullname").toString();
String username = request.getParameter("username").toString();
String password = request.getParameter("password").toString();
String phone = request.getParameter("phone").toString();
String mobileNo = request.getParameter("mobileNo").toString();
String address = request.getParameter("address").toString();
String email = request.getParameter("email").toString();

Admin admin = new Admin();

%>
<body>

<%

try{
		admin.updateAdminDetail(admId, fullname, address, phone, mobileNo, email, username, password);
		
}catch (Exception err){
	System.out.println("Exception in doAddBank: "+err);
	%>
		<jsp:forward page="adminDashboard.jsp" >
			<jsp:param name="msg" value="Sorry,details could not be changed." />
		</jsp:forward>
	
	<%
}%>
		<jsp:forward page="adminDashboard.jsp" >
			<jsp:param name="msg" value="Details Changed Succesfully" />
		</jsp:forward>

</body>
</html>
