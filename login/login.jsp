<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Online Air Ticketing | Sign Up</title>
<!-- Bootstrap -->
<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/custom.css" />
<link rel="stylesheet" type="text/css" href="../css/slider.css" />
<link rel="stylesheet" type="text/css" href="../css/slider2.css" />
<link rel="stylesheet" type="text/css" href="../css/login.css" />

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="../js/html5shiv.min.js"></script>
    <script src="../js/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<%
String msg="";
if(request.getParameter("msg")!=null){
	msg=request.getParameter("msg").toString();
}
%>
    <div class="container-fluid">
        <div class="row">
            <nav
                class="navbar navbar-default navbar-fixed-top text-center greenborder"
            >
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse"
                            data-target="#myNavbar"
                        >
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>

                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar">
                        <ul class="nav navbar-nav pull-right">
                          <li class="active">
                                <a href=""<%=request.getContextPath() + "index.jsp"%>"">Home</a>
                            </li>
                            <li>
                                <a href="#">About</a>
                            </li>
                            <li>
                                <a href="#">Services</a>
                            </li>
                            <!-- <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                    Pages
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="#">Page 1</a>
                                    </li>
                                    <li>
                                        <a href="#">Page 2</a>
                                    </li>
                                    <li>
                                        <a href="#">Page 3</a>
                                    </li>
                                </ul>
                            </li> -->
                           
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
<div class="container">
    	<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" class="active" id="login-form-link">Login</a>
							</div>
							<div class="col-xs-6">
								<a href="#" id="register-form-link">Register</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
					<div>
						<font color="#FF0000">
	                          	<%if(!msg.matches("")){ %>
	                          	<%=msg %>
	                          	<%} %>
                        </font> 
                     </div>
						<div class="row">
							<div class="col-lg-12">
								<form id="login-form" action="doLogin.jsp" method="post" role="form" style="display: block;">
									<div class="form-group">
										<input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="">
									</div>
									<div class="form-group">
										<input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
									</div>
									<div class="form-group text-center">
										<input type="checkbox" tabindex="3" class="" name="remember" id="remember">
										<label for="remember"> Remember Me</label>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<a href="" tabindex="5" class="forgot-password">Forgot Password?</a>
												</div>
											</div>
										</div>
									</div>
								</form>
								<form id="register-form" action="" method="post" role="form" style="display: none;">
								<div class="form-group">
										<input type="text" name="name" id="name" tabindex="1" class="form-control" placeholder="Full Name" value="">
									</div>
									<div class="form-group">
										<input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="">
									</div>									
									<div class="form-group">
										<input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
									</div>
									<div class="form-group">
										<input type="password" name="confirm-password" id="confirm-password" tabindex="2" class="form-control" placeholder="Confirm Password">
									</div>
									<div class="form-group">
										<input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="Email Address" value="">
									</div>
									<div class="form-group">
										<input type="text" name="address" id="address" tabindex="1" class="form-control" placeholder="Address" value="">
									</div>
									<div class="form-group">
				                            <select class="form-control" id="bank" name="bank">
				                                <option>-- Select Bank --</option>
				                                <option>Nabil Bank</option>
				                                <option>Standard Chartered Bank</option>
				                                <option>Sidhhartha Bank</option>
				                                <option>Civil Bank</option>
				                                <option>Nepal Bank</option>
				                            </select>
                   					</div>
                   					<div class="form-group">
										<input type="text" name="account" id="account" tabindex="1" class="form-control" placeholder="Account No." value="">
									</div>
									<div class="form-group">
										<input type="text" name="mobile" id="address" tabindex="1" class="form-control" placeholder="Mobile No." value="">
									</div>
									<div class="form-group">
										<input type="text" name="contact" id="address" tabindex="1" class="form-control" placeholder="Contact No." value="">
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Get Started">
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<div class="row">
        <div
            class="container-fluid background-green text-center padding-x margin-top"
        >
            <a href="#">
                <i class="fa fa-twitter lightgreen padding fontsize"></i>
            </a>
            <a href="#">
                <i class="fa fa-facebook lightgreen padding fontsize"></i>
            </a>
            <a href="#">
                <i class="fa fa-dribbble lightgreen padding fontsize"></i>
            </a>
            <a href="#">
                <i class="fa fa-flickr lightgreen padding fontsize"></i>
            </a>
            <a href="#">
                <i class="fa fa-github lightgreen padding fontsize"></i>
            </a>
        </div>
    </div>
    <div class="row">
        <div class="container-fluid background-black padding-10">
            <small>
                <a class="padding lightblack" href="#">Home</a>
                |
            </small>
            <small>
                <a class="padding lightblack" href="#">About</a>
                |
            </small>
            <small>
                <a class="padding lightblack" href="#">Services</a>
                |
            </small>
            <small>
                <a class="padding lightblack" href="#">Price</a>
                |
            </small>
            <small>
                <a class="padding lightblack" href="#">Projects</a>
                |
            </small>
            <small>
                <a class="padding lightblack" href="#">Contact</a>
            </small>
            <small>
                <p class="pull-right lightblack">
                    Copyright @ 2015. Tempelate by
                    <a class="lightblack" href="#">
                        <i>ABC</i>
                    </a>
                </p>
            </small>
        </div>
    </div>
    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../js/bootstrap.min.js"></script>
    
        <script type="text/javascript">
    	$(function() {

		    $('#login-form-link').click(function(e) {
				$("#login-form").delay(100).fadeIn(100);
		 		$("#register-form").fadeOut(100);
				$('#register-form-link').removeClass('active');
				$(this).addClass('active');
				e.preventDefault();
			});
			$('#register-form-link').click(function(e) {
				$("#register-form").delay(100).fadeIn(100);
		 		$("#login-form").fadeOut(100);
				$('#login-form-link').removeClass('active');
				$(this).addClass('active');
				e.preventDefault();
			});

	});    	
    </script>
</body>
</html>
