<%@page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<jsp:include page="/include/adminSessionManager.jsp" />
<!doctype html>
<head>

<title>Online Air Ticketing</title>
<link href="/airTicketBooking/css/style.css" rel="stylesheet" type="text/css">
<link href="/airTicketBooking/css/ddmenu.css" rel="stylesheet" type="text/css" />
    <script src="/airTicketBooking/js/ddmenu.js" type="text/javascript"></script>
</head>

<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0"> 
 <jsp:include page="/include/header.jsp" />
 <jsp:include page="/include/adminMenu.jsp" />
	  
<%
String msg="";
if(request.getParameter("msg")!=null){
	msg=request.getParameter("msg").toString();
}
%>	  
                          	<font color="#FF0000">
	                          	<%if(!msg.matches("")){ %>
	                          	<%=msg %>
	                          	<%} %>
                           </font> 
                          
                   
</body>
</html>
