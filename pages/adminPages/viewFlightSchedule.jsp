<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<jsp:include page="/include/adminSessionManager.jsp" />
<%@ page import="schedule.Schedule"%>
<%@ page import="airline.Airline"%>
<%@ page import="location.Location"%>
<html>
<head>

<title>Online Air Ticketing</title>
<link href="/airTicketBooking/css/style.css" rel="stylesheet" type="text/css">
<link href="/airTicketBooking/css/ddmenu.css" rel="stylesheet" type="text/css" />
    <script src="/airTicketBooking/js/ddmenu.js" type="text/javascript"></script>
</head>

<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0"> 

 <jsp:include page="/include/footer.jsp" />
 <jsp:include page="/include/adminMenu.jsp" />
 
 <%
 String msg="";
 if(request.getParameter("msg")!=null){
	 msg = request.getParameter("msg").toString();
 }
 String rowColor="";
 int i=0;
 String airlineDesc="";
 String fromLocDesc="";
 String toLocDesc="";
 
 Schedule sch = new Schedule();
 Airline air = new Airline();
 Location loc=new Location();
 
 java.util.Iterator schList = sch.getScheduleList().iterator();
 %>
 
      <table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="100%" valign="top" bgcolor="#FFFFFF"><table width="100%"  border="0" cellspacing="0" cellpadding="8">
              <tr>
                <td height="177" bgcolor="#FFFFFF">
                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                        <td><a href="adminDashboard.jsp">Home&gt;&gt;</a></td>
                      </tr>
                  <tr>
                    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="1" bgcolor="#999999"><img src="images/spacer.gif" width="1" height="1"></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="2"><img src="images/spacer.gif" width="1" height="1"></td>
                  </tr>
                </table>
                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><table width="750"  border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            
                      <td width="183" height="19" bgcolor="#373948" class="titlelink"> 
                        &nbsp;<span class="title">&nbsp;Flight Schedule List</span></td>
                            <td width="368" bgcolor="" class="titlelink"> <table width="100%" cellpadding="0" cellspacing="0">
								</table> 
                              </font> </td>
                            <td width="199" bgcolor="" class="titlelink"><font color="#FF0000"> 
                              <%if(msg != null){
							out.print(msg);}%>
                              </font> </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr>
                      <td>
					 
					  <table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#373948">
                          <tr align="center" bgcolor="#FAFAFA">
                            <td width="14%">
							 
                                <table width="100%"  border="0" cellpadding="2" cellspacing="1" bgcolor="#ECE9D8">
                                  <tr>
                                    <td>&nbsp; </td>
                                    <td width="3%"><strong>Id</strong></td>
                                    <td widht="15%"><strong>Airline</strong></td>
                                    <td width="10%"><strong>From</strong></td>
                                    <td width="10%"><strong>To</strong></td>
                                    <td width="10%"><strong>Ticket Price</strong></td>
                                    <td width="10%"><strong>Departure Date</strong></td>
                                    <td width="10%"><strong>Departure Time</strong></td>
                                    <td width="2%"><strong>Class</strong></td>
                                    <td width="10%"><strong>Seat Quantity</strong></td>
                                    <td colspan="3" align="center"><strong>Actions</strong></td>
                                  </tr>
                                  
<%
  	 while (schList.hasNext()) {
  	 HashMap tempMap = (HashMap) schList.next(); 
  	 
  	 airlineDesc =  air.getAirlineDesc(tempMap.get("alnId").toString());
  	 fromLocDesc = loc.getlocationDesc(tempMap.get("fromLocId").toString());
  	 toLocDesc = loc.getlocationDesc(tempMap.get("toLocId").toString());
  	 
	rowColor = ((i++ % 2) == 0) ? "#ececec" : "#fffff" ;
%>
			<tr bgcolor="<%=rowColor%>">
									<td>&nbsp; </td>
                          			<td><%=tempMap.get("schId")%></td>
                                    <td><%=airlineDesc%></td>
                                    <td><%=fromLocDesc%></td>
                                    <td><%=toLocDesc%></td>
                                    <td><%=tempMap.get("price")%></td>
                                    <td><%=tempMap.get("flightDate")%></td>
                                    <td><%=tempMap.get("flightTime")%></td>
                                    <td><%=tempMap.get("class")%></td>
                                    <td><%=tempMap.get("seatQnty")%></td>
                                    <td>
                                        <a href="doStartReservation.jsp?schId=<%=tempMap.get("schId")%>&seatQnty=<%=tempMap.get("seatQnty") %>" title="RESERVE">RESERVE</a>
                                    </td>
                                    <td>
                                        <a href="editFlightSchedule.jsp?schId=<%=tempMap.get("schId")%>" title="EDIT"><img src="../../images/action/edit.png" border="0"></a>
                                    </td>
                                    <td>	
                                    	<a href="doDeleteFlightSchedule.jsp?schId=<%=tempMap.get("schId")%>" title="DELETE"  onClick="return confirm('Do you really want to disable this User?')"><img src="../../images/action/delete.png" border="0"></a>
                                    </td>
                                    
			</tr>
		 <%}%>
                                  <tr bgcolor="#FFFFFF">
                                    <td colspan="13">&nbsp;</td>
                                  </tr>
                              </table>
							  
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
</table>
</body>
</html>