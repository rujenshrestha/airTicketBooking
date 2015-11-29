<%@page contentType="text/html; charset=iso-8859-1" language="java" import="bank.Bank" errorPage="" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Online Air Ticketing</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<%
String bnkId = request.getParameter("bnkId").toString();
Bank bank = new Bank();

%>
<body>

<%

try{
		bank.deleteBank(bnkId);
		
}catch (Exception err){
	System.out.println("Exception in doDeleteBank: "+err);
	%>
		<jsp:forward page="viewBank.jsp" >
			<jsp:param name="msg" value="Bank Could Not Be Deleted" />
		</jsp:forward>
	<%
}%>
		<jsp:forward page="viewBank.jsp" >
			<jsp:param name="msg" value="Bank Deleted Succesfully." />
		</jsp:forward>

</body>
</html>
