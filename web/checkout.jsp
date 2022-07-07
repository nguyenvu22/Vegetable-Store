<%@page import="sample.products.ProductDTO"%>
<%@page import="sample.shop.Cart"%>
<%@page import="sample.users.UserDTO"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

        <!-- title -->
        <title>Check Out Page</title>

        <!-- google font -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
        <!-- fontawesome -->
        <link rel="stylesheet" href="template_user/assets/css/all.min.css">
        <!-- bootstrap -->
        <link rel="stylesheet" href="template_user/assets/bootstrap/css/bootstrap.min.css">
        <!-- owl carousel -->
        <link rel="stylesheet" href="template_user/assets/css/owl.carousel.css">
        <!-- magnific popup -->
        <link rel="stylesheet" href="template_user/assets/css/magnific-popup.css">
        <!-- animate css -->
        <link rel="stylesheet" href="template_user/assets/css/animate.css">
        <!-- mean menu css -->
        <link rel="stylesheet" href="template_user/assets/css/meanmenu.min.css">
        <!-- main style -->
        <link rel="stylesheet" href="template_user/assets/css/main.css">
        <!-- responsive -->
        <link rel="stylesheet" href="template_user/assets/css/responsive.css">

    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null) {
                loginUser = new UserDTO();
            }
            if (loginUser == null || !loginUser.getRole().equals("USER")) {
                response.sendRedirect("login.jsp");
                return;
            }
            String userFullName = loginUser.getFullName();
            if (loginUser.getFullName() == null) {
                userFullName = "";
            }
            String userAddress = loginUser.getAddress();
            if (userAddress == null) {
                userAddress = "";
            }
        %>
        <!--PreLoader-->
        <div class="loader">
            <div class="loader-inner">
                <div class="circle"></div>
            </div>
        </div>
        <!--PreLoader Ends-->

        <!-- header -->
        <div class="top-header-area" id="sticker">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-sm-12 text-center">
                        <div class="main-menu-wrap">
                            <!-- logo -->
                            <div class="site-logo">
                                <a href="MainController?action=MoveToUserPage">
                                    <img src="template_user/assets/img/logo.png" alt="">
                                    <span style="color: #fd7e14; font-weight: 800; font-size: 13px;">Vegetable Store</span>

                                </a>
                            </div>
                            <!-- logo -->

                            <!-- menu start -->
                            <nav class="main-menu">
                                <ul>
                                    <li class="current-list-item"><a href="#">Home</a>
                                        <ul class="sub-menu">
                                            <li><a href="MainController?action=MoveToUserPage">Static Home</a></li>
                                            <li><a href="MainController?action=MoveToUserPage">Slider Home</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="#">Pages</a>
                                        <ul class="sub-menu">
                                            <li><a href="MainController?action=MoveToCartPage">Cart</a></li>
                                            <li><a href="MainController?action=MoveToCheckoutPage">Check Out</a></li>
                                            <li><a href="MainController?action=MoveToUserPage">Shop</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="#">Contact</a></li>
                                    <li><a href="#">About</a></li>
                                    <%
                                        String displayFullName;
                                        String nameFromEmail = (String) session.getAttribute("NAME_FROM_EMAIL");
                                        if(nameFromEmail == null){
                                            nameFromEmail = "";
                                            displayFullName = loginUser.getFullName();
                                        }else{
                                            displayFullName = nameFromEmail;
                                        }
                                    %>
                                    <li><a href="#">Welcome <%= displayFullName %></a>
                                        <ul class="sub-menu">
                                            <li><a href="MainController?action=Logout">Logout</a></li>
                                        </ul>
                                        <a href="MainController?action=Logout"></a>
                                    </li>
                                    <li>
                                        <div class="header-icons">
                                            <a class="shopping-cart" href="MainController?action=MoveToCartPage"><i class="fas fa-shopping-cart"></i></a>
                                        </div>
                                    </li>
                                </ul>
                            </nav>
                            <a class="mobile-show search-bar-icon" href="#"><i class="fas fa-search"></i></a>
                            <div class="mobile-menu"></div>
                            <!-- menu end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end header -->

        <!-- breadcrumb-section -->
        <div class="breadcrumb-section breadcrumb-bg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2 text-center">
                        <div class="breadcrumb-text">
                            <p>Fresh and Organic</p>
                            <h1>Check Out</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end breadcrumb section -->

        <!-- check out section -->
        <div class="checkout-section mt-150 mb-150">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="checkout-accordion-wrap">
                            <div class="accordion" id="accordionExample">
                                <div class="card single-accordion">

                                    <div class="card-header" id="headingOne">
                                        <h5 class="mb-0">
                                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                Billing Address
                                            </button>
                                        </h5>
                                    </div>

                                    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                                        <form action="MainController" method="POST">
                                            <div class="card-body">
                                                <div class="billing-address-form">
                                                    <p>Name : </p>
                                                    <p><input type="text" name="userFullName" value="<%= userFullName%>" required=""></p>
                                                    <p>Email : </p>
                                                    <p><input type="email" name="userEmail" value="<%= loginUser.getEmail()%>" readonly=""></p>
                                                    <p>Address : </p>
                                                    <p><input type="text" name="userAddress" value="<%= userAddress%>" required=""></p>
                                                    <p>Phone : </p>
                                                    <p><input type="tel" name="userPhone" pattern="[0]{1}[0-9]{9}" value="0<%= loginUser.getPhone()%>" required=""></p>
                                                </div>
                                            </div>
                                            <div style="text-align: center; margin-bottom: 30px">
                                                <input type="submit" name="action" class="boxed-btn" value="Order"></input>
                                            </div>
                                        </form>
                                    </div>
                                </div>

                                <div class="card single-accordion">
                                    <div class="card-header" id="headingTwo">
                                        <h5 class="mb-0">
                                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                                Shipping Address
                                            </button>
                                        </h5>
                                    </div>
                                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shipping-address-form">
                                                <p>Your shipping address form is here.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="card single-accordion">
                                    <div class="card-header" id="headingThree">
                                        <h5 class="mb-0">
                                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                                Card Details
                                            </button>
                                        </h5>
                                    </div>
                                    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="card-details">
                                                <p>Your card details goes here.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <%
                        Cart cart = (Cart) session.getAttribute("CART");
                        double total = 0;
                    %>

                    <div class="col-lg-4">
                        <div class="order-details-wrap">
                            <table class="order-details">
                                <thead>
                                    <tr>
                                        <th>Your order Details</th>
                                        <th>Price</th>
                                    </tr>
                                </thead>
                                <tbody class="order-details-body">
                                    <tr>
                                        <td>Product</td>
                                        <td>Total</td>
                                    </tr>
                                    <%
                                        if (cart != null) {
                                            if (cart.getCart().size() > 0) {
                                                for (ProductDTO product : cart.getCart().values()) {
                                                    total += product.getPrice() * product.getQuantity();
                                    %>

                                    <tr>
                                        <td> <%= product.getProductName()%> </td>
                                        <td> <%= product.getPrice() * product.getQuantity()%> VND </td>
                                    </tr>

                                    <%
                                                }
                                            }
                                        }
                                    %>
                                </tbody>
                                <tbody class="checkout-details">
                                    <tr>
                                        <td>Subtotal</td>
                                        <td> <%= total%> VND </td>
                                    </tr>
                                    <tr>
                                        <td>Shipping</td>
                                        <td>FREE</td>
                                    </tr>
                                    <tr>
                                        <td>Total</td>
                                        <td><%= total%> VND </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end check out section -->

        <!!-- footer -->
        <div class="footer-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-box about-widget">
                            <h2 class="widget-title">About us</h2>
                            <p>Welcome to Vegetable Store</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-box get-in-touch">
                            <h2 class="widget-title">Get in Touch</h2>
                            <ul>
                                <li>120/26 duong so 59 phuong 14 quan Go Vap.</li>
                                <li>vupro123kute@gmail.com</li>
                                <li>+09 0691 8521</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-box pages">
                            <h2 class="widget-title">Pages</h2>
                            <ul>
                                <li><a href="shop.html">Home</a></li>
                                <li><a href="shop.html">Shop</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-box subscribe">
                            <h2 class="widget-title">Subscribe</h2>
                            <p>Subscribe to our mail to get the latest updates.</p>
                            <form action="index.html">
                                <input type="email" placeholder="Email">
                                <button type="submit"><i class="fas fa-paper-plane"></i></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end footer -->

        <!-- copyright -->
        <div class="copyright">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-12">
                        <p>Copyrights &copy; 2019 - <a href="https://imransdesign.com/">Imran Hossain</a>,  All Rights Reserved.<br>
                            Distributed By - <a href="https://themewagon.com/">Themewagon</a>
                        </p>
                    </div>
                    <div class="col-lg-6 text-right col-md-12">
                        <div class="social-icons">
                            <ul>
                                <li><a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fab fa-twitter"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fab fa-instagram"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fab fa-linkedin"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fab fa-dribbble"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end copyright -->

        <!-- jquery -->
        <script src="template_user/assets/js/jquery-1.11.3.min.js"></script>
        <!-- bootstrap -->
        <script src="template_user/assets/bootstrap/js/bootstrap.min.js"></script>
        <!-- count down -->
        <script src="template_user/assets/js/jquery.countdown.js"></script>
        <!-- isotope -->
        <script src="template_user/assets/js/jquery.isotope-3.0.6.min.js"></script>
        <!-- waypoints -->
        <script src="template_user/assets/js/waypoints.js"></script>
        <!-- owl carousel -->
        <script src="template_user/assets/js/owl.carousel.min.js"></script>
        <!-- magnific popup -->
        <script src="template_user/assets/js/jquery.magnific-popup.min.js"></script>
        <!-- mean menu -->
        <script src="template_user/assets/js/jquery.meanmenu.min.js"></script>
        <!-- sticker js -->
        <script src="template_user/assets/js/sticker.js"></script>
        <!-- main js -->
        <script src="template_user/assets/js/main.js"></script>

    </body>
</html>