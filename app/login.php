<?php
include 'base.php';

// ----------------------------------------------------------------------------

if (is_post()) {
    $email    = req('email');
    $password = req('password');

    // Validate: email
    if ($email == '') {
        $_err['email'] = 'Required';
    }
    else if (!is_email($email)) {
        $_err['email'] = 'Invalid email';
    }

    // Validate: password
    if ($password == '') {
        $_err['password'] = 'Required';
    }

    // Login user
    if (!$_err) {
        $stm = $_db->prepare('
            SELECT * FROM user
            WHERE email = ? AND password = SHA1(?)
        ');
        $stm->execute([$email,$password]);
        $u = $stm->fetch();

        if ($u) {
            temp('info', 'Login successfully');
            login($u);
        }
        else {
            $_err['password'] = 'Not matched';
        }
    }
}

$_title = 'Login';
include 'header.php';
?>

<form method = "post" class="login-container">
        <h1 class="login-title">Login</h1>
        <label class="info-title" for="email">EMAIL</label>
        <input class="input-holder" type="email" id="email" name="email" placeholder="example@gmail.com">
        <?= err('email') ?>

        <label class="info-title" for="password">PASSWORD</label>
        <input class="input-holder" type="password" id="password" name="password" placeholder="minimum 8 characters" minlength="8">
        <a href="USER/sendReset.php" class="forget-password"><small>Forgot password?</small></a>
        <?= err('password') ?>


        <button class="signin-button">SIGN IN</button>
        <div class="create-title">
            <a href="USER/register.php">
                Create Account
            </a>
        </div>


    </form>

<?php
include 'foot.php';