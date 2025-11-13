<?php
include '../base.php';

// ----------------------------------------------------------------------------
auth();

if (is_get()) {
    $stm = $_db->prepare('SELECT * FROM user WHERE id = ?');
    $stm->execute([$_user->id]);
    $u = $stm->fetch();

    if (!$u) {
        redirect('/');
    }

    extract((array)$u);
    $_SESSION['photo'] = $u->photo;
}

if (is_post()) {
    $firstname = req('firstname');
    $lastname = req('lastname');
    $email    = req('email');
    $phone     = req('phone');
    $photo     = $_SESSION['photo'];
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
if ($email == '') {
    $_err['email'] = 'Required';
}
else if (strlen($email) > 100) {
    $_err['email'] = 'Maximum 100 characters';
}
else if (!is_email($email)) {
    $_err['email'] = 'Invalid email';
}
else {
    $stm = $_db->prepare('
        SELECT COUNT(*) FROM user
        WHERE email = ? AND id !=?
    ');
    $stm->execute([$email,$_user->id]);

    if ($stm->fetchColumn() > 0) {
        $_err['email'] = 'Duplicated';
    }
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

    // DB operation
    if (!$_err) {

            if ($f) { // Only process new image if one is uploaded
                if (!empty($iphoto) && file_exists("../MEMBER/imageMember/$photo")) {
                    unlink("../MEMBER/imageMember/$photo"); // Delete old image
                }
                $photo = save_photo($f, '../MEMBER/imageMember');
                $_SESSION['photo'] = $photo; // Ensure session stores the latest image
            } else {
                $photo = $_SESSION['photo']; // Retain old image if no new one
            }
        
        // (2) Update user (member)
        $stm = $_db->prepare('
        UPDATE user
        SET firstname = ?,lastname = ?,email = ?,phone = ?,photo=?
        WHERE id = ?
    ');
    $stm->execute([$firstname,$lastname,$email,$phone,$photo,$_user->id]);

    $_user->firstname = $firstname;
    $_user->lastname  = $lastname;
    $_user->email = $email;
    $_user->phone  = $phone;
    $_user->photo = $photo;

        temp('info', 'Record updated');
        redirect('/');
    }
}

// ----------------------------------------------------------------------------

$_title = 'Profile Updated';
include '../header.php';
?>
<form method="post" class="update-container" enctype="multipart/form-data">
    <h3 class="profile-title">Profile Update</h3>

    <label class="info-title" for="firstname">First Name</label>
    <input class="input-holder" type="text" id="firstname" name="firstname" value="<?= htmlspecialchars($firstname) ?>">
    <?= err('firstname') ?>

    <label class="info-title" for="lastname">Last Name</label>
    <input class="input-holder" type="text" id="lastname" name="lastname" value="<?= htmlspecialchars($lastname) ?>">
    <?= err('lastname') ?>

    <label class="info-title" for="email">Email</label>
    <input class="input-holder" id="email" name="email" value="<?= htmlspecialchars($email) ?>">
    <?= err('email') ?>

    <label class="info-title" for="phone">Phone Number</label>
    <input class="input-holder" id="phone" name="phone" value="<?= htmlspecialchars($phone) ?>">
    <small>Format: 10 or 11 digits (e.g., 0123456789 or 01123456789)</small>
    <?= err('phone') ?>

    <label class="info-title" for="photo">Photo</label>
    <label class="upload" tabindex="0">
        <?= html_file('photo', 'image/*', 'hidden') ?>
        <img src="../MEMBER/imageMember/<?= $photo ?>">
    </label>
    <?= err('photo') ?>

    <button class="update-button" type="submit">Update Profile</button>
</form>

<?php
include '../foot.php';