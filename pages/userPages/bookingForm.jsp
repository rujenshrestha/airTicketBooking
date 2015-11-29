<!doctype html>
<html lang="us">
<head>
<meta charset="utf-8">
<title>jQuery UI Composite Demo - Flight Booking</title>
<link href="../../css/bookingForm/reset.css" rel="stylesheet">
<link
	href="../../css/bookingForm/ui-lightness/jquery-ui-1.9.0.custom.css"
	rel="stylesheet">
<link href="../../css/bookingForm/style.css" rel="stylesheet">

<script src="../../js/bookingForm/jquery-1.8.2.min.js"></script>
<script src="../../js/bookingForm/jquery-ui-1.9.0.custom.min.js"></script>
<script src="../../js/bookingForm/cssMakeup.js"></script>
<script src="../../js/bookingForm/citiesnDate.js"></script>

<script src="../../js/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="../../js/seatManagement/seat.js" type="text/javascript"></script>

</head>
<body>
	<div id="main-container" class="main-container">
		<div class="left-side" class="left">

			<form name="bookForm" action="doBookFlight.jsp" method="post">
				<label>Name : </label><input type="text">
				<label>Address : </label><input type="text">
				<label>Mobile No : </label><input type="text">
				<label>Departure from : </label><input type="text">
				<label>Going to : </label><input type="text">
				<label>date : </label><input type="text">
				<label>number of passenger adult: </label><input type="text">
				<label>number of passenger child: </label><input type="text">
				<label>number of passenger infant: </label><input type="text">
				<label>Selected Seat: </label><input type="text" id="selectedSeat" readonly>

			</form>


		</div>


		<div class="right-side">

			<form id="form1">
				<h2 style="font-size: 1.2em;">Choose seats by clicking the
					corresponding seat in the layout below:</h2>
				<div id="holder">
					<span id="bookedSeatSpan" hidden>21,2,3</span>
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

	</div>
</body>
</html>
