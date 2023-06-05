<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>
    <link rel="stylesheet" href="assets/css/otp.css">
    <style>
        body {
            background-image: url(assets/img/24052021_ROB_01.webp);
            background-size: cover;
            opacity: 0.95;
        }
        container {
            opacity: 0.50;
        }
    </style>
    <body>
        <div class="container" id="container">
            <div class="form-container sign-up-container">
                <form action="">
                    <h3>OTP is send to your email</h3>

                    <input name="otp" type="text" placeholder="your OTP" />
                    <button>Verify</button>
                </form>
            </div>
            <div class="form-container sign-in-container">
                <!-- <form action="#">
                        <h1>Sign in</h1>
                        
                        <span>or use your account</span>
                        <input type="email" placeholder="Email" />
                        <input type="password" placeholder="Password" />
                        <a href="#">Forgot your password?</a>
                        <button>Sign In</button>
                </form> -->
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">

                        <button class="ghost" id="signIn">Sign In</button>
                    </div>
                    <div class="overlay-panel overlay-right">
                        <h1></h1>
                        <p>    </p>
                        <button hidden="hidden" id="signUp"></button>
                    </div>
                </div>
            </div>
        </div>

        <footer>
            <p>
                Created by Tungtran
            </p>
        </footer>
    </body>
    <script src="assets/js/otp.js"></script>

</html>