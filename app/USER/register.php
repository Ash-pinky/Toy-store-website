<?php
include '../base.php';

// ----------------------------------------------------------------------------

if (is_post()) {
    $firstname = req('firstname');
    $lastname = req('lastname');
    $email    = req('email');
    $password = req('password');
    $confirm  = req('confirm');
    $phone     = req('phone');
    $f         = get_file('photo');

    // Validate: name
    if (!$firstname) {
        $_err['firstname'] = 'Required';
    }
    else if (strlen($firstname) > 100) {
        $_err['firstname'] = 'Maximum 100 characters';
    }

    // Validate: name
    if (!$lastname) {
        $_err['lastname'] = 'Required';
    }
    else if (strlen($lastname) > 100) {
        $_err['lastname'] = 'Maximum 100 characters';
    }

    // Validate: email
    if (!$email) {
        $_err['email'] = 'Required';
    }
    else if (strlen($email) > 100) {
        $_err['email'] = 'Maximum 100 characters';
    }
    else if (!is_email($email)) {
        $_err['email'] = 'Invalid email';
    }
    else if (!is_unique($email, 'user', 'email')) {
        $_err['email'] = 'Duplicated';
    }

    // Validate: password
    if (!$password) {
        $_err['password'] = 'Required';
    }
    else if (strlen($password) < 5 || strlen($password) > 100) {
        $_err['password'] = 'Between 5-100 characters';
    }

    // Validate: confirm
    if (!$confirm) {
        $_err['confirm'] = 'Required';
    }
    else if (strlen($confirm) < 5 || strlen($confirm) > 100) {
        $_err['confirm'] = 'Between 5-100 characters';
    }
    else if ($confirm != $password) {
        $_err['confirm'] = 'Not matched';
    }

 // Validate: phone
    if (!$phone) {
    $_err['phone'] = 'Required';
    }
    else if (!preg_match('/^01\d{8,9}$/', $phone)) {
    $_err['phone'] = 'Phone number must be 10 or 11 digits and start with 01';
    }

     // Validate image (if uploaded)
     if ($f) {
        if (!str_starts_with($f->type, 'image/')) {
            $_err['photo'] = 'Must be an image';
        } elseif ($f->size > 1 * 1024 * 1024) {
            $_err['photo'] = 'Maximum 1MB';
        }
    }

    // Validate: photo (file)
    if (!$f) {
        $_err['photo'] = 'Required';
    }
    else if (!str_starts_with($f->type, 'image/')) {
        $_err['photo'] = 'Must be image';
    }
    else if ($f->size > 1 * 1024 * 1024) {
        $_err['photo'] = 'Maximum 1MB';
    }

    // DB operation
    if (!$_err) {

        // (1) Save photo
        $photo = save_photo($f, '../MEMBER/imageMember');
        
        // (2) Insert user (member)
        $stm = $_db->prepare('
            INSERT INTO user (firstname,lastname,email, password, phone, photo, role)
            VALUES (?,?,?, SHA1(?), ?, ?, "Member")
        ');
        $stm->execute([$firstname,$lastname,$email,$password,$phone,$photo]);

        temp('info', 'Record inserted');
        redirect('/login.php');
    }
}

// ----------------------------------------------------------------------------

$_title = 'User | Register Member';
include '../header.php';
?>
<form method="post" class="account-container" enctype="multipart/form-data">
        <h1 class="account-title">Create Account</h1>

        <label class="info-title" for="firstname">First Name</label>
        <input class="input-holder" type="text" id="firstname" name="firstname" required>
        <?= err('firstname') ?>

        <label class="info-title" for="lastname">Last Name</label>
        <input class="input-holder" type="text" id="lastname" name="lastname" required>
        <?= err('lastname') ?>

        <label class="info-title" for="email">Email</label>
        <input class="input-holder" type="email" id="email" name="email" placeholder="example@gmail.com" required>
        <?= err('email') ?>

        <label class="info-title" for="password">Password</label>
        <input class="input-holder" type="password" id="password" name="password" placeholder="minimum 8 characters"
            minlength="8" required>
        <?= err('password') ?>

        <label class="info-title" for="confirm">Confirm</label>
        <input class="input-holder" type="password" id="confirm" name="confirm" placeholder="confirm password"
            minlength="8" required>
        <?= err('confirm') ?>

        <label class="info-title" for="phone">Phone Number</label>
        <input class="input-holder" type="tel" id="phone" name="phone" placeholder="Enter your phone number" pattern="[0-9]{10,11}" required>
        <small>Format: 10 or 11 digits (e.g., 0123456789 or 01123456789)</small>
        <?= err('phone') ?>

        <label class="info-title" for="photo">Photo</label>
        <label class="upload" tabindex="0">
        <?= html_file('photo', 'image/*', 'hidden') ?>
        <img src="/images/photo.jpg" style='width:200px; height:auto;'>
        </label>
        <?= err('photo') ?>

        <button class="create-button">CREATE</button>
</form>

<?php
include '../foot.php';