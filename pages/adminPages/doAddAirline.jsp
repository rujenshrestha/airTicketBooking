<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<%@ page import="airline.Airline"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Online Air Ticketing</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<%
String alnDesc = request.getParameter("alnDesc").toString();
Airline air = new Airline();

%>
<body>

<%

try{
		air.addAirline(alnDesc);
		
}catch (Exception err){
	System.out.println("Exception in doAddAirline: "+err);
}%>
		<jsp:forward page="addAirline.jsp" >
			<jsp:param name="msg" value="Airline Added Succesfully." />
		</jsp:forward>

</body>
</html>
