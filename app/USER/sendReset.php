<?php
include '../base.php';

if (is_post()) {
    $email = req('email');

    // Validate: email
    if ($email == '') {
        $_err['email'] = 'Required';
    }
    else if (!is_email($email)) {
        $_err['email'] = 'Invalid email';
    }
    else if (!is_exists($email, 'user', 'email')) {
        $_err['email'] = 'Not exists';
    }

    if (!$_err) {
        $stm = $_db->prepare('SELECT * FROM user WHERE email=?');
        $stm->execute([$email]);
        $u = $stm->fetch();

        $url = base("USER/ResetPass.php?email=$email");

        $m = get_mail();
        $m->addAddress($u->email,$u->firstname);
        $m->addEmbeddedImage("../MEMBER/imageMember/$u->photo",'photo');
        $m->isHTML(true);
        $m->Subject = 'Reset Password';
        $m->Body = "
            <img src='cid:photo'
                 style='width: 200px; height: 200px;
                        border: 1px solid #333'>
            <p>Dear $u->name,<p>
            <h1 style='color: red'>Reset Password</h1>
            <p>
                Please click <a href='$url'>here</a>
                to reset your password.
            </p>
            <p>From, 😺 Admin</p>
        ";

        $m->send();

        temp('info', 'Email sent');
        redirect('/');
    }
}

// ----------------------------------------------------------------------------

$_title = 'Reset Password';
include '../header.php';
?>

<form method = "post" class="login-container">
        <h1 class="login-title">Reset Password</h1>
        <label class="info-title" for="email">EMAIL</label>
        <input class="input-holder" type="email" id="email" name="email" placeholder="example@gmail.com">
        <?= err('email') ?>

        <button class="signin-button">SEND</button>


    </form>

<?php
include '../foot.php';