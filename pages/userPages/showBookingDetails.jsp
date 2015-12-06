<!doctype html>
<jsp:include page="/include/userSessionManager.jsp" />
<%@page import="java.util.* " %>

<%@page import="location.Location" %>
<%@page import="schedule.Schedule" %>
<%@page import="user.User" %>
<%@page import="airline.Airline" %>

<html lang="us">  
<head>
<meta charset="utf-8">
<title>Air Ticket Booking</title>

<link href="/airTicketBooking/css/bookingForm/reset.css" rel="stylesheet">
    <link
            href="/airTicketBooking/css/bookingForm/ui-lightness/jquery-ui-1.9.0.custom.css"
            rel="stylesheet">
    <link href="/airTicketBooking/css/bookingForm/userDashboard.css" rel="stylesheet">
    <link href="/airTicketBooking/css/ddmenu.css" rel="stylesheet" type="text/css" />

    <script src="/airTicketBooking/js/bookingForm/jquery-1.8.2.min.js"></script>
    <script src="/airTicketBooking/js/bookingForm/jquery-ui-1.9.0.custom.min.js"></script>
    <script src="/airTicketBooking/js/bookingForm/cssMakeup.js"></script>
    <script src="/airTicketBooking/js/bookingForm/citiesnDate.js"></script>

    <script src="/airTicketBooking/js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="/airTicketBooking/js/ddmenu.js" type="text/javascript"></script>


</head>
<body style="topmargin:0px auto;padding:0px;spacing:0px">
<% 
String msg="";
if(request.getParameter("msg")!=null){
	msg = request.getParameter("msg").toString();
}
String total=" ";
String schId= request.getParameter("schId").toString();
String usrId= request.getParameter("usrId").toString();
String seatList = request.getParameter("seatList").toString();
total = request.getParameter("total").toString();

String name ="";
String fromLocDesc="";
String toLocDesc="";
String airlineDesc="";
String price="";
String flightDate="";
String flightTime="";
String result="";

Schedule sch= new Schedule();
User user = new User();
Location loc = new Location();
Airline aln = new Airline();

java.util.Iterator usrDetail = user.getUserDetail(usrId).iterator();
while(usrDetail.hasNext()){
	HashMap tempMap = (HashMap) usrDetail.next();
	name = tempMap.get("firstName").toString();	
}

java.util.Iterator schDetail = sch.getScheduleDetail(schId).iterator();
while(schDetail.hasNext()){
	HashMap tempMap = (HashMap) schDetail.next();
	
	fromLocDesc = loc.getlocationDesc(tempMap.get("fromLocId").toString());
	toLocDesc = loc.getlocationDesc(tempMap.get("toLocId").toString());
	flightDate = tempMap.get("flightDate").toString();
	flightTime = tempMap.get("flightTime").toString();
	airlineDesc = aln.getAirlineDesc(tempMap.get("alnId").toString());
}

result ="Dear "+name+","+
		"\nYou have succesfully booked seat no. "+seatList+" for flight "+schId+"."+
		"\n"+
	    "\nAirline: "+airlineDesc+
	    "\nDeparture: "+fromLocDesc+
	    "\nArrival: "+toLocDesc+
	    "\nTotal: "+total+
	    "\nFlightDate: "+flightDate+
	    "\nFlightTime: "+flightTime;

%>
  
	<div id="main-container" class="main-container">
	<jsp:include page="/include/header.jsp" />
 		<jsp:include page="/include/userMenu.jsp" />
 		<a href="userDashboard.jsp">Home&gt;&gt;</a>
		<div align="center">
    		<label STYLE="font-weight: bold;font-size:24px">Booking Succesfull</label>
    		<br>
    		<br>
    		<pre STYLE="font-size:16px"><%=result %></pre>
			
		</div>
		<div align="center" padding="20px">
			<input type="button" value="print" onClick="window.print() "/>
		</div>


		
		<div style="position:fixed;bottom:0;width:100%"><jsp:include page="/include/footer.jsp" /></div>
	</div>
</body>
</html>
