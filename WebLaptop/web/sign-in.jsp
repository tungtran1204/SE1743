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
                <div class="go"><i class="fab fa-google"></i> Google</div>
                <div class="fb"><i class="fab fa-facebook"></i> Facebook</div>
            </div>
            <!-- <div class="form-check form-switch d-flex align-items-center mb-3"> -->
            <input class=" btn-check" name="isRemeberMe" type="checkbox" id="rememberMe" style="transform: scale(0.5);" checked>
            <label class="form-check-label" for="rememberMe">Remember me</label>
        </div>
    </form>
</body>

</html>
