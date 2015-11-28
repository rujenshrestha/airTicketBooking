<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menucool ddmenu</title>
    <link href="../css/ddmenu.css" rel="stylesheet" type="text/css" />
    <script src="../js/ddmenu.js" type="text/javascript"></script>
    <style>
        /*The following are for this demo page only (not required for the ddmenu).*/
        body { background: #eee url(ddmenu/ddmenu-bg.jpg) no-repeat center 0px; padding-top:90px;}
    </style>
</head>
<body>
<nav id="ddmenu">
    
    <ul>
        <li class="full-width">
            <span class="top-heading">Admin</span>
			<i class="caret"></i>          
            <div class="dropdown">
                <div class="dd-inner">
                    <div class="column">
                        <h3>Users</h3>
                        <a href="<%=request.getContextPath() + "/pages/adminPages/viewUser.jsp"%>">View Users</a>
                        <a href="#">&nbsp;</a>
                        <h3>Admin</h3>
                        <a href="<%=request.getContextPath() + "/pages/adminPages/addAdmin.jsp"%>">Add Admin</a>
                        <a href="<%=request.getContextPath() + "/pages/adminPages/viewAdmin.jsp"%>">View Admin</a>
                    </div>
                    
                    <div class="column">
                        <h3>Bank</h3>
                        <a href="<%=request.getContextPath() + "/pages/adminPages/addBank.jsp"%>">Add Bank</a>
                        <a href="<%=request.getContextPath() + "/pages/adminPages/viewBank.jsp"%>">View Bank</a>
                        <h3>Airline</h3>
                        <a href="<%=request.getContextPath() + "/pages/adminPages/addAirline.jsp"%>">Add Airline</a>
                        <a href="<%=request.getContextPath() + "/pages/adminPages/viewAirline.jsp"%>">View Airline</a>
                    </div>
                    
                    <div class="column">
                        <h3>Flight Schedule</h3>
                        <a href="<%=request.getContextPath() + "/pages/adminPages/addFlightSchedule.jsp"%>">Add Schedule</a>
                        <a href="<%=request.getContextPath() + "/pages/adminPages/viewFlightSchedule.jsp"%>">View Schedule</a>
                    </div>
                    
                </div>
            </div>
        </li>
        <li class="no-sub"><a class="top-heading" href="http://www.google.com">Change Password</a></li>
        
        
        <li class="no-sub">
            <a class="top-heading" href="#">Log out</a>
        </li>
        
    </ul>
</nav>
    
</body>
</html>