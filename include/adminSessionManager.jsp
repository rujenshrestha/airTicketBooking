
<%@page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>

<jsp:useBean id="us" class="np.com.ntech.global.admin.User" />
<%//if(!us.isIPExist(request.getRemoteAddr())){

//response.sendRedirect("../index.jsp?msg=Not Valid");
%>
<!--jsp:forward page="../index.jsp?msg='Not Valid.' " /-->
<%//}%>
<%
String roleCd="";
if(session.getAttribute("roleCd") == null ||  
session.getAttribute("disable").toString().equals("Y")) {
	%>	
<jsp:forward page="/index.jsp" />

<%
}else{
	roleCd=session.getAttribute("roleCd").toString();
	}
	System.out.println("role code"+roleCd);
%>

  <%if(roleCd.equals("SA") || roleCd.equals("P") || roleCd.equals("A") ){}else{ %><jsp:forward page="/index.jsp"  /><%} %>
