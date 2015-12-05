<%@page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<jsp:include page="/include/userSessionManager.jsp" />
<%@page import="reservation.Reservation" %>
<%@page import="transaction.Transaction" %>
<%@page import="java.util.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Online Air Ticketing</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<%
String schId = request.getParameter("schId").toString();
String usrId = request.getParameter("usrId").toString();
String seatList = request.getParameter("selectedSeat").toString();

String seatNo="";
int i =0;
int totalSeat=0;

List result=new ArrayList();
while(i<seatList.length()){
	
	HashMap resultMap = new HashMap();
	seatNo="";
	System.out.println(seatList+"no seat coming");
	while(seatList.charAt(i)!= ',' ){
		seatNo = seatNo+seatList.charAt(i);
		i++;
		
		if(i==seatList.length()){
			break;
		}
	}
	
	System.out.println("seat no:: "+seatNo);
	resultMap.put("seatNo",seatNo);
	result.add(resultMap);
	totalSeat++;
	i++;
} 

System.out.println("total seat:: "+totalSeat);

Reservation res = new Reservation();
Transaction txn = new Transaction();

%>
<body>

<%

try{
		
		txn.addTransaction(schId, usrId, totalSeat);
		res.reserveSeat(result,schId,usrId);
		
		
}catch (Exception err){
	System.out.println("Exception in doAddAdmin: "+err);
	%>
		<jsp:forward page="userDashboard.jsp" >
			<jsp:param name="msg" value="Sorry, seat could not be booked." />
		</jsp:forward>
	<%
}%>
		<jsp:forward page="showBookingDetails.jsp" >
			<jsp:param name="msg" value="Seat Booked Succesfully." />
			<jsp:param name="schId" value="<%=schId %>" />
			<jsp:param name="usrId" value="<%=usrId %>" />
			<jsp:param name="seatList" value="<%=seatList %>" />
		</jsp:forward>

</body>
</html>
