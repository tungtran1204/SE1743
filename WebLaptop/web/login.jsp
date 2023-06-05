<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="assets/css/styles.css">
    </head>
    <style>
        body {
            background-image: url(assets/img/24052021_ROB_01.webp);
            background-size: cover;
            opacity: 0.95;
        }
    </style>
    <body>
        <div class="container" id="container">
            <div class="form-container sign-up-container">
                <form action="sign-up" method="post">
                    <br>
                    <br>
                    <br><br>
                    <span>Your email:</span>
                    <input name="email" type="email" placeholder="Email" required=""/>
                    <div style="color: red">
                        ${requestScope.msg}
                    </div>
                    <br>
                    <button type="submit" >Get OTP</button>
                    <br>
                    <br>
                </form>
            </div>
            <div class="form-container sign-in-container">
                <form action="login" method="post">
                    <h1>Sign in</h1>

                    <span>or use your account</span>
                    <input name="username" type="email" placeholder="Email" />
                    <input name="password" type="password" placeholder="Password" />
                    <a href="#">Forgot your password?</a>
                    <button type="submit">Sign In</button>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <h1>Welcome Back!</h1>
                        <p>To keep connected with us please login with your personal info</p>
                        <button class="ghost" id="signIn">Sign In</button>
                    </div>
                    <div class="overlay-panel overlay-right">
                        <h1>Hello, Friend!</h1>
                        <p>Enter your personal details and start journey with us</p>
                        <button class="ghost" id="signUp">Sign Up</button>
                    </div>
                </div>
            </div>
        </div>

        <footer>
            <p>
                Created by Tungtran
                <!--		<a target="_blank" href="https://florin-pop.com">Florin Pop</a>
                                - Read how I created this and how you can join the challenge
                                <a target="_blank" href="https://www.florin-pop.com/blog/2019/03/double-slider-sign-in-up-form/">here</a>.-->
            </p>
        </footer>
        <script src="assets/js/myscripts.js"></script>
    </body>
</html>