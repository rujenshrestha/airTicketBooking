<%@page contentType="text/html; charset=iso-8859-1" language="java" import="airline.Airline,location.Location" errorPage="" %>
<jsp:include page="/include/adminSessionManager.jsp" />
<%@page import="java.util.HashMap" %>
<%@page import="schedule.Schedule" %>
<html>
<head>

    <title>Online Air Ticketing</title>
    <link href="/airTicketBooking/css/style.css" rel="stylesheet" type="text/css">
    <link href="/airTicketBooking/css/ddmenu.css" rel="stylesheet" type="text/css"/>
    <script src="/airTicketBooking/js/ddmenu.js" type="text/javascript"></script>
    <script src="/airTicketBooking/js/bookingForm/citiesnDate.js"></script>
</head>

<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">
<jsp:include page="/include/footer.jsp" />
 <jsp:include page="/include/adminMenu.jsp" />
	  
<%
String msg="";
if(request.getParameter("msg")!=null){
	msg=request.getParameter("msg").toString();
}

String schId = request.getParameter("schId");

Airline air = new Airline();
Location loc = new Location();
Schedule sch = new Schedule();

String airlineDesc="";
String fromLocDesc="";
String toLocDesc="";
String price="";
String date="";
String time="";
String fClass="";
String seatQnty="";

java.util.Iterator schList = sch.getScheduleDetail(schId).iterator();
java.util.Iterator airlineList = air.getAirlineList().iterator();
java.util.Iterator fromLocList = loc.getlocationList().iterator();
java.util.Iterator toLocList = loc.getlocationList().iterator();

%>	  
	  <table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="100%" valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="8">
              <tr>
                <td>
				 <table width="100%" border="0" cellspacing="0" cellpadding="0">
				 	  <tr>
                        <td><a href="adminDashboard.jsp">Home&gt;&gt;</a></td>
                      </tr>
                      <tr>
                        <td height="1" bgcolor="#999999"><img src="images/spacer.gif" width="1" height="1"></td>
                      </tr>
                    </table>
				  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><table width="750"  border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="200" height="19" bgcolor="#373948" class="titlelink"> &nbsp;<span class="title">&nbsp;Add Admin </span></td>
                          <td width="550" bgcolor="" class="titlelink"> 
                          	<font color="#FF0000">
	                          	<%if(!msg.matches("")){ %>
	                          	<%=msg %>
	                          	<%} %>
                           </font> 
                          </td>
                         
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td>
					 
					  <table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#373948">
                          <tr align="center" bgcolor="#FAFAFA">
                            <td width="14%">
							 <form name="f1"action="doEditFlightSchedule.jsp?schId=<%=schId%>" method="post">
							    <table width="100%"  border="0" cellpadding="2" cellspacing="0" bgcolor="#ECE9D8">
							      <%
							      	while(schList.hasNext()){
							      		HashMap tempMap1 = (HashMap) schList.next();
							      		airlineDesc = air.getAirlineDesc(tempMap1.get("alnId").toString());
							      		fromLocDesc =  loc.getlocationDesc(tempMap1.get("fromLocId").toString());
							      		toLocDesc = loc.getlocationDesc(tempMap1.get("toLocId").toString());
							      		price = tempMap1.get("price").toString();
							      		date = tempMap1.get("flightDate").toString();
							      		time = tempMap1.get("flightTime").toString();
							      		seatQnty = tempMap1.get("seatQnty").toString();
							      %>
                                  <tr bgcolor="#FFFFFF">
                                    <td width="2%">&nbsp;</td>
                                    <td width="22%">&nbsp;</td>
                                    <td width="15%">Airline</td>
                                    <td width="58%">
                                    	<select name="alnId">
                                    	<option value="<%=tempMap1.get("alnId")%>"><%=airlineDesc %></option>
                                    	 <%while(airlineList.hasNext()){ 
                                    	 	HashMap tempMap = (HashMap) airlineList.next();
                                    		 %>
                                    	 	<option value="<%=tempMap.get("alnId")%>"><%=tempMap.get("airlineDesc")%></option>
                                    	 <%} %>	
                                    	</select>
                                    </td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td width="2%">&nbsp;</td>
                                    <td width="22%">&nbsp;</td>
                                    <td width="15%">From </td>
                                    <td width="58%">
                                    <select name="fromLocId">
                                    <option value="<%=tempMap1.get("fromLocId")%>"><%=fromLocDesc%></option>
                                    	  <%while(fromLocList.hasNext()){ 
                                    	 	HashMap tempMap = (HashMap) fromLocList.next();
                                    		 %>
                                    	 	<option value="<%=tempMap.get("locId")%>"><%=tempMap.get("locDesc")%></option>
                                    	 <%} %>		
                                    	</select>
                                    </td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td width="2%">&nbsp;</td>
                                    <td width="22%">&nbsp;</td>
                                    <td width="15%">To </td>
                                    <td width="58%">
                                    <select name="toLocId">
                                    <option value="<%=tempMap1.get("toLocId")%>"><%=toLocDesc%></option>
                                    	 <%while(toLocList.hasNext()){ 
                                    	 	HashMap tempMap = (HashMap) toLocList.next();
                                    		 %>
                                    	 	<option value="<%=tempMap.get("locId")%>"><%=tempMap.get("locDesc")%></option>
                                    	 <%} %>	
                                    	</select>
                                    </td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>Price </td>
                                    <td><input name="price" value="<%=price%>" required></td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>Time </td>
                                    <td><input name="time" value="<%=time%>" required></td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>Date </td>
                                    <td><input name="date" value="<%=date%>" required></td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td width="2%">&nbsp;</td>
                                    <td width="22%">&nbsp;</td>
                                    <td width="15%">Class </td>
                                    <td width="58%">
                                    <select name="class">
                                    <option value="<%=tempMap1.get("class")%>"><%=tempMap1.get("class")%></option>
                                    	 <option value="A">A</option>
                                    	 <option value="B">B</option>
                                    	 <option value="C">C</option>	
                                    	</select>
                                     </td>
                                    <td width="16%">&nbsp;</td> 
                                   </tr> 
                                  <tr bgcolor="#FFFFFF">
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>Seat Quantity </td>
                                    <td><input name="seatQnty" value="<%=seatQnty%>" required></td>
                                    <td width="16%"\>&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    
                              <td>&nbsp; </td>
                                    <td><input type="submit" name="Submit" value="Submit">
                                <input type="reset" name="reset" value="Reset"></td>
                                <td>&nbsp; </td>
                                  </tr>
                                  <%} %>
                                </table>
							  </form>
						    </td>
                          </tr>
                      </table></td>
                    </tr>
                </table></td>
              </tr>
              
          </table></td>
        </tr>
      </table></td>
	  
  </tr>
  <tr>
     <td valign="top" bgcolor="#FFFFFF">
    	<jsp:include page="/include/footer.jsp" />
	 </td>
</tr>
  <tr>
   
  </tr>
</table>
</body>
</html>
