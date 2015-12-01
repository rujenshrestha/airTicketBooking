<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<jsp:include page="/include/adminSessionManager.jsp" />
<%@page import="user.User" %>
<%@page import="bank.Bank" %>
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
	msg=request.getParameter("msg").toString();
}
String usrId = request.getParameter("usrId").toString();
User user = new User();
Bank bank = new Bank();

String bankDesc="";
java.util.Iterator userDetail = user.getUserDetail(usrId).iterator();
%>	  
	  <table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="100%" valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="8">
              <tr>
                <td>
				 <table width="100%" border="0" cellspacing="0" cellpadding="0">
				 	  <tr>
                        <td><a href="viewUser.jsp">Back&gt;&gt;</a></td>
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
                            <%
                            	while(userDetail.hasNext()){
                            		HashMap tempMap = (HashMap) userDetail.next();
                            		bankDesc = bank.getBankDesc(tempMap.get("bankId").toString());
                            		
                            	
                            %>
							
							    <table width="100%"  border="0" cellpadding="2" cellspacing="0" bgcolor="#ECE9D8">
                                  
                                  <tr bgcolor="#FFFFFF">
                                    <td width="2%">&nbsp;</td>
                                    <td width="22%">&nbsp;</td>
                                    <td width="15%">Fist Name </td>
                                    <td width="58%"><%=tempMap.get("firstName") %></td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td width="2%">&nbsp;</td>
                                    <td width="22%">&nbsp;</td>
                                    <td width="15%">Middle Name </td>
                                    <td width="58%"><%=tempMap.get("middleName") %></td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td width="2%">&nbsp;</td>
                                    <td width="22%">&nbsp;</td>
                                    <td width="15%">Last Name </td>
                                    <td width="58%"><%=tempMap.get("lastName") %></td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td width="2%">&nbsp;</td>
                                    <td width="22%">&nbsp;</td>
                                    <td width="15%">Username </td>
                                    <td width="58%"><%=tempMap.get("username") %></td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td width="2%">&nbsp;</td>
                                    <td width="22%">&nbsp;</td>
                                    <td width="15%">Phone </td>
                                    <td width="58%"><%=tempMap.get("phone") %></td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td width="2%">&nbsp;</td>
                                    <td width="22%">&nbsp;</td>
                                    <td width="15%">Mobile No. </td>
                                    <td width="58%"><%=tempMap.get("mobileNo") %></td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td width="2%">&nbsp;</td>
                                    <td width="22%">&nbsp;</td>
                                    <td width="15%">Email </td>
                                    <td width="58%"><%=tempMap.get("emailId") %></td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td width="2%">&nbsp;</td>
                                    <td width="22%">&nbsp;</td>
                                    <td width="15%">Address </td>
                                    <td width="58%"><%=tempMap.get("address") %></td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td width="2%">&nbsp;</td>
                                    <td width="22%">&nbsp;</td>
                                    <td width="15%">Bank </td>
                                    <td width="58%"><%=bankDesc %></td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td width="2%">&nbsp;</td>
                                    <td width="22%">&nbsp;</td>
                                    <td width="15%">Account No </td>
                                    <td width="58%"><%=tempMap.get("accountNo") %></td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                 <%} %>
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
  <tr>
   
  </tr>
</table>
</body>
</html>
