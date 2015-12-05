<%@page contentType="text/html; charset=iso-8859-1" language="java" import="user.User" errorPage="" %>
<jsp:include page="/include/userSessionManager.jsp" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Online Air Ticketing</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<%
String usrId = request.getParameter("usrId").toString();
String firstName = request.getParameter("firstName").toString();
String middleName = request.getParameter("middleName").toString();
String lastName = request.getParameter("lastName").toString();
String username = request.getParameter("username").toString();
String password = request.getParameter("password").toString();
String phone = request.getParameter("phone").toString();
String mobileNo = request.getParameter("mobileNo").toString();
String address = request.getParameter("address").toString();
String email = request.getParameter("email").toString();
String bnkId = request.getParameter("bnkId").toString();
String accountNo = request.getParameter("accountNo").toString();

User usr = new User();

%>
<body>

<%

try{
	usr.updateUserDetail(usrId, firstName, middleName, lastName, address, phone, bnkId, accountNo, mobileNo, email,username,password);
		
}catch (Exception err){
	System.out.println("Exception in doEditAccountSetting: "+err);
	%>
		<jsp:forward page="userDashboard.jsp" >
			<jsp:param name="msg" value="Sorry,details could not be changed." />
		</jsp:forward>
	
	<%
}%>
		<jsp:forward page="userDashboard.jsp" >
			<jsp:param name="msg" value="Details Changed Succesfully" />
		</jsp:forward>

</body>
</html>
