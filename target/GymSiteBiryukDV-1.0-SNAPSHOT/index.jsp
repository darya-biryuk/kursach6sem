<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>MyGym - Main</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@include file="components/common_css_js.jsp" %>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- mobile metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <!-- site metas -->
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- bootstrap css -->
    <link rel="stylesheet" type="text/css" href="src/main/webapp/css/bootstrap_1.min.css">
    <!-- style css -->
    <link rel="stylesheet" type="text/css" href="css/style_1.css">
    <!-- Responsive-->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- fevicon -->
    <link rel="icon" href="images/fevicon.png" type="image/gif" />
    <!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
    <!-- Tweaks for older IEs-->
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
    <!-- owl stylesheets -->
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
</head>
<body>
    <%@include file="components/navbar.jsp" %>

    <div class="banner_section layout_padding">
        <div id="my_Controls" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="container">
                        <div class="banner_taital">
                            <h1 class="find_text">FIND EVERYTHING YOU NEED</h1>
                            <h2 class="crush_text">TO CRUSH YOUR FITNESS GOALS</h2>
                        </div>
                        <div class="contact">
                            <div class="contact_bt"><a href="#">Contact Us</a></div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="container">
                        <div class="banner_taital">
                            <h1 class="find_text">FIND EVERYTHING YOU NEED</h1>
                            <h2 class="crush_text">TO CRUSH YOUR FITNESS GOALS</h2>
                            <p class="long_text">It is a long established fact that a reader will be distracted by the readable content of a
                                page when looking at its layout. The point of using Lorem Ipsum is that</p>
                        </div>
                        <div class="contact">
                            <div class="contact_bt"><a href="#">Contact Us</a></div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="container">
                        <div class="banner_taital">
                            <h1 class="find_text">FIND EVERYTHING YOU NEED</h1>
                            <h2 class="crush_text">TO CRUSH YOUR FITNESS GOALS</h2>
                            <p class="long_text">It is a long established fact that a reader will be distracted by the readable content of a
                                page when looking at its layout. The point of using Lorem Ipsum is that</p>
                        </div>
                        <div class="contact">
                            <div class="contact_bt"><a href="#">Contact Us</a></div>
                        </div>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#my_Controls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#my_Controls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

    </div>

    <!-- footer section start -->
    <div class="footer_section layout_padding">
        <div class="footer_section_2">
            <div class="container">
                <div class="row map_addres">
                    <div class="col-sm-12 col-lg-4">
                        <div class="map_text"><img src="images/map-icon.png"><span class="map_icon">No.123 Chalingt Gates, Supper market New York</span></div>
                    </div>
                    <div class="col-sm-12 col-lg-4">
                        <div class="map_text"><img src="images/phone-icon.png"><span class="map_icon">( +71 7986543234 )</span></div>
                    </div>
                    <div class="col-sm-12 col-lg-4">
                        <div class="map_text"><img src="images/email-icon.png"><span class="map_icon">demo@gmail.com</span></div>
                    </div>
                </div>
                <div class="social_icon">
                    <ul>
                        <li><a href="#"><img src="images/fb-icon.png"></a></li>
                        <li><a href="#"><img src="images/twitter-icon.png"></a></li>
                        <li><a href="#"><img src="images/in-icon.png"></a></li>
                        <li><a href="#"><img src="images/instagram-icon.png"></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <%--<h1><%= "Hello World!" %></h1>
    <br/>
    <a href="register.jsp">Hello Servlet</a>--%>
</body>
</html>