<%@page contentType="text/html; charset=iso-8859-1" language="java" import="airline.Airline" errorPage="" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Online Air Ticketing</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<%
String airlineDesc = request.getParameter("airlineDesc").toString();
String alnId = request.getParameter("alnId").toString();
Airline air = new Airline();

%>
<body>

<%

try{
		air.updateAirlineDetail(alnId, airlineDesc);
		
}catch (Exception err){
	System.out.println("Exception in doAddAirline: "+err);
	%>
		<jsp:forward page="viewAirline.jsp" >
			<jsp:param name="msg" value="Airline Could Not Be Updated." />
		</jsp:forward>
	
	<%
	
}%>
		<jsp:forward page="viewAirline.jsp" >
			<jsp:param name="msg" value="Airline Updated Succesfully." />
		</jsp:forward>

</body>
</html>
