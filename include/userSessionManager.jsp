<%@page contentType="text/html; charset=iso-8859-1" language="java" errorPage="../error/error.jsp" %>

<%
String roleCd="";
String name="";

if(session.getAttribute("roleCd") == null ||  
session.getAttribute("disable").toString().equals("Y")) {
%>	
<jsp:forward page="../index.jsp" />

<%
}else{
	roleCd=session.getAttribute("roleCd").toString();
	name=session.getAttribute("name").toString();
	
}
%>

 <%if(roleCd.equals("U")){}else{ %><jsp:forward page="../index.jsp"  /><%}
 %> 

