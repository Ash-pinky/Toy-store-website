<?php
require '../../base.php';

// ----------------------------------------------------------------------------
// Handle GET request - Load existing PRODUCT record
if (is_get()) {
    $id = req('id');

    $stm = $_db->prepare('SELECT * FROM product WHERE id = ?');
    $stm->execute([$id]);
    $s = $stm->fetch();

    if (!$s) {
        redirect('/');
    }

    extract((array)$s);
    $_SESSION['image']=$s->image;
}

// ----------------------------------------------------------------------------
// Handle POST request - Update PRODUCT record
if (is_post()) {
    // Input
    $id            = req('id'); 
    $name          = req('name');
    $price         = req('price');
    $description   = req('description');
    $categories_id = req('categories_id');
    $f             = get_file('image');
    $image         = $_SESSION['image'];

     // Validate image (if uploaded)
     if ($f) {
        if (!str_starts_with($f->type, 'image/')) {
            $_err['image'] = 'Must be an image';
        } elseif ($f->size > 1 * 1024 * 1024) {
            $_err['image'] = 'Maximum 1MB';
        }
    }
  // Validate: photo (file)
if (!$f) {
    $_err['image'] = 'Required';
}
else if (!str_starts_with($f->type, 'image/')) {
    $_err['image'] = 'Must be image';
}
else if ($f->size > 1 * 1024 * 1024) {
    $_err['image'] = 'Maximum 1MB';
}

    
    // Validate name
    if ($name == '') {
        $_err['name'] = 'Required';
    } elseif (strlen($name) > 100) {
        $_err['name'] = 'Maximum length 100 characters';
    }

    // Validate price
    if ($price == '') {
        $_err['price'] = 'Required';
    } elseif (!is_numeric($price) || $price < 0) {
        $_err['price'] = 'Invalid price';
    }
    
    // Validate description
    if ($description == '') {
        $_err['description'] = 'Required';
    } elseif (strlen($description) > 1000) { // Fixed incorrect variable
        $_err['description'] = 'Maximum length 1000 characters';
    }

    // Validate categories_id
    if ($categories_id == '') {
        $_err['categories_id'] = 'Required';
    } elseif (!array_key_exists($categories_id, $_categories)) {
        $_err['categories_id'] = 'Invalid value';
    }

    // DB operation
    if (!$_err) {
        if ($f) { // Only process new image if one is uploaded
            if (!empty($image) && file_exists("imgProduct/$image")) {
                unlink("imgProduct/$image"); // Delete old image
            }
            $image = save_photo($f, 'imgProduct/');
            $_SESSION['image'] = $image; // Ensure session stores the latest image
        } else {
            $image = $_SESSION['image']; // Retain old image if no new one
        }
    }

        $stm = $_db->prepare('
            UPDATE product
            SET image = ?, name = ?, price = ?, description = ?, categories_id = ? 
            WHERE id = ?
        ');
        $stm->execute([$image, $name, $price, $description, $categories_id, $id]);

        temp('info', 'Record updated');
        redirect('list.php');
    }


// ----------------------------------------------------------------------------
// Set page title
$_title = 'Update';
include '../../header.php';
?>

<form method="post" class="form" enctype="multipart/form-data" novalidate>
<label for="image">Photo</label>
    <label class="upload" tabindex="0">
        <?= html_file('image', 'image/*', 'hidden') ?>
        <?php if (!empty($image)) : ?>
            <img src= "imgProduct/<?=htmlspecialchars($image) ?>" style="max-width: 200px; height: auto;">
        <?php else : ?>
            <p>No image available</p>
        <?php endif; ?>
    </label>
    <?= err('image') ?>

    <label for="id">Id</label>
    <b><?= $id ?></b>
    <input type="hidden" name="id" value="<?= $id ?>"> <!-- Added hidden ID input -->
    <?= err('id') ?>

    <label for="name">Name</label>
    <?= html_text('name', 'maxlength="100"') ?>
    <?= err('name') ?>

    <label for="price">Price</label>
    <?= html_text('price', 'maxlength="10" data-numeric') ?>
    <?= err('price') ?>

    <label for="description">Description</label>
    <?= html_text('description', 'maxlength="1000"') ?>
    <?= err('description') ?>

    <label for="categories_id">Categories ID</label>
    <?= html_select('categories_id', $_categories) ?>
    <?= err('categories_id') ?>

    <section>
        <button>Submit</button>
        <button type="reset">Reset</button>
    </section>
</form>

<?php

include '../../foot.php';
?>
