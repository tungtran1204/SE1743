<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>
    <link href="assets/css/sign-in.css?v=3" rel="stylesheet" type="text/css" media="all">
    <style>
        .btn-check{
            size: 0.5rem;
            width: 50%;
            margin: auto;
        }
        .fab {
            text-decoration: none;
        }
    </style>
    <body>
        <form action="sign-in" method="post">
            <h3>Sign in</h3>
            <div style="color: red">
                ${requestScope.msg}
            </div>
            <label for="username">Username</label>
            <input type="email" placeholder="Email" name="username" required="">

            <label for="password">Password</label>
            <input type="password" placeholder="Password" name="password" required="">

            <button type="submit">SIGN IN</button>
            <div class="social">
                <a href="sign-up"><i class="fab fa-google" style="margin: 20px; text-decoration: none"></i> Sign Up</a>
                <a href="http://localhost:9999/WebLaptop/"><i class="fab" style="margin: 50px; text-decoration: none"></i> Home</a>
            </div>
            <!-- <div class="form-check form-switch d-flex align-items-center mb-3"> -->
            <div style="display: flex; align-items: center;">
            <input class=" btn-check" name="isRemeberMe" type="checkbox" id="rememberMe" style="transform: scale(0.5);margin: 0px;" checked>
            <label class="form-check-label" for="rememberMe" style="font-weight: normal; align-items: center">Remember me</label>
            </div>
        </div>
    </form>
</body>

</html>
