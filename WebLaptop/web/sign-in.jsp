<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>
    <link href="assets/css/sign-in.css" rel="stylesheet" type="text/css" media="all">
    <!--<style>
        body{
            background-image: url(assets/img/24052021_ROB_01.webp);
        }
    </style>-->
    <body>
        <form>
            <h3>Sign in</h3>

            <label for="username">Username</label>
            <input type="email" placeholder="Email" id="username" required="">

            <label for="password">Password</label>
            <input type="password" placeholder="Password" id="password" required="">

            <button>SIGN IN</button>
            <div class="social">
                <div class="go"><i class="fab fa-google"></i> Google</div>
                <div class="fb"><i class="fab fa-facebook"></i> Facebook</div>
            </div>
            <!-- <div class="form-check form-switch d-flex align-items-center mb-3"> -->
            <input class="form-check-input" name="isRemeberMe" type="checkbox" id="rememberMe" checked>
            <label class="form-check-label" for="rememberMe">Remember me</label>
        </div>
    </form>
</body>

</html>
