<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<%@page import="airline.Airline" %>
<%@page import="location.Location" %>
<html>
<head>

<title>Online Air Ticketing</title>
<link href="../../css/style.css" rel="stylesheet" type="text/css">
<link href="../../css/ddmenu.css" rel="stylesheet" type="text/css" />
    <script src="../../js/ddmenu.js" type="text/javascript"></script>
    <script src="../../js/bookingForm/citiesnDate.js"></script>
</head>

<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0"> 
 <jsp:include page="../../include/header.jsp" />
 <jsp:include page="../../include/adminMenu.jsp" />
	  
<%
String msg="";
if(request.getParameter("msg")!=null){
	msg=request.getParameter("msg").toString();
}

Airline air = new Airline();
Location fromLoc = new Location();
Location toLoc = new Location();

java.util.Iterator airlineList = air.getAirlineList().iterator();
java.util.Iterator fromLocList = fromLoc.getlocationList().iterator();
java.util.Iterator toLocList = toLoc.getlocationList().iterator();

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
							 <form name="f1"action="doAddFlightSchedule.jsp" method="post">
							    <table width="100%"  border="0" cellpadding="2" cellspacing="0" bgcolor="#ECE9D8">
                                  <tr bgcolor="#FFFFFF">
                                    <td width="2%">&nbsp;</td>
                                    <td width="22%">&nbsp;</td>
                                    <td width="15%">Airline</td>
                                    <td width="58%">
                                    	<select name="alnId">
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
                                    <td><input type="text" name="price" maxlength="100" required></td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>Time </td>
                                    <td><input type="text" name="time" maxlength="50" required></td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>Date </td>
                                    <td> 
                                    	<input id="departureDate" name="departureDate" 
                                    	  class="datepicker watermark watermarked ui-corner-all" 
                                    	  value="" /></td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>   
                                  <tr bgcolor="#FFFFFF">
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>Seat Quantity </td>
                                    <td><input type="text" name="seatQnty" maxlength="50" required></td>
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
    	<jsp:include page="../../include/footer.jsp" />
	 </td>
</tr>
  <tr>
   
  </tr>
</table>
</body>
</html>
