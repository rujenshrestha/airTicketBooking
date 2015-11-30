<%@page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>

<!doctype html>
<%@page import="location.Location" %>
<%@page import="java.util.* " %>
<html lang="us">   
<head>
    <meta charset="utf-8">
    <title>jQuery UI Composite Demo - Flight Booking</title>
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
<body>

<%

String msg ="";
if(request.getParameter("msg")!=null){
	msg = request.getParameter("msg").toString();
}
Location loc = new Location();
java.util.Iterator fromLocList = loc.getlocationList().iterator();
java.util.Iterator toLocList = loc.getlocationList().iterator();

 
%>

<div id="main-container" class="main-container">
 <jsp:include page="/include/header.jsp" />
 <jsp:include page="/include/userMenu.jsp" />
 <div><font color="#FF0000"><%if(!msg.matches("")){ %><%=msg %><%} %></font> </div>
    <div class="left-side" class="left">
        <div id="entryInnerWrap" class="entry-inner-wrap">
            <h1>Search/Book Flights</h1>

            <div class="clr"></div>
            <div class="entry-inner-left">
                <form name="bookForm" action="/airTicketBooking/pages/userPages/userDashboardCopy.jsp" method="post">
                    <div id="flightDemo">
                        <div id="airportWrap">
                            <div id="flightFromWrap">
                                <label for="flightFrom">Leaving From:</label> 
                                <select
                                    id="flightFrom" name="flightFrom"
                                    class="watermark watermarked autocomplete ui-corner-all"
                                    autocomplete="off" title="City or Airport Code" value="">
									
									<%
									while(fromLocList.hasNext()){
										HashMap tempMap = (HashMap) fromLocList.next();
									%>	
                                    	<option value="<%=tempMap.get("locId")%>"><%=tempMap.get("locDesc")%></option>
									<%} %>
                                </select>
                            </div>
                            <div id="flightToWrap">
                                <label for="flightTo">Going To:</label> 
                                <select id="flightTo"
                                                                               name="flightTo"
                                                                               class="watermark watermarked autocomplete ui-corner-all"
                                                                               autocomplete="off"
                                                                               title="City or Airport Code" value="">

                                <%
									while(toLocList.hasNext()){
										HashMap tempMap = (HashMap) toLocList.next();
									%>	
                                    	<option value="<%=tempMap.get("locId")%>"><%=tempMap.get("locDesc")%></option>
									<%} %>

                                </select>
                            </div>
                            <div class="clr"></div>
                        </div>
                        <div class="clr"></div>
                        <div id="dateWrap">
                            <div id="departureDateWrap">
                                <label for="departureDate">Departure Date:</label> <input
                                    id="departureDate" name="departureDate"
                                    class="datepicker watermark watermarked ui-corner-all" value=""/>
                            </div>
                            <div id="returnDateWrap">
                                <label for="returnDate">Return Date:</label> <input
                                    id="returnDate" name="returnDate"
                                    class="datepicker watermark watermarked ui-corner-all" value=""
                                    title="One Way"/>
                            </div>
                            <div class="clr"></div>
                        </div>
                        <div class="clr"></div>
                        <div id="timeWrap">
                            <div id="departureTimeWrap">
                                <label for="departTimeFrame">Departure Time:</label> <input
                                    type="text" id="departTimeFrame" name="departTimeFrame"
                                    class="time-frame"/>

                                <div id="departTimeAmPm">
                                    <input type="radio" id="departTimeTodAm" name="departTimeTod"
                                           value="AM" checked="checked"/><label for="departTimeTodAm">AM</label>
                                    <input type="radio" id="departTimeTodPm" name="departTimeTod"
                                           value="PM"/><label for="departTimeTodPm">PM</label>
                                </div>
                                <div class="clr"></div>
                                <div id="departTime" class="time-range slider"></div>
                                <div class="clr"></div>
                            </div>
                            <div id="returnTimeWrap">
                                <label for="returnTimeFrame">Return Time:</label> <input
                                    type="text" id="returnTimeFrame" name="returnTimeFrame"
                                    class="time-frame"/>

                                <div id="returnTimeAmPm">
                                    <input type="radio" id="returnTimeTodAm" name="returnTimeTod"
                                           value="AM" checked="checked"/><label for="returnTimeTodAm">AM</label>
                                    <input type="radio" id="returnTimeTodPm" name="returnTimeTod"
                                           value="PM"/><label for="returnTimeTodPm">PM</label>
                                </div>
                                <div class="clr"></div>
                                <div id="returnTime" class="time-range slider"></div>
                                <div class="clr"></div>
                            </div>
                            <div class="clr"></div>
                        </div>
                        <div class="clr"></div>
                        <div id="quantityWrap">
                            <div id="quantityAdultWrap">
                                <label for="quantityAdult">Adult:</label> <input
                                    id="quantityAdult" name="quantityAdult" class="spinner"
                                    value="1"/>
                            </div>
                            <div id="quantityChildWrap">
                                <label for="quantityChild">Child:</label> <input
                                    id="quantityChild" name="quantityChild" class="spinner"
                                    value="0"/>
                            </div>
                            <div id="quantityInfantWrap">
                                <label for="quantityInfant">Infant:</label> <input
                                    id="quantityInfant" name="quantityInfant" class="spinner"
                                    value="0"/>
                            </div>
                            <div class="clr"></div>
                        </div>
                        <div id="searchWrap">
                            <%--<button id="button">Search</button>--%>
                            <input type="submit" id="button" value="search">

                            <div class="clr"></div>
                        </div>
                        <div class="clr"></div>
                        <div id="flightDemoFormError" class="ui-widget">
                            <div id="flightDemoFormErrorInner"
                                 class="ui-state-error ui-corner-all">
                                <p>
                                    <span class="ui-icon ui-icon-alert"></span> <strong>Alert:</strong>
                                    Looks like you missed something:
                                </p>
                                <ul></ul>
                                <div class="clr"></div>
                            </div>
                            <div class="clr"></div>
                        </div>
                        <!--/#flightDemoFormError-->
                        <div class="clr"></div>
                    </div>
                </form>
                <!--/#flightDemo-->
                <div class="clr"></div>
                <div id="flightDemoLoading">
                    <img
                            src="/airTicketBooking/css/bookingForm/ui-lightness/images/ajax-loader.gif"
                            alt="Loading..."/>

                    <div class="clr"></div>
                </div>
                <div class="clr"></div>
                <div id="flightDemoComplete">
                    <h2>You Selected The Following:</h2>
                    <ul></ul>
                    <div class="clr"></div>
                    <a id="flightDemoBack">&laquo; Back To Form</a>

                    <div class="clr"></div>
                </div>
                <div class="clr"></div>
            </div>
            <!--/.entry-inner-left-->
            <div class="clr"></div>
        </div>
        <!--/.entry-inner-wrap-->
    </div>

    <div class="right-side">

    </div>


<jsp:include page="/include/footer.jsp" />
</div>
</body>
</html>
