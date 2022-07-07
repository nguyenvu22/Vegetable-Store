<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="template_login/images/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="template_login/vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="template_login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="template_login/vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="template_login/vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="template_login/vendor/select2/select2.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="template_login/css/util.css">
        <link rel="stylesheet" type="text/css" href="template_login/css/main.css">
        <!--===============================================================================================-->
    </head>
    <body>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <div class="login100-pic js-tilt" data-tilt>
                        <img src="template_login/images/img-01.png">
                    </div>

                    <form class="login100-form" action="MainController" method="POST">
                        <span class="login100-form-title">
                            Login
                        </span>

                        <div class="wrap-input100">
                            <input class="input100" type="email" name="email" required="" placeholder="Email">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-envelope" aria-hidden="true"></i>
                            </span>
                        </div>

                        <div class="wrap-input100">
                            <input class="input100" type="password" name="password" required="" placeholder="Password">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-lock" aria-hidden="true"></i>
                            </span>
                        </div>

                        <%
                            String error = (String) request.getAttribute("ERROR");
                            if (error == null) {
                                error = "";
                            }
                        %>
                        <p style="color: red"> <%= error%> </p>

                        <div class="g-recaptcha" data-sitekey="6LepqMUeAAAAAAT0e6vWHjKI7YoI7RJnY_lljZQm"></div>

                        <div class="container-login100-form-btn">
                            <input class="login100-form-btn" type="submit" name="action" value="Login">
                        </div>

                        <div style="margin-top: 20px; text-align: center; border: 2px solid green; border-radius: 30px; padding: 5px 15px">
                            <a style="color: green" href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/Assignment/LoginGoogleController&response_type=code
                               &client_id=1057713146898-klk9m379bsk7q20hghh9ur8kl65a57vj.apps.googleusercontent.com&approval_prompt=force" class="btn-google m-b-20">
                                <img style="width: 15%" src="template_login/logingooglelogo.png">
                                Google
                            </a>
                        </div>

                        <div class="text-center p-t-136">
                            <a href="signup.jsp">
                                Create your Account
                                <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!--===============================================================================================-->	
        <script src="https://www.google.com/recaptcha/api.js">
        </script>
        <!--===============================================================================================-->	
        <script src="template_login/vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="template_login/vendor/bootstrap/js/popper.js"></script>
        <script src="template_login/vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="template_login/vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="template_login/vendor/tilt/tilt.jquery.min.js"></script>
        <!--===============================================================================================-->

    </body>
</html>