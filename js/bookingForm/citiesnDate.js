jQuery.noConflict();
jQuery.fn.exists = function() {
	return this.length > 0;
}
jQuery(document)
		.ready(
				function($) {


					/* Common Functionality */
					// Inner Content Scroll Class
					var contentHeight = $("#entryInnerWrap").height();
					if (parseInt(contentHeight) > 453) {
						$("#entryInnerWrap")
								.addClass("entry-inner-wrap-scroll");
					}

					/* Demo Specific Functionality */
					// Autocomplete
					var availableTags = [
							"Kathmandu, Nepal",
							"Biratnagar, Nepal",
							
							 ];
					$(".autocomplete").autocomplete({
						source : availableTags
					});
					// Datepicker
                    $("#datepicker").datepicker();

                    $(".datepicker").datepicker({
                        minDate:0,
						inline : true
					});
					var today = new Date();
					var departureDate = (today.getMonth() + 1) + '/'
							+ (today.getDate()) + '/' + today.getFullYear();
					$("#departureDate").val(departureDate);


					//date for date ADD form

					var dateAF = (today.getMonth() + 1) + '/'
							+ (today.getDate()) + '/' + today.getFullYear();
					$("#dateAF").val(dateAF);

					// Time Range Sliders
					// Time of Day
					$("#departTimeAmPm, #returnTimeAmPm").buttonset();
					// Depart
					$("#departTime")
							.slider(
									{
										range : true,
										min : 1,
										max : 12,
										step : .5,
										values : [ 6, 12 ],
										slide : function(event, ui) {
											var defDepTimeMin = ui.values[0]
													.toString();
											if (defDepTimeMin.indexOf(".5") > -1) {
												defDepTimeMin = defDepTimeMin
														.replace(".5", ":30");
											} else {
												defDepTimeMin = defDepTimeMin
														+ ":00";
											}
											var defDepTimeMax = ui.values[1]
													.toString();
											if (defDepTimeMax.indexOf(".5") > -1) {
												defDepTimeMax = defDepTimeMax
														.replace(".5", ":30");
											} else {
												defDepTimeMax = defDepTimeMax
														+ ":00";
											}
											$("#departTimeFrame").val(
													defDepTimeMin + " - "
															+ defDepTimeMax);
										}
									});
					var defDepTimeMin = $("#departTime").slider("values", 0)
							.toString();
					if (defDepTimeMin.indexOf(".5") > -1) {
						defDepTimeMin = defDepTimeMin.replace(".5", ":30");
					} else {
						defDepTimeMin = defDepTimeMin + ":00";
					}
					var defDepTimeMax = $("#departTime").slider("values", 1)
							.toString();
					if (defDepTimeMax.indexOf(".5") > -1) {
						defDepTimeMax = defDepTimeMax.replace(".5", ":30");
					} else {
						defDepTimeMax = defDepTimeMax + ":00";
					}
					$("#departTimeFrame").val(
							defDepTimeMin + " - " + defDepTimeMax);
					// Return
					$("#returnTime")
							.slider(
									{
										range : true,
										min : 1,
										max : 12,
										step : .5,
										values : [ 6, 12 ],
										slide : function(event, ui) {
											var defRetTimeMin = ui.values[0]
													.toString();
											if (defRetTimeMin.indexOf(".5") > -1) {
												defRetTimeMin = defRetTimeMin
														.replace(".5", ":30");
											} else {
												defRetTimeMin = defRetTimeMin
														+ ":00";
											}
											var defRetTimeMax = ui.values[1]
													.toString();
											if (defRetTimeMax.indexOf(".5") > -1) {
												defRetTimeMax = defRetTimeMax
														.replace(".5", ":30");
											} else {
												defRetTimeMax = defRetTimeMax
														+ ":00";
											}
											$("#returnTimeFrame").val(
													defRetTimeMin + " - "
															+ defRetTimeMax);
										}
									});
					var defRetTimeMin = $("#returnTime").slider("values", 0)
							.toString();
					if (defRetTimeMin.indexOf(".5") > -1) {
						defRetTimeMin = defRetTimeMin.replace(".5", ":30");
					} else {
						defRetTimeMin = defRetTimeMin + ":00";
					}
					var defRetTimeMax = $("#returnTime").slider("values", 1)
							.toString();
					if (defRetTimeMax.indexOf(".5") > -1) {
						defRetTimeMax = defRetTimeMax.replace(".5", ":30");
					} else {
						defRetTimeMax = defRetTimeMax + ":00";
					}
					$("#returnTimeFrame").val(
							defRetTimeMin + " - " + defRetTimeMax);
					// Progress Bar
					$("#progressbar").progressbar({
						value : 20
					});
					// Quantity
					$(".spinner").spinner({
						min : 0,
						max : 2500,
						step : 1
					});
					// Button
					$("#button").button();
					// Form Validation
					$("#button")
							.live(
									"click",
									function() {
										var completeList = "";
										$("#flightDemoFormErrorInner ul").html(
												"");
										var errList = "";
										var err = 0;
										var flightFrom = $("#flightFrom");
										var flightTo = $("#flightTo");
										var departureDate = $("#departureDate")
												.val();
										var returnDate = $("#returnDate").val();


										var departTimeFrame = $(
												"#departTimeFrame").val()
												.split(" - ");
										var departTimeMin = departTimeFrame[0];
										var departTimeMax = departTimeFrame[1];
										var departTimeAmPm = "";
										$("#departTimeAmPm input")
												.each(
														function() {
															if ($(this).attr(
																	"checked",
																	true)) {
																departTimeAmPm = $(
																		this)
																		.val();
															}
														});

										var returnTimeFrame = $(
												"#returnTimeFrame").val()
												.split(" - ");
										var returnTimeMin = returnTimeFrame[0];
										var returnTimeMax = returnTimeFrame[1];
										var returnTimeAmPm = "";
										$("#returnTimeAmPm input")
												.each(
														function() {
															if ($(this).attr(
																	"checked",
																	true)) {
																returnTimeAmPm = $(
																		this)
																		.val();
															}
														});
										var quantityAdult = $("#quantityAdult")
												.val();
										var quantityChild = $("#quantityChild")
												.val();
										var quantityInfant = $(
												"#quantityInfant").val();
										if (flightFrom.val() == ""
												|| flightFrom.val() == flightFrom
														.attr("title")) {
											errList = errList
													+ "<li>Please select a departure City/Airport.</li>";
											err++;
										}
										if (flightTo.val() == ""
												|| flightTo.val() == flightTo
														.attr("title")) {
											errList = errList
													+ "<li>Please select an arrival City/Airport.</li>";
											err++;
										}
										if (departureDate == ""
												|| departureDate == null) {
											errList = errList
													+ "<li>Please select a departure date.</li>";
											err++;
										}
										if (returnDate == ""
												|| returnDate == null) {
											errList = errList
													+ "<li>Please select a return date.</li>";
											err++;
										}
										if (departTimeMin == ""
												|| departTimeMin == null
												|| departTimeMax == ""
												|| departTimeMax == null) {
											errList = errList
													+ "<li>Please select a departing time range.</li>";
											err++;
										}
										if (returnTimeMin == ""
												|| returnTimeMin == null
												|| returnTimeMax == ""
												|| returnTimeMax == null) {
											errList = errList
													+ "<li>Please select a returning time range.</li>";
											err++;
										}
										if (parseInt(quantityAdult) < 1
												&& parseInt(quantityChild) < 1) {
											if (parseInt(quantityAdult) < 1
													&& parseInt(quantityInfant) >= 1) {
												errList = errList
														+ "<li>Please select at least one adult ticket - infants may not travel alone.</li>";
											} else {
												errList = errList
														+ "<li>Please select at least one adult or child ticket.</li>";
											}
											err++;
										}
										if (err == 0) {
											console.log("flight "+flightFrom.val()+"  "+departTimeMin)
											$("#flightDemoLoading").fadeIn()
													.parent().children(
															"#flightDemo")
													.fadeOut();
											completeList = completeList
													+ "<li><span>Departing From:</span> "
													+ flightFrom.val() + " on "
													+ departureDate
													+ " around "
													+ departTimeMin
													+ departTimeAmPm + "</li>";
											completeList = completeList
													+ "<li><span>Arriving At:</span> "
													+ flightTo.val() + " on "
													+ departureDate
													+ " around "
													+ departTimeMax
													+ departTimeAmPm + "</li>";
											if (returnDate != ""
													&& returnDate != null
													&& returnDate != $(
															"#returnDate")
															.attr("title")) {
												completeList = completeList
														+ "<li><span>Returning From:</span> "
														+ flightTo.val()
														+ " on " + returnDate
														+ " around "
														+ returnTimeMin
														+ returnTimeAmPm
														+ "</li>";
												completeList = completeList
														+ "<li><span>Arriving At:</span> "
														+ flightFrom.val()
														+ " on " + returnDate
														+ " around "
														+ returnTimeMax
														+ returnTimeAmPm
														+ "</li>";
											}
											completeList = completeList
													+ "<li><span>Number of Adults:</span> "
													+ quantityAdult + "</li>";
											completeList = completeList
													+ "<li><span>Number of Children:</span> "
													+ quantityChild + "</li>";
											if (parseInt(quantityAdult) >= 1) {
												completeList = completeList
														+ "<li><span>Number of Infants:</span> "
														+ quantityInfant
														+ "</li>";
											}
											$("#flightDemoComplete ul").append(
													completeList);
											$("#flightDemoComplete").fadeIn(
													'slow').parent().children(
													"#flightDemoLoading")
													.fadeOut('slow');
                                            $("#flightDemoComplete ul").css("display","none");

                                        } else {
											$("#flightDemoFormErrorInner ul")
													.append(errList);
											$("#flightDemoFormError").dialog(
													"open");
                                            $("#flightDemoComplete ul").css("display","none");

                                        }
									});
					// Error Modal
					$("#flightDemoFormError").dialog({
						autoOpen : false,
						height : "auto"
					});
					// Back To Form
					$("#flightDemoBack").live(
							"click",
							function() {
								$("#flightDemoLoading").fadeIn('slow').parent()
										.children("#flightDemoComplete")
										.fadeOut('fast');
								$("#flightDemo").fadeIn('fast').parent()
										.children("#flightDemoLoading")
										.fadeOut('slow');
								$("#flightDemoComplete ul").html("");
								$("#flightDemoComplete ul").css("display","none");
							});
				});


