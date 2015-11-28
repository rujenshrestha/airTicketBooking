<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Online air ticketing</title>
<!-- Bootstrap -->
<link href="./css/bootstrap.css" rel="stylesheet">
<link href="./css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./css/custom.css" />
<link rel="stylesheet" type="text/css" href="./css/slider.css" />
<link rel="stylesheet" type="text/css" href="./css/slider2.css" />
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
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
                        <a class="navbar-brand padding-top padding-left" href="#">
                            <img src="./images/header.jpg" width="100%">
                        </a>
                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar">
                        <ul class="nav navbar-nav pull-right">
                          <li class="active">
                                <a href="#">Home</a>
                            </li>
                            <li>
                                <a href="#">About</a>
                            </li>
                            <li>
                                <a href="#">Services</a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath() + "/login/login.jsp"%>">Login/Sign Up</a>
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
        <div class="row">
            <div class="container-fluid">
                <div class="row">
                    <div id="carousel-example-generic" class="carousel slide"
                        data-ride="carousel"
                    >
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0"
                                class="active"
                            ></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="item active">
                                <img src="./images/flight-route.jpg" width="100%"
                                    alt="First slide"
                                >
                            </div>
                            <div class="item">
                                <img src="./images/newslider2.jpg" width="100%"
                                    alt="Second slide"
                                >
                            </div>
                            <div class="item">
                                <img src="./images/newslider3.jpg" width="100%"
                                    alt="Third slide"
                                >
                            </div>
                        </div>
                        <a class="left carousel-control" href="#carousel-example-generic"
                            data-slide="prev"
                        >
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic"
                            data-slide="next"
                        >
                            <span class="glyphicon glyphicon-chevron-right"> </span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div id="push"></div>
        <!---sliderend--->
        <div class="container">
            <h3 class="padding-x">We operate with...</h3>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                <img src="./images/yeti.jpeg" width="50%" />
                <p></p>
                <small>
                    <p>Yeti Airlines Domestic Pvt. Ltd. is an airline based in
                        Kathmandu, Nepal. The airline was established in May 1998 and
                        received its Air Operators Certificate on 17 August 1998.</p>
                </small>
                <small>
                    <a class="green" href="http://www.sitaair.com.np/index.php">more</a>
                </small>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                <img src="./images/buddha.jpeg" width="50%" />
                <p></p>
                <small>
                    <p>Buddha Air Pvt. Ltd is an airline based in Jawalakhel,
                        Lalitpur District, Nepal, near Patan. It operates domestic as well
                        as international services within Nepal and India...</p>
                </small>
                <small>
                    <a class="green" href="https://www.buddhaair.com/">more</a>
                </small>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                <img src="./images/sita_air.jpg" width="50%" />
                <p></p>
                <small>
                    <p>Sitar Air is an airline based in Sinamangal Ward, Kathmandu,
                        Nepal; The airline's main base is Tribhuvan International Airport
                        with hubs at Pokhara Airport and Nepalgunj Airport.</p>
                </small>
                <small>
                    <a class="green" href="http://www.sitaair.com.np/">more</a>
                </small>
                <p></p>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                <img src="./images/saurya.png" width="50%" />
                <p></p>
                <small>
                    <p>Saurya Airlines Pvt. Ltd is an airline based in New
                        Baneshwor, Kathmandu District, Nepal. It operates domestic
                        services in Nepal..</p>
                </small>
                <small>
                    <a class="green" href="http://www.sauryaairlines.com/">more</a>
                </small>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                <img src="./images/simrik.jpg" width="50%" />
                <p></p>
                <small>
                    <p>Promoted by a group of distinguished aviator of repute with
                        the vast professional experience in the field of aviation, it has
                        created an indelible image as the ...</p>
                </small>
                <small>
                    <a class="green" href="www.simrikairlines.com/">more</a>
                </small>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                <img src="./images/tara.jpg" width="50%" />
                <p></p>
                <small>
                    <p>Tara Air is the newest and biggest airline service provider
                        in the Nepalese mountains. This company has started business with
                        the mission of helping develop the rural Nepal. ...</p>
                </small>
                <small>
                    <a class="green" href="www.taraair.com">more</a>
                </small>
            </div>
            <!-- <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                <img src="./images/goma.png" width="50%" />
                <p></p>
                <small>
                    <p>Goma Air has started its operation from February 24, 2011
                        with two “Cessna Grand Caravan 208B”. During the initial days Goma
                        Air focused its operation in STOL Airfields of Nepal with its base
                        being...</p>
                </small>
                <small>
                    <a class="green" href="www.taraair.com">more</a>
                </small>
            </div> -->
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                <img src="./images/guna_air.gif" width="50%" />
                <p></p>
                <small>
                    <p>Guna Airlines will serve both local as well as foreign
                        travellers regular, service and reliable flights to several
                        destinations to and from Kathmandu...</p>
                </small>
                <!-- <small>
                    <a class="green" href="www.taraair.com">more</a>
                </small> -->
            </div>
        </div>
    </div>
    <div class="container margin-top">
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
            <h3>About Us</h3>
            <small>
                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed
                    diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam
                    erat volutpat.</p>
            </small>
            <small>
                <p>Ut wisi enim ad minim veniam, quis nostrud exerci tation
                    ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo
                    consequat.</p>
            </small>
            <small>
                <a class="green" href="#">read more</a>
            </small>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
            <h3>Clients</h3>
            <small>
                <p>
                    <i>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
                        sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
                        aliquam erat volutpat.Ut wisi enim ad minim veniam, quis nostrud
                        exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea
                        commodo consequat at vero eros et accumsan et iusto odio dignissim
                        qui.</i>
                </p>
            </small>
            <small>
                <p>
                    <i>by a famous writer</i>
                </p>
            </small>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
            <h3>Projects</h3>
            <ul>
                <li>
                    <small>Lorem ipsum dolor sit amet</small>
                </li>
                <li>
                    <small>Lorem ipsum dolor sit amet</small>
                </li>
                <li>
                    <small>Lorem ipsum dolor sit amet</small>
                </li>
                <li>
                    <small>Lorem ipsum dolor sit amet</small>
                </li>
                <li>
                    <small>Lorem ipsum dolor sit amet</small>
                </li>
                <li>
                    <small>Lorem ipsum dolor sit amet</small>
                </li>
                <li>
                    <small>Lorem ipsum dolor sit amet</small>
                </li>
            </ul>
        </div>
    </div>
    <!--slider2--->
    <div class="container margin-top">
        <div class="col-md-9 col-lg-9 col-sm-9 col-xs-12">
            <h3>Our Projects</h3>
        </div>
        <div class="container">
            <div class="col-md-3 col-lg-3 col-sm-3 col-xs-12">
                <!-- Controls -->
                <div class="controls pull-right">
                    <a class="left fa fa-chevron-left btn btn-success"
                        href="#carousel-example" data-slide="prev"
                    ></a>
                    <a class="right fa fa-chevron-right btn btn-success"
                        href="#carousel-example" data-slide="next"
                    ></a>
                </div>
            </div>
        </div>
        <div id="carousel-example" class="carousel slide" data-ride="carousel">
            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item active">
                    <div class="row">
                        <div class="col-sm-3 col-md-3 col-lg-3 col-xs-12 margin-top">
                            <div class="col-item">
                                <div class="photo">
                                    <img src="./images/bottomslider1.jpg" class="img-responsive"
                                        alt="a"
                                    />
                                </div>
                                <div class="info">
                                    <div class="row">
                                        <div class="price col-md-6">
                                            <h5>Praesent Commodo</h5>
                                            <h5 class="price-text-color"></h5>
                                        </div>
                                        <div class="rating hidden-sm col-md-6">
                                            <i class="price-text-color fa fa-star"></i>
                                            <i class="price-text-color fa fa-star"> </i>
                                            <i class="price-text-color fa fa-star"></i>
                                            <i class="price-text-color fa fa-star"> </i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </div>
                                    <div class="separator clear-left">
                                        <small>
                                            <p>Lorem ipsum dolor sit amet</p>
                                        </small>
                                        <br>
                                        <button type="button" class="btn btn-primary">
                                            <small>Read More</small>
                                        </button>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3 col-md-3 col-lg-3 col-xs-12 margin-top">
                            <div class="col-item">
                                <div class="photo">
                                    <img src="./images/bottomslider2.jpg" class="img-responsive"
                                        alt="a"
                                    />
                                </div>
                                <div class="info">
                                    <div class="row">
                                        <div class="price col-md-6">
                                            <h5>Praesent Commodo</h5>
                                            <h5 class="price-text-color"></h5>
                                        </div>
                                        <div class="rating hidden-sm col-md-6">
                                            <i class="price-text-color fa fa-star"></i>
                                            <i class="price-text-color fa fa-star"> </i>
                                            <i class="price-text-color fa fa-star"></i>
                                            <i class="price-text-color fa fa-star"> </i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </div>
                                    <div class="separator clear-left">
                                        <small>
                                            <p>Lorem ipsum dolor sit amet</p>
                                        </small>
                                        <br>
                                        <button type="button" class="btn btn-primary">
                                            <small>Read More</small>
                                        </button>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3 col-md-3 col-lg-3 col-xs-12 margin-top">
                            <div class="col-item">
                                <div class="photo">
                                    <img src="./images/bottomslider3.jpg" class="img-responsive"
                                        alt="a"
                                    />
                                </div>
                                <div class="info">
                                    <div class="row">
                                        <div class="price col-md-6">
                                            <h5>Praesent Commodo</h5>
                                            <h5 class="price-text-color"></h5>
                                        </div>
                                        <div class="rating hidden-sm col-md-6">
                                            <i class="price-text-color fa fa-star"></i>
                                            <i class="price-text-color fa fa-star"> </i>
                                            <i class="price-text-color fa fa-star"></i>
                                            <i class="price-text-color fa fa-star"> </i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </div>
                                    <div class="separator clear-left">
                                        <small>
                                            <p>Lorem ipsum dolor sit amet</p>
                                        </small>
                                        <br>
                                        <button type="button" class="btn btn-primary">
                                            <small>Read More</small>
                                        </button>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3 col-md-3 col-lg-3 col-xs-12 margin-top">
                            <div class="col-item">
                                <div class="photo">
                                    <img src="./images/bottomslider4.jpg" class="img-responsive"
                                        alt="a"
                                    />
                                </div>
                                <div class="info">
                                    <div class="row">
                                        <div class="price col-md-6">
                                            <h5>Praesent Commodo</h5>
                                            <h5 class="price-text-color"></h5>
                                        </div>
                                        <div class="rating hidden-sm col-md-6">
                                            <i class="price-text-color fa fa-star"></i>
                                            <i class="price-text-color fa fa-star"> </i>
                                            <i class="price-text-color fa fa-star"></i>
                                            <i class="price-text-color fa fa-star"> </i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </div>
                                    <div class="separator clear-left">
                                        <small>
                                            <p>Lorem ipsum dolor sit amet</p>
                                        </small>
                                        <br>
                                        <button type="button" class="btn btn-primary">
                                            <small>Read More</small>
                                        </button>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="row">
                        <div class="col-sm-3 col-md-3 col-lg-3 col-xs-12 margin-top">
                            <div class="col-item">
                                <div class="photo">
                                    <img src="./images/bottomslider5.jpg" class="img-responsive"
                                        alt="a"
                                    />
                                </div>
                                <div class="info">
                                    <div class="row">
                                        <div class="price col-md-6">
                                            <h5>Praesent Commodo</h5>
                                            <h5 class="price-text-color"></h5>
                                        </div>
                                        <div class="rating hidden-sm col-md-6">
                                            <i class="price-text-color fa fa-star"></i>
                                            <i class="price-text-color fa fa-star"> </i>
                                            <i class="price-text-color fa fa-star"></i>
                                            <i class="price-text-color fa fa-star"> </i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </div>
                                    <div class="separator clear-left">
                                        <small>
                                            <p>Lorem ipsum dolor sit amet</p>
                                        </small>
                                        <br>
                                        <button type="button" class="btn btn-primary">
                                            <small>Read More</small>
                                        </button>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3 col-md-3 col-lg-3 col-xs-12 margin-top">
                            <div class="col-item">
                                <div class="photo">
                                    <img src="./images/bottomslider6.jpg" class="img-responsive"
                                        alt="a"
                                    />
                                </div>
                                <div class="info">
                                    <div class="row">
                                        <div class="price col-md-6">
                                            <h5>Praesent Commodo</h5>
                                            <h5 class="price-text-color"></h5>
                                        </div>
                                        <div class="rating hidden-sm col-md-6">
                                            <i class="price-text-color fa fa-star"></i>
                                            <i class="price-text-color fa fa-star"> </i>
                                            <i class="price-text-color fa fa-star"></i>
                                            <i class="price-text-color fa fa-star"> </i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </div>
                                    <div class="separator clear-left">
                                        <small>
                                            <p>Lorem ipsum dolor sit amet</p>
                                        </small>
                                        <br>
                                        <button type="button" class="btn btn-primary">
                                            <small>Read More</small>
                                        </button>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3 col-md-3 col-lg-3 col-xs-12 margin-top">
                            <div class="col-item">
                                <div class="photo">
                                    <img src="./images/bottomslider7.jpg" class="img-responsive"
                                        alt="a"
                                    />
                                </div>
                                <div class="info">
                                    <div class="row">
                                        <div class="price col-md-6">
                                            <h5>Praesent Commodo</h5>
                                            <h5 class="price-text-color"></h5>
                                        </div>
                                        <div class="rating hidden-sm col-md-6">
                                            <i class="price-text-color fa fa-star"></i>
                                            <i class="price-text-color fa fa-star"> </i>
                                            <i class="price-text-color fa fa-star"></i>
                                            <i class="price-text-color fa fa-star"> </i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </div>
                                    <div class="separator clear-left">
                                        <small>
                                            <p>Lorem ipsum dolor sit amet</p>
                                        </small>
                                        <br>
                                        <button type="button" class="btn btn-primary">
                                            <small>Read More</small>
                                        </button>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3 col-md-3 col-lg-3 col-xs-12 margin-top">
                            <div class="col-item">
                                <div class="photo">
                                    <img src="./images/bottomslider8.jpg" class="img-responsive"
                                        alt="a"
                                    />
                                </div>
                                <div class="info">
                                    <div class="row">
                                        <div class="price col-md-6">
                                            <h5>Praesent Commodo</h5>
                                            <h5 class="price-text-color"></h5>
                                        </div>
                                        <div class="rating hidden-sm col-md-6">
                                            <i class="price-text-color fa fa-star"></i>
                                            <i class="price-text-color fa fa-star"> </i>
                                            <i class="price-text-color fa fa-star"></i>
                                            <i class="price-text-color fa fa-star"> </i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </div>
                                    <div class="separator clear-left">
                                        <small>
                                            <p>Lorem ipsum dolor sit amet</p>
                                        </small>
                                        <br>
                                        <button type="button" class="btn btn-primary">
                                            <small>Read More</small>
                                        </button>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--slider2end--->
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
    <script src="./js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="./js/bootstrap.min.js"></script>
</body>
</html>