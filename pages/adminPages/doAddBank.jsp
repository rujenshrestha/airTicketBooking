<%@page contentType="text/html; charset=iso-8859-1" language="java" import="bank.Bank" errorPage="" %>
<jsp:include page="/include/adminSessionManager.jsp" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Online Air Ticketing</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<%
String bankDesc = request.getParameter("bankDesc").toString();
Bank bank = new Bank();

%>
<body>

<%

try{
		bank.addBank(bankDesc);
		
}catch (Exception err){
	System.out.println("Exception in doAddBank: "+err);
}%>
		<jsp:forward page="addBank.jsp" >
			<jsp:param name="msg" value="Bank Added Succesfully." />
		</jsp:forward>

</body>
</html>
