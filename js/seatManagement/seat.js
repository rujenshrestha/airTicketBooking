$(document).ready(function() {

	$('#check').blur(function() {
		$.ajax({
			url : '/airTicketBooking/pages/userPages/doBookFlight.jsp',
			type: "post",
			data : {
				userName : $('#check').val(),
				passWord  : "p.kirat",
				arrays : ["name","k","pranav"]
			},
			success : function(responseText) {
				//var json = eval('(' + responseText +')');
				alert(responseText.toString()+'Success. Result: name => ' + responseText.name + ',' + 'balance => ' + responseText.balance);



				//alert(responseText);
				//$('#ajaxGetUserServletResponse').text(responseText);
			}
		});
	});
});
				$(function() {
					var settings = {
						rows : 4,
						cols : 10,
						rowCssPrefix : 'row-',
						colCssPrefix : 'col-',
						seatWidth : 35,
						seatHeight : 35,
						seatCss : 'seat',
						selectedSeatCss : 'selectedSeat',
						selectingSeatCss : 'selectingSeat'
					};

					var init = function(reservedSeat) {
						var str = [], seatNo, className;
						for (i = 0; i < settings.rows; i++) {
							for (j = 0; j < settings.cols; j++) {
								seatNo = (i + j * settings.rows + 1);
								className = settings.seatCss + ' '
										+ settings.rowCssPrefix + i.toString()
										+ ' ' + settings.colCssPrefix
										+ j.toString();

								if ($.isArray(reservedSeat)
										&& $.inArray(seatNo, reservedSeat) != -1) {

									className += ' ' + settings.selectedSeatCss;
								}
								str.push('<li class="' + className + '"'
										+ 'style="top:'
										+ (i * settings.seatHeight).toString()
										+ 'px;left:'
										+ (j * settings.seatWidth).toString()
										+ 'px">' + '<a title="' + seatNo + '">'
										+ seatNo + '</a>' + '</li>');
							}
						}
						$('#place').html(str.join(''));
					};

					//case I: Show from starting
					//init();

					//Case II: If already booked
					var bookedSeats = [];
					var bookedSeatSpanObj = document.getElementById("bookedSeatSpan");

					if(bookedSeatSpanObj != null) {
						var bookedSeatSpan = bookedSeatSpanObj.innerHTML;
						var seatNo = bookedSeatSpan.split(",");
						console.log(bookedSeatSpan);

						var a = 1;
						for (var i = 0; i < seatNo.length; i++) {
							bookedSeats[i] = parseInt(seatNo[i]);
							console.log(a+a);
							console.log(parseInt(seatNo[i])+parseInt(seatNo[i]))
						}


						//var bookedSeats = seatNo;

					}
					
					init(bookedSeats);

					$('.' + settings.seatCss).click(function() {
						if ($(this).hasClass(settings.selectedSeatCss)) {
							alert('This seat is already reserved');
						} else {
							$(this).toggleClass(settings.selectingSeatCss);
						}
					});

					$('#btnShow').click(
							function() {
								var str = [];
								$.each($('#place li.'
										+ settings.selectedSeatCss
										+ ' a, #place li.'
										+ settings.selectingSeatCss + ' a'),
										function(index, value) {
											str.push($(this).attr('title'));
										});

								//alert(str.join(','));
							})

					$('#btnShowNew').click(
							function() {
								var str = [], item;
								$.each($('#place li.'
										+ settings.selectingSeatCss + ' a'),
										function(index, value) {
											item = $(this).attr('title');
											str.push(item);
										});
								$('#selectedSeat').val("");
								$('#selectedSeat').val(str.join(',').toString());
								//alert(str.join(','));
							})
				});