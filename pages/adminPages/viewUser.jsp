<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*" errorPage="" %>
<%@ page import="user.User"%>
<html>
<head>

<title>Online Air Ticketing</title>
<link href="../../css/style.css" rel="stylesheet" type="text/css">
<link href="../../css/ddmenu.css" rel="stylesheet" type="text/css" />
    <script src="../../js/ddmenu.js" type="text/javascript"></script>
</head>

<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0"> 

 <jsp:include page="../../include/header.jsp" />
 <jsp:include page="../../include/adminMenu.jsp" />
 
 <%
 String msg="";
 if(request.getParameter("msg")!=null){
	 msg = request.getParameter("msg").toString();
 }
 String rowColor="";
 int i=0;
 String name="";
 User user = new User();
 java.util.Iterator userList = user.getUserList().iterator();
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
                        &nbsp;<span class="title">&nbsp;Bank List</span></td>
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
                                    <td width="5%"><strong>S.N.</strong></td>
                                    <td widht="20%"><strong>User Id</strong></td>
                                    <td width="50%"><strong>Name</strong></td>
                                    <td colspan="2"><strong>Actions</strong></td>
                                  </tr>
                                  
<%
  	 while (userList.hasNext()) {
  	 HashMap tempMap = (HashMap) userList.next();  
  	 name = tempMap.get("firstName").toString()+
  			tempMap.get("middleName").toString()+
  			tempMap.get("lastName").toString();
  	 
	rowColor = ((i++ % 2) == 0) ? "#ececec" : "#fffff" ;
%>
			<tr bgcolor="<%=rowColor%>">
									<td>&nbsp; </td>
                          			<td><%=i%></td>
                                    <td><%=tempMap.get("usrId")%></td>
                                    <td><%=name%></td>
                                    <td width="3%">
                                    	&nbsp;
                                    </td>
                                    <td>	
                                    	<a href="doDeleteUser.jsp?usrId=<%=tempMap.get("usrId")%>" title="DELETE"  onClick="return confirm('Do you really want to delete this User?')"><img src="../../images/action/delete.png" border="0"></a>
                                    </td>
                                    
			</tr>
		 <%}%>
                                  <tr bgcolor="#FFFFFF">
                                    <td colspan="8">&nbsp;</td>
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
	 <jsp:include page="../../include/footer.jsp" />
	</td>
  </tr>
</table>
</body>
</html>