<%@page contentType="text/html; charset=iso-8859-1" language="java" isErrorPage ="true" %>
<jsp:include page="/include/header.jsp"/>
<div class="panel panel-ibx">
<div class="panel-body">
<div class="error-wrap">
	<h4 style="font-size:36px;margin-top:30px;">Oops!</h4>
	<p>something went wrong</p>
	<%--<a href="javascript: history.go(-1)"><i class="fa fa-home" style="color:#FF3300"></i></a>--%>
	<button class="btn btn-success" onclick="location.href='javascript: history.go(-1)';">GO BACK <i class="fa fa-arrow-circle-left"></i></button>
</div>
</div>
</div>
<jsp:include page="/include/footer.jsp" />