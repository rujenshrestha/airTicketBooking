<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menucool ddmenu</title>
    <link href="/airTicketBooking/css/ddmenu.css" rel="stylesheet" type="text/css" />
    <script src="/airTicketBooking/js/ddmenu.js" type="text/javascript"></script>
    <style>
        /*The following are for this demo page only (not required for the ddmenu).*/
        body { background: #eee url(ddmenu/ddmenu-bg.jpg) no-repeat center 0px; padding-top:90px;}
    </style>
</head>
<body>
<nav id="ddmenu">
    
    <ul>
        <li class="full-width"><a class="top-heading" href="<%=request.getContextPath() + "/pages/userPages/viewAccountSetting.jsp"%>">Account Settings</a></li>
            
        <li class="no-sub"><a class="top-heading" href="<%=request.getContextPath() + "/login/logout.jsp"%>">Log out</a></li>
        
    </ul>
</nav>
    
</body>
</html>