<!doctype html>
<jsp:include page="/include/userSessionManager.jsp" />
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
<link href="/airTicketBooking/css/bookingForm/style.css" rel="stylesheet">
<link href="/airTicketBooking/css/ddmenu.css" rel="stylesheet" type="text/css" />
<script src="/airTicketBooking/js/bookingForm/jquery-1.8.2.min.js"></script>
<script src="/airTicketBooking/js/bookingForm/jquery-ui-1.9.0.custom.min.js"></script>
<script src="/airTicketBooking/js/bookingForm/cssMakeup.js"></script>

<script src="/airTicketBooking/js/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="/airTicketBooking/js/seatManagement/seat.js" type="text/javascript"></script>
<script src="/airTicketBooking/js/ddmenu.js" type="text/javascript"></script>

	<script>
		$(document).ready(function(){
			$("#bookForm").submit(function(){

				if($("#selectedSeat").val()!=""){
					return true
				}else{
                    $("#selectedSeat").attr("placeholder", "Please select seat.!!!!!!!!!!");
                    return false
				}
			});
		});
	</script>

</head>
<body style="topmargin:0px auto;padding:0px;spacing:0px">
<%
	System.out.println("Inside bookingForm.jsp");
String schId= request.getParameter("schId").toString();
String usrId="";
String name ="";
String fromLocDesc="";
String toLocDesc="";
String seatList= "";
String airlineDesc="";
int i=0;

Schedule sch= new Schedule();
User user = new User();
Location loc = new Location();
Reservation res = new Reservation();

airlineDesc= sch.getAirlineDescBySchedule(schId);
 
java.util.Iterator reservedSeatList = res.getReservedSeat(schId).iterator();
String temp="";
while(reservedSeatList.hasNext()){
	HashMap tempMap = (HashMap) reservedSeatList.next();
	temp=temp+tempMap.get("seatNo").toString()+",";
	i=1;
}
if(i==1){
	seatList = temp.substring(0,temp.length()-1);
}
	//seatList = "1,2,3";
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
	<jsp:include page="/include/header.jsp" />
 		<jsp:include page="/include/userMenu.jsp" />
 		<a href="userDashboard.jsp">Home&gt;&gt;</a>
		<div class="left-side" class="left">
    
			<form name="bookForm" id="bookForm" action="doBookFlight.jsp?schId=<%=schId%>&usrId=<%=usrId %>" method="post">
			<%
				while(schDetail.hasNext()){
					HashMap tempMap = (HashMap) schDetail.next();

					fromLocDesc= loc.getlocationDesc(tempMap.get("fromLocId").toString());
					toLocDesc= loc.getlocationDesc(tempMap.get("toLocId").toString());
			%>
				<label>Name :<input type="text" value="<%=name%>" readonly> </label>
				
				<label>Airline :<input type="text" value="<%=airlineDesc%>" readonly> </label>

				<label>From :<input type="text" value="<%=fromLocDesc%>" readonly> </label>

				<label>To :<input type="text" value="<%=toLocDesc%>" readonly> </label>
				
				<label>Fare(Per 1 Seat): <input type="text" value="<%=tempMap.get("price")%>" name="price" readonly></label>

				<label>Flight Date :<input type="text" value="<%=tempMap.get("flightDate")%>" readonly> </label>

				<label>Flight Time: <input type="text" value="<%=tempMap.get("flightTime")%>" readonly></label>

				<%} %>
				<label>Selected Seat: <input type="text" value="" id="selectedSeat" name="selectedSeat" readonly required></label>

				<input id="bookFlight" type="submit" value="book">
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
		<div style="position:fixed;bottom:0;width:100%;z-index:1000;"><jsp:include page="/include/footer.jsp" /></div>
	</div>
</body>
</html>
