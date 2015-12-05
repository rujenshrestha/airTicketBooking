<%@page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<%@page import="user.User" %>
<%@page import="schedule.Schedule" %>
<%@page import="java.util.*" %>
<jsp:include page="/include/adminSessionManager.jsp" />
<html>
<head>

<title>Online Air Ticketing</title>
<link href="/airTicketBooking/css/style.css" rel="stylesheet" type="text/css">
<link href="/airTicketBooking/css/ddmenu.css" rel="stylesheet" type="text/css" />
    <script src="/airTicketBooking/js/ddmenu.js" type="text/javascript"></script>
</head>

<body style="topmargin:0px auto;padding:0px;spacing:0px">
 <jsp:include page="/include/header.jsp" />
 <jsp:include page="/include/adminMenu.jsp" />
	  
<%
String msg="";
if(request.getParameter("msg")!=null){
	msg=request.getParameter("msg").toString();
}

User usr = new User();
Schedule sch = new Schedule();

java.util.Iterator usrList = usr.getUserList().iterator();
java.util.Iterator schList = sch.getScheduleList().iterator();

String fullName="";

%>	  
	  <table width="100%" height="73%"  border="0" cellpadding="0" cellspacing="0">
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
							 
							    <table width="100%"  border="0" cellpadding="2" cellspacing="0" bgcolor="#ECE9D8">
                                  <form name="f1"action="viewTransactionByUser.jsp" method="post">
	                                  <tr bgcolor="#FFFFFF">
	                                    <td width="2%">&nbsp;</td>
	                                    <td width="22%">&nbsp;</td>
	                                    <td width="15%">Transaction of User:</td>
	                                    <td width="58%">
	                                    <select name="usrId">
	                                    	<%while(usrList.hasNext()){ 
	                                    		HashMap tempMap = (HashMap) usrList.next();
	                                    		fullName = tempMap.get("firstName").toString()+" "
	                                    				  +tempMap.get("middleName").toString()+" "
	                                    				  +tempMap.get("lastName").toString();
	                                    	%>
	                                    		<option value="<%=tempMap.get("usrId") %>"><%=fullName%></option>
	                                    	<%} %>
	                                    </select>
	                                    </td>
	                                    <td><input type="submit" name="Submit" value="Search"></td>
	                                    <td width="16%">&nbsp;</td>
                                	  </tr >
                                	  
	                              </form>
	                              <form name="f2"action="viewTransactionBySchedule.jsp" method="post">  
	                                  <tr bgcolor="#FFFFFF">
	                                    <td width="2%">&nbsp;</td>
	                                    <td width="22%">&nbsp;</td>
	                                    <td width="15%">Transaction of Schedule: </td>
	                                    <td width="20%">
	                                    <select name="schId">
		                                    <%while(schList.hasNext()){ 
		                                    		HashMap tempMap = (HashMap) schList.next();
		                                    %>
		                                    		<option value="<%=tempMap.get("schId") %>"><%=tempMap.get("schId")%></option>
		                                    <%} %>
	                                    </select>
	                                    </td>
	                                    <td width="20%"><input type="submit" name="Submit" value="Search"></td>
	                                    <td width="20%">&nbsp;</td>
	                                  </tr>
                                  </form>
                                    
                                </table>
						    </td>
                          </tr>
                      </table></td>
                    </tr>
                </table></td>
              </tr>
              
          </table></td>
        </tr>
      </table>
    	<jsp:include page="/include/footer.jsp" />
	
</body>
</html>
