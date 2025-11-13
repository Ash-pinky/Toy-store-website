<?php
include '../base.php';

// ----------------------------------------------------------------------------

// Authenticated users
auth();

if (is_post()) {
    $password     = req('password');
    $new_password = req('new_password');
    $confirm      = req('confirm');

    // Validate: password
    if ($password == '') {
        $_err['password'] = 'Required';
    }
    else if (strlen($password) < 5 || strlen($password) > 100) {
        $_err['password'] = 'Between 5-100 characters';
    }
    else {
        $stm = $_db->prepare('
            SELECT COUNT(*) FROM user
            WHERE password = SHA1(?) AND id = ?
        ');
        $stm->execute([$password,$_user->id]);
        
        if ($stm->fetchColumn() == 0) {
            $_err['password'] = 'Not matched';
        }
    }

    // Validate: new_password
    if ($new_password == '') {
        $_err['new_password'] = 'Required';
    }
    else if (strlen($new_password) < 5 || strlen($new_password) > 100) {
        $_err['new_password'] = 'Between 5-100 characters';
    }

    // Validate: confirm
    if (!$confirm) {
        $_err['confirm'] = 'Required';
    }
    else if (strlen($confirm) < 5 || strlen($confirm) > 100) {
        $_err['confirm'] = 'Between 5-100 characters';
    }
    else if ($confirm != $new_password) {
        $_err['confirm'] = 'Not matched';
    }

    // DB operation
    if (!$_err) {

        // Update user (password)
        $stm = $_db->prepare('
            UPDATE user
            SET password = SHA1(?)
            WHERE id = ?
        ');
        $stm->execute([$new_password,$_user->id]);

        temp('info', 'Record updated');
        redirect('/');
    }
}

// ----------------------------------------------------------------------------

$_title = 'User | Password';
include '../header.php';
?>

<form method="post" class="update-container">
        <h3 class="profile-title">Password Updated</h3>
        <label class="info-title" for="password">Password</label>
        <input class="input-holder" type="password" id="password" name="password" placeholder="minimum 8 characters"
            minlength="8" required>
        <?= err('password') ?>

        <label class="info-title" for="new_password">New Password</label>
        <input class="input-holder" type="password" id="new_password" name="new_password" placeholder="minimum 8 characters"
            minlength="8" required>
        <?= err('new_password') ?>

        <label class="info-title" for="confirm">Confirm</label>
        <input class="input-holder" type="password" id="confirm" name="confirm" placeholder="confirm password"
            minlength="8" required>
        <?= err('confirm') ?>

    <section>
        <button class="submit-button">Submit</button>
        <button class="reset-button" type="reset">Reset</button>
    </section>
</form>

<?php
include '../foot.php';