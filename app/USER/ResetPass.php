<?php
include '../base.php';

// ----------------------------------------------------------------------------


if (is_post()) {
    $email    = req('email');
    $password = req('password');
    $confirm  = req('confirm');

    // Validate: password
    if ($password == '') {
        $_err['password'] = 'Required';
    }
    else if (strlen($password) < 5 || strlen($password) > 100) {
        $_err['password'] = 'Between 5-100 characters';
    }

    // Validate: confirm
    if ($confirm == '') {
        $_err['confirm'] = 'Required';
    }
    else if (strlen($confirm) < 5 || strlen($confirm) > 100) {
        $_err['confirm'] = 'Between 5-100 characters';
    }
    else if ($confirm != $password) {
        $_err['confirm'] = 'Not matched';
    }

    // DB operation
    if (!$_err) {
        // Use SHA1() for password hashing
        $password = SHA1($password);

        // Update the user's password based on the email (no need for token anymore)
        $stm = $_db->prepare('
            UPDATE user
            SET password = ?
            WHERE email = ?;
        ');
        $stm->execute([$password, $email]);

        temp('info', 'Your password has been successfully updated.');
        redirect('/login.php');
    }
}

// ----------------------------------------------------------------------------

$_title = 'User | Reset Password';
include '../header.php';
?>

<form method="post" class="update-container">
    <h3 class="profile-title">Reset Password</h3>
    <label class="info-title" for="password">Password</label>
        <input class="input-holder" type="password" id="password" name="password" placeholder="minimum 8 characters"
            minlength="8" required>
        <?= err('password') ?>


    <label class="info-title" for="confirm">Confirm</label>
        <input class="input-holder" type="password" id="confirm" name="confirm" placeholder="confirm password"
            minlength="8" required>
        <?= err('confirm') ?>


    <section>
        <button>Submit</button>
        <button type="reset">Reset</button>
    </section>
</form>

<?php
include '../foot.php';