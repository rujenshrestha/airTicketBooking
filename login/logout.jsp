

<%
session.removeAttribute("id");
session.removeAttribute("athId");
session.removeAttribute("roleCd");
%>
   
   <jsp:forward page="../index.jsp">
   	<jsp:param value="" name="msg"/>
   </jsp:forward>