<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<%@ page import="schedule.Schedule"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Online Air Ticketing</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<%
String alnId = request.getParameter("alnId").toString();
String fromLocId = request.getParameter("fromLocId").toString();
String toLocId = request.getParameter("toLocId").toString();
String price = request.getParameter("price").toString();
String time = request.getParameter("time").toString();
String date = request.getParameter("date").toString();
String flightClass = request.getParameter("class").toString();
String seatQnty = request.getParameter("seatQnty").toString();

Schedule sch = new Schedule();


%>
<body>

<%

try{
		sch.addSchedule(alnId, fromLocId, toLocId, price, time, date, flightClass, seatQnty);
		
}catch (Exception err){
	System.out.println("Exception in doAddFlightSchedule: "+err);
	%>
		<jsp:forward page="/pages/adminPages/addFlightSchedule.jsp" >
			<jsp:param name="msg" value="Flight Schedule Could Not Be Added." />
		</jsp:forward>
	<%
}%>
		<jsp:forward page="/pages/adminPages/addFlightSchedule.jsp" >
			<jsp:param name="msg" value="Flight Schedule Added Successfully." />
		</jsp:forward>

</body>
</html>
