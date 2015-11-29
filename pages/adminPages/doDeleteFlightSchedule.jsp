<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<%@ page import="schedule.Schedule"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Online Air Ticketing</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<%
String schId = request.getParameter("schId").toString();

Schedule sch = new Schedule();


%>
<body>

<%

try{
		sch.deleteSchedule(schId);
		
}catch (Exception err){
	System.out.println("Exception in doDeleteFlightSchedule: "+err);
	%>
		<jsp:forward page="viewFlightSchedule.jsp" >
			<jsp:param name="msg" value="Flight Schedule Could Not Be Deleted." />
		</jsp:forward>
	<%
}%>
		<jsp:forward page="viewFlightSchedule.jsp" >
			<jsp:param name="msg" value="Flight Schedule Deleted Successfully." />
		</jsp:forward>

</body>
</html>
