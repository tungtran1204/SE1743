<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>
    <link href="assets/css/sign-up.css?v=3" rel="stylesheet" type="text/css" media="all">

    <body>
        <form action="sign-up" method="post">
            <br><br>
            <h2>SIGN UP</h2>
            <br>
            <p>Enter your email to get OTP</p>
            <br>
            <input name="email" type="email" placeholder="Email" >
            <br>
            <div style="color: #b5bccaed">
                ${requestScope.msg}
            </div>
            <button type="submit">Continue</button>
            <div class="social">
                <a href="sign-in"><i class="fab fa-google" style="margin: 20px; text-decoration: none" ></i> Sign In</a>
                <a href="http://localhost:9999/WebLaptop/"><i class="fab fa-facebook" style="margin: 50px; text-decoration: none" ></i> Home</a>
            </div>
        </form>
    </body>

</html>