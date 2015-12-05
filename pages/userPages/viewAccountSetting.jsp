<%@page contentType="text/html; charset=iso-8859-1" language="java" import="user.User,java.util.HashMap" errorPage="" %>
<%@page import="bank.Bank" %>
<jsp:include page="/include/userSessionManager.jsp" />
<html>
<head>

    <title>Online Air Ticketing</title>
    <link href="/airTicketBooking/css/style.css" rel="stylesheet" type="text/css">
    <link href="/airTicketBooking/css/ddmenu.css" rel="stylesheet" type="text/css"/>
    <script src="/airTicketBooking/js/ddmenu.js" type="text/javascript"></script>
</head>

<body style="topmargin:0px auto;padding:0px;spacing:0px">
<jsp:include page="/include/header.jsp"/>
 <jsp:include page="/include/userMenu.jsp" />
	  
<%
String msg="";
String usrId="";
if(request.getParameter("msg")!=null) {
    msg = request.getParameter("msg").toString();
}
	
String bankDesc="";	

User usr = new User();
Bank bnk = new Bank();

if(session.getAttribute("id")!=null){
		System.out.println("Session Id in viewAccountSetting.jsp :: "+session.getAttribute("id"));
		usrId = session.getAttribute("id").toString();
		System.out.println("usrId in view AccountSetting:  "+usrId);
}
		
		java.util.Iterator usrDetail= usr.getUserDetail(usrId).iterator();
		java.util.Iterator bankList = bnk.getBankList().iterator();
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
							 <form name="f1"action="doEditAccountSetting.jsp?usrId=<%=usrId%>" method="post">
							    <table width="100%"  border="0" cellpadding="2" cellspacing="0" bgcolor="#ECE9D8">
        							<%
        								while(usrDetail.hasNext()){
										 	 HashMap tempMap = (HashMap) usrDetail.next();  
										 	 bankDesc = bnk.getBankDesc(tempMap.get("bankId").toString());
								    %>                         
		                                 
                                  <tr bgcolor="#FFFFFF">
                                    <td width="2%">&nbsp;</td>
                                    <td width="22%">&nbsp;</td>
                                    <td width="15%">First Name </td>
                                    <td width="58%"><input type="text" name="firstName" value="<%=tempMap.get("firstName")%>" maxlength="50" readonly></td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td width="2%">&nbsp;</td>
                                    <td width="22%">&nbsp;</td>
                                    <td width="15%">Middle Name </td>
                                    <td width="58%"><input type="text" name="middleName" value="<%=tempMap.get("middleName")%>" maxlength="50" readonly></td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td width="2%">&nbsp;</td>
                                    <td width="22%">&nbsp;</td>
                                    <td width="15%">Last Name </td>
                                    <td width="58%"><input type="text" name="lastName" value="<%=tempMap.get("lastName")%>" maxlength="50" readonly></td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td width="2%">&nbsp;</td>
                                    <td width="22%">&nbsp;</td>
                                    <td width="15%">Username </td>
                                    <td width="58%"><input type="text" name="username" value="<%=tempMap.get("username")%>" maxlength="50" required></td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td width="2%">&nbsp;</td>
                                    <td width="22%">&nbsp;</td>
                                    <td width="15%">Password </td>
                                    <td width="58%"><input type="password" name="password" value="<%=tempMap.get("pwd")%>" maxlength="50" required></td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>Address </td>
                                    <td><input type="text" name="address" value="<%=tempMap.get("address")%>" maxlength="100" required></td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>Phone </td>
                                    <td><input type="text" name="phone" value="<%=tempMap.get("phone")%>" maxlength="50" required></td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>Mobile no. </td>
                                    <td><input type="text" name="mobileNo" value="<%=tempMap.get("mobileNo")%>" maxlength="50" required></td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>   
                                  <tr bgcolor="#FFFFFF">
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>Email </td>
                                    <td><input type="text" name="email" value="<%=tempMap.get("emailId") %>" maxlength="50" required></td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>Bank </td>  
                                    <td>
                                    	<select name="bnkId">
                                    	<option value="<%=tempMap.get("bankId") %>"><%=bankDesc%></option>
                                    	<%while(bankList.hasNext()){
                                    		HashMap tempMap1 = (HashMap) bankList.next();
                                    		%>
                                    			<option value="<%=tempMap1.get("bnkId")%>"><%=tempMap1.get("bankDesc")%></option>
                                    		<%
                                    	}
                                    	%>
                                    	</select>
                                    </td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>Account No. </td>
                                    <td><input type="text" name="accountNo" value="<%=tempMap.get("accountNo") %>" maxlength="50" required></td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                  <%}%>  
                              <td>&nbsp; </td>
                                    <td><input type="submit" name="Submit" value="Submit">
                                <input type="reset" name="reset" value="Reset"></td>
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
      </table>
      <jsp:include page="/include/footer.jsp" />
</body>
</html>
