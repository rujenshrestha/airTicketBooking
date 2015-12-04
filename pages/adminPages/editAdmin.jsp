<%@page contentType="text/html; charset=iso-8859-1" language="java" import="admin.Admin,java.util.HashMap" errorPage="" %>
<jsp:include page="/include/adminSessionManager.jsp" />
<html>
<head>

    <title>Online Air Ticketing</title>
    <link href="/airTicketBooking/css/style.css" rel="stylesheet" type="text/css">
    <link href="/airTicketBooking/css/ddmenu.css" rel="stylesheet" type="text/css"/>
    <script src="/airTicketBooking/js/ddmenu.js" type="text/javascript"></script>
</head>

<body style="topmargin:0px auto;padding:0px;spacing:0px">
<jsp:include page="/include/header.jsp"/>
 <jsp:include page="/include/adminMenu.jsp" />
	  
<%
String msg="";
String admId="";
if(request.getParameter("msg")!=null) {
    msg = request.getParameter("msg").toString();
}
	
String fullName="";
String address="";
String phone="";
String mobileNo="";
String email="";
String username="";
String pwd="";
	
Admin admin = new Admin();

if(session.getAttribute("id")!=null){
		System.out.println("Session Id in editAdmin.jsp :: "+session.getAttribute("id"));
		admId = session.getAttribute("id").toString();
		System.out.println("admId in editAdmin.jsp: "+admId);
}
		
		java.util.Iterator adminDetail = admin.getAdminDetail(admId).iterator();
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
							 <form name="f1"action="doEditAdmin.jsp?admId=<%=admId%>" method="post">
							    <table width="100%"  border="0" cellpadding="2" cellspacing="0" bgcolor="#ECE9D8">
        							<%
        								while(adminDetail.hasNext()){
										 	 HashMap tempMap = (HashMap) adminDetail.next();  
										 	 
										 	 fullName = tempMap.get("fullName").toString();
											 address = tempMap.get("address").toString();
										 	 phone = tempMap.get("phone").toString();
										 	 mobileNo = tempMap.get("mobileNo").toString();
										 	 email = tempMap.get("emailId").toString();
										 	 username = tempMap.get("username").toString();
										 	 pwd = tempMap.get("pwd").toString();
								
										}%>                         
		                                 
                                  <tr bgcolor="#FFFFFF">
                                    <td width="2%">&nbsp;</td>
                                    <td width="22%">&nbsp;</td>
                                    <td width="15%">Full Name </td>
                                    <td width="58%"><input type="text" name="fullname" value="<%=fullName%>" maxlength="50" readonly></td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td width="2%">&nbsp;</td>
                                    <td width="22%">&nbsp;</td>
                                    <td width="15%">Username </td>
                                    <td width="58%"><input type="text" name="username" value="<%=username%>" maxlength="50" required></td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td width="2%">&nbsp;</td>
                                    <td width="22%">&nbsp;</td>
                                    <td width="15%">Password </td>
                                    <td width="58%"><input type="password" name="password" value="<%=pwd%>" maxlength="50" required></td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>Address </td>
                                    <td><input type="text" name="address" value="<%=address%>" maxlength="100" required></td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>Phone </td>
                                    <td><input type="text" name="phone" value="<%=phone%>" maxlength="50" required></td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>Mobile no. </td>
                                    <td><input type="text" name="mobileNo" value="<%=mobileNo%>" maxlength="50" required></td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>   
                                  <tr bgcolor="#FFFFFF">
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>Email </td>
                                    <td><input type="text" name="email" value="<%=email %>" maxlength="50" required></td>
                                    <td width="16%">&nbsp;</td>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    
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
