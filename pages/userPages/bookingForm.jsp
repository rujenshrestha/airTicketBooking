<!doctype html>
<%@page import="schedule.Schedule" %>
<%@page import="location.Location" %>
<%@page import="user.User" %>
<%@page import="reservation.Reservation" %>
<%@page import="java.util.* " %>
<html lang="us">
<head>
<meta charset="utf-8">
<title>jQuery UI Composite Demo - Flight Booking</title>
<link href="/airTicketBooking/css/bookingForm/reset.css" rel="stylesheet">
<link
	href="/airTicketBooking/css/bookingForm/ui-lightness/jquery-ui-1.9.0.custom.css"
	rel="stylesheet">
<link href="/airTicketBooking/css/bookingForm/style.css" rel="stylesheet">
<link href="/airTicketBooking/css/ddmenu.css" rel="stylesheet" type="text/css" />
<script src="/airTicketBooking/js/bookingForm/jquery-1.8.2.min.js"></script>
<script src="/airTicketBooking/js/bookingForm/jquery-ui-1.9.0.custom.min.js"></script>
<script src="/airTicketBooking/js/bookingForm/cssMakeup.js"></script>
<script src="/airTicketBooking/js/bookingForm/citiesnDate.js"></script>

<script src="/airTicketBooking/js/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="/airTicketBooking/js/seatManagement/seat.js" type="text/javascript"></script>
<script src="/airTicketBooking/js/ddmenu.js" type="text/javascript"></script>

</head>
<body>
<% 
String schId= request.getParameter("schId").toString();
String usrId="";
String name ="";
String fromLocDesc="";
String toLocDesc="";

Schedule sch= new Schedule();
User user = new User();
Location loc = new Location();
Reservation res = new Reservation();

java.util.Iterator reservedSeatList = res.getReservedSeat(schId).iterator();
String temp="";
while(reservedSeatList.hasNext()){
	HashMap tempMap = (HashMap) reservedSeatList.next();
	temp=temp+tempMap.get("seatNo").toString()+",";
}
String seatList= temp.substring(0,temp.length()-1);
System.out.println("SEAT LIST::::"+seatList);

if(session.getAttribute("id")!=null){
	usrId = session.getAttribute("id").toString();
	System.out.println("usrId::"+usrId);
	java.util.Iterator userDetail = user.getUserDetail(usrId).iterator();
	while(userDetail.hasNext()){
		HashMap tempMap =(HashMap) userDetail.next();
		name = tempMap.get("firstName").toString()+" "+
			   tempMap.get("middleName").toString()+" "+
			   tempMap.get("lastName").toString();
	}
}

java.util.Iterator schDetail = sch.getScheduleDetail(schId).iterator();

%>

	<div id="main-container" class="main-container">
	 <jsp:include page="../../include/header.jsp" />
 		<jsp:include page="../../include/userMenu.jsp" />
		<div class="left-side" class="left">

			<form name="bookForm" action="doBookFlight.jsp?schId=<%=schId%>&usrId=<%=usrId %>" method="post">
			<%
				while(schDetail.hasNext()){
					HashMap tempMap = (HashMap) schDetail.next();
					fromLocDesc= loc.getlocationDesc(tempMap.get("fromLocId").toString());
					toLocDesc= loc.getlocationDesc(tempMap.get("toLocId").toString());
			%>
				<label>Name : <%=name%></label>
				<br>
				<label>Departure from : <%=fromLocDesc%></label>
				<br>
				<label>Going to : <%=toLocDesc%></label>
				<br>
				<label>Flight Date : <%=tempMap.get("flightDate")%></label>
				<br>
				<label>Flight Time: <%=tempMap.get("flightTime")%></label>
				<br>
				<%} %>
				<label>Selected Seat: </label><input type="text" id="selectedSeat" name="selectedSeat" readonly>
				<br>
				<input type="submit" value="book">
			</form>


		</div>


		<div class="right-side">

			<form id="form1">
				<h2 style="font-size: 1.2em;">Choose seats by clicking the
					corresponding seat in the layout below:</h2>
				<div id="holder">
					<span id="bookedSeatSpan" hidden><%=seatList%></span>
					<ul id="place">

					</ul>
				</div>
				<div style="width: 600px; text-align: center; overflow: auto">
					<ul id="seatDescription">
						<li
							style="background: url('../../images/seatManagement/available_seat_img.gif') no-repeat scroll 0 0 transparent;">Available
							Seat</li>
						<li
							style="background: url('../../images/seatManagement/booked_seat_img.gif') no-repeat scroll 0 0 transparent;">Booked
							Seat</li>
						<li
							style="background: url('../../images/seatManagement/selected_seat_img.gif') no-repeat scroll 0 0 transparent;">Selected
							Seat</li>
					</ul>
				</div>
				<div style="width: 580px; text-align: left; margin: 5px">
					<input type="button" id="btnShowNew" value="Book Selected Seats" />
					<%--<input type="button" id="btnShow" value="Show All" />--%>
				</div>


			</form>



		</div>
		<jsp:include page="../../include/footer.jsp" />
	</div>
</body>
</html>
