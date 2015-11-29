<%@page contentType="text/html; charset=iso-8859-1" language="java" import="login.Login,java.util.HashMap" errorPage="" %>
<%@page import="org.codehaus.jackson.map.util.JSONPObject" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Online Air Ticketing</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

</head>

<body>

<%






String userName = request.getParameter("userName");
String pwd = request.getParameter("passWord");
 String arrays = request.getParameter("arrays");

    System.out.println("Session Id:: "+userName);
    System.out.println("Session Role:: "+pwd);
    System.out.println("arrays:: "+arrays);



    response.setContentType("application/json");
    PrintWriter out1 = response.getWriter();
    out1.println("{");
    out1.println("\"fName\": \"Devesh\",");
    out1.println("\"lName\": \"Sharma\"");
    out1.println("}");
    out1.close();

//String[] str = {"nikesh","is ","very ","good"};
//String greetings = "Hello " + userName+"  password="+pwd+"    this is "+str;
////json.write(response.getWriter());
//response.setContentType("text/html");
//response.getWriter().write(greetings);





%>

</body>
</html>
