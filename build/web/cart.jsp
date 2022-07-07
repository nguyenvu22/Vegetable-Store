<%@page import="sample.users.UserDTO"%>
<%@page import="sample.products.ProductDTO"%>
<%@page import="sample.shop.Cart"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

        <!-- title -->
        <title>Cart Page</title>

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

        <!-- search area -->
        <div class="search-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <span class="close-btn"><i class="fas fa-window-close"></i></span>
                        <div class="search-bar">
                            <div class="search-bar-tablecell">
                                <h3>What are you looking for ?</h3>
                                <input style="text-align: left;" type="text" placeholder="searching">
                                <button type="submit">Search <i class="fas fa-search"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end search arewa -->

        <!-- breadcrumb-section -->
        <div class="breadcrumb-section breadcrumb-bg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2 text-center">
                        <div class="breadcrumb-text">
                            <p>Fresh and Organic</p>
                            <h1>Cart</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end breadcrumb section -->

        <!-- cart -->
        <div class="cart-section mt-150 mb-150">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-12">
                        <div class="cart-table-wrap">

                            <%
                                String quantityError = (String) request.getAttribute("QUANTITY_ERROR");
                                if (quantityError == null) {
                                    quantityError = "";
                                }
                                Cart cart = (Cart) session.getAttribute("CART");
                                double total = 0;
                                if (cart != null) {
                                    if (cart.getCart().size() > 0) {
                            %>

                            <p style="color: red; margin: 20px; font-weight: 500"> <%= quantityError%> </p>

                            <table class="cart-table">
                                <thead class="cart-table-head">
                                    <tr class="table-head-row">
                                        <th class="product-remove"><i class="fa fa-trash"></i></th>
                                        <th>No</th>
                                        <th class="product-image">Image</th>
                                        <th class="product-name">Name</th>
                                        <th class="product-price">Price</th>
                                        <th class="product-quantity">Quantity</th>
                                        <th class="product-total">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        int count = 1;
                                        for (ProductDTO product : cart.getCart().values()) {
                                            total += product.getPrice() * product.getQuantity();
                                    %>
                                <form action="MainController" method="POST">
                                    <tr class="table-body-row">
                                        <td class="product-remove"><a href="MainController?action=Remove&productID=<%= product.getProductID()%>"><i class="far fa-window-close"></i></a></td>
                                        <td> <%= count++%> </td>
                                        <td class="product-image"><img style="width: 50px; height: 50px" src="<%= product.getImage()%>" alt=""></td>
                                        <td class="product-name"> <%= product.getProductName()%> </td>
                                        <td class="product-price"> <%= product.getPrice()%> VND</td>
                                        <td class="product-quantity"><input type="number" min="1" max="100" name="productQuantity" value="<%= product.getQuantity()%>"></td>

                                    <input type="hidden" name="action" value="Put">

                                    <td class="product-total"> <%= product.getPrice() * product.getQuantity()%> </td>
                                    <input type="hidden" name="productID" value="<%= product.getProductID()%>">
                                    </tr>
                                </form>

                                <%
                                    }
                                %>
                                </tbody>
                            </table>
                            <div style="text-align: right" class="cart-buttons">
                                <a href="MainController?action=MoveToCheckoutPage" class="boxed-btn black">Check Out</a>
                            </div>
                            <%                                                    }
                                }
                            %>

                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="total-section">
                            <table class="total-table">
                                <thead class="total-table-head">
                                    <tr class="table-total-row">
                                        <th>Total</th>
                                        <th>Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="total-data">
                                        <td><strong>Subtotal: </strong></td>
                                        <td> <%= total%> VND</td>
                                    </tr>
                                    <tr class="total-data">
                                        <td><strong>Shipping: </strong></td>
                                        <td style="color: green">FREE</td>
                                    </tr>
                                    <tr class="total-data">
                                        <td><strong>Total: </strong></td>
                                        <td> <%= total%> VND</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end cart -->

        <!-- footer -->
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
                                <li><a href="user.jsp">Home</a></li>
                                <li><a href="user.jsp">Shop</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-box subscribe">
                            <h2 class="widget-title">Subscribe</h2>
                            <p>Subscribe to our mail to get the latest updates.</p>
                            <form action="index.html">
                                <input type="email" placeholder="Email" required="">
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