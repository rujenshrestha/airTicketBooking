<%@page contentType="text/html; charset=iso-8859-1" language="java" import="login.Login,java.util.HashMap" errorPage="" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Online Air Ticketing</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

</head>

<%
String url=request.getContextPath();
String username = request.getParameter("username").toString();
String password = request.getParameter("password").toString();

Login login = new Login();

String athId="";
String roleCd="";
String statusCd="";
String logId="";

%>
<body>

<%

try{
		java.util.Iterator log = login.getLoginDetail(username).iterator();
		if(log.hasNext()){
			HashMap tempMap = (HashMap) log.next();
			
			if(password.matches(tempMap.get("pwd").toString())){
				
				athId = tempMap.get("athId").toString();
				roleCd = tempMap.get("roleCd").toString();
				statusCd = tempMap.get("statusCd").toString();
				logId = tempMap.get("id").toString();
				
				session.setAttribute("id",logId);
				session.setAttribute("roleCd",roleCd);
				session.setAttribute("athId",athId);
				session.setAttribute("statusCd",statusCd);
				session.setMaxInactiveInterval(300);
				
				System.out.println("Session Id:: "+session.getAttribute("id"));
				System.out.println("Session Role:: "+session.getAttribute("roleCd"));
				System.out.println("Session athId:: "+session.getAttribute("athId"));

				
				
				
				if(roleCd.matches("A")&& statusCd.matches("E")){
					url = "/pages/adminPages/adminDashboard.jsp";
					%>
						<jsp:forward page="/pages/adminPages/adminDashboard.jsp" >
							<jsp:param name="msg" value="" />
						</jsp:forward>
					<%
				
				}else if(roleCd.matches("U")&& statusCd.matches("E")){
					url = url+"/pages/userPages/userDashboard.jsp";
					%>
						<jsp:forward page="/pages/userPages/userDashboard.jsp" >
							<jsp:param name="msg" value="" />
						</jsp:forward>
					<%
				}else{
					%>
					<jsp:forward page="/login/login.jsp" >
						<jsp:param name="msg" value="Your Login has been disabled" />
					</jsp:forward>
					<%
					
				}
				
			}else{
				%>
				<jsp:forward page="/login/login.jsp" >
					<jsp:param name="msg" value="Invalid Username or Password" />
				</jsp:forward>
				<%
			}
			
		}
		
		
}catch (Exception err){
	System.out.println("Exception in doLogin: "+err);
}%>
		<jsp:forward page="/login/login.jsp" >
			<jsp:param name="msg" value="Invalid Username or Password" />
		</jsp:forward>

</body>
</html>
