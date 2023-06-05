<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>
    <link href="css/signUp.css" rel="stylesheet" type="text/css" media="all">

    <body>
        <form>
            <br><br>
            <h2>SIGN UP</h2>
            <br>
            <p>Enter your email to get OTP</p>
            <br>
            <form action="sign-up" method="post">
                <input type="email" placeholder="Email" id="username">
                <div style="color: red">
                    ${requestScope.msg}
                </div>
                <button type="submit">Continue</button>
            </form>

            <div class="social">
                <div class="go"><i class="fab fa-google"></i> Google</div>
                <div class="fb"><i class="fab fa-facebook"></i> Facebook</div>
            </div>
        </form>
    </body>

</html>
</body>

</html>