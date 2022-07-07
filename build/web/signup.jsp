<%-- 
    Document   : signup
    Created on : Mar 12, 2022, 1:22:52 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up Page</title>
    </head>
    <body style="background-color: #9fcdff">
        <div style="border: 3px solid black; border-radius: 20px; margin: 10px 30%; padding: 0px 50px; background-color: white">
            <h1 style="color: #3bbcf5; text-align: center; margin-bottom: 20px">SIGN UP</h1>
            <form action="MainController" method="POST">
                <div>
                    <p style="font-weight: 600; font-size: 20px">Email : </p>
                    <input style="width: 100%; padding: 10px; border-radius: 8px" type="email" name="signupEmail" required="">
                    <p style="color: red">${requestScope.SIGNUP_ERROR}</p>
                </div>
                <div>
                    <p style="font-weight: 600; font-size: 20px">Full Name : </p>
                    <input style="width: 100%; padding: 10px; border-radius: 8px" type="text" pattern="[a-zA-Z]{0,25}" minlength="2" name="signupFullName" required="">
                </div>
                <div>
                    <p style="font-weight: 600; font-size: 20px">Password : </p>
                    <input style="width: 100%; padding: 10px; border-radius: 8px" type="password" name="signupPassword" required="">
                </div>
                <div>
                    <p style="font-weight: 600; font-size: 20px">Address : </p>
                    <input style="width: 100%; padding: 10px; border-radius: 8px" type="text" name="signupAddress" required="">
                </div>            <div>
                    <p style="font-weight: 600; font-size: 20px">Birthday : </p>

                    <input style="width: 100%; padding: 10px; border-radius: 8px" type="date" name="signupBirthday" >
                </div>
                <div>
                    <p style="font-weight: 600; font-size: 20px">Phone : </p>
                    <input style="width: 100%; padding: 10px; border-radius: 8px" type="tel" pattern="[0]{1}[0-9]{9}" name="signupPhone">
                </div>
                <div>
                    <input style="margin: 25px 0; padding: 15px 25px; border-radius: 10px; background-color: #3bbcf5; color: white; border: 0; font-size: 17px" type="submit" name="action" value="Signup">
                </div>
            </form>
        </div>
    </body>
</html>
