<%@page contentType="text/html; charset=iso-8859-1" language="java" import="reservation.Reservation" errorPage="" %>
<jsp:include page="/include/adminSessionManager.jsp" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Online Air Ticketing</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<%
String schId = request.getParameter("schId").toString();
String seatQnty = request.getParameter("seatQnty").toString();
Reservation res = new Reservation();

%>
<body>

<%

try{
		res.setReservation(schId, seatQnty);
		
}catch (Exception err){
	System.out.println("Exception in doStartReservation: "+err);
	%>
		<jsp:forward page="viewFlightSchedule.jsp" >
			<jsp:param name="msg" value="Reservation Could Not Be Updated." />
		</jsp:forward>
	
	<%
	
}%>
		<jsp:forward page="viewFlightSchedule.jsp" >
			<jsp:param name="msg" value="Reservation Started Succesfully." />
		</jsp:forward>

</body>
</html>
