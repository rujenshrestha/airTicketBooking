
<%@page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>

<%
System.out.println("Insdie userSessionManageer");

if(session.getAttribute("id")==null || session.getAttribute("roleCd")==null || 
   session.getAttribute("statusCd")==null){
	
	
	%>
		<jsp:forward page="/login/logout.jsp">
			<jsp:param value="" name=""/>
		</jsp:forward>
	<%
}else if(session.getAttribute("id")!=null && session.getAttribute("roleCd")!=null &&
		 session.getAttribute("statusCd")!=null){
	
	System.out.println("id: "+session.getAttribute("id").toString());
	System.out.println("roleCd: "+session.getAttribute("roleCd").toString());
	System.out.println("statusCd: "+session.getAttribute("statusCd").toString());
	
	if(!session.getAttribute("roleCd").toString().matches("U")){
		%>
			<jsp:forward page="/login/logout.jsp">
				<jsp:param value="" name=""/>
			</jsp:forward>
		<%
	}
	if(!session.getAttribute("statusCd").toString().matches("E")){
		%>
			<jsp:forward page="/login/logout.jsp">
				<jsp:param value="" name=""/>
			</jsp:forward>
		<%
	}
	
}else{
		%>
			<jsp:forward page="/login/logout.jsp">
				<jsp:param value="" name=""/>
			</jsp:forward>
		<%
}

%>