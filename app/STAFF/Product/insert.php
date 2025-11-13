<?php
require '../../base.php';
// ----------------------------------------------------------------------------

if (is_post()) {
    // Input
    
    $id            = req('id');
    $name          = req('name');
    $price         = req('price');
    $description   = req('description');
    $categories_id = req('categories_id');
    $f             = get_file('image');
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


    
// Validate id
if ($id == '') {
    $_err['id'] = 'Required';
} 
else if (!preg_match('/^[PHMS]\d{4,}$/', $id)) { 
    $_err['id'] = 'Invalid format';  // Adjust regex if needed
} 
else if (!is_unique($id, 'product', 'id')) { 
    $_err['id'] = 'Duplicated'; 
}

    // Validate name
    if ($name == '') {
        $_err['name'] = 'Required';
    }
    else if (strlen($name) > 100) {
        $_err['name'] = 'Maximum length 100';
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
} elseif (strlen($description) > 1000) {
    $_err['description'] = 'Maximum length is 1000 characters';
}


     // Validate categories_id
     if ($categories_id == '') {
        $_err['categories_id'] = 'Required';
    }
    else if (!array_key_exists($categories_id, $_categories)) {
        $_err['categories_id'] = 'Invalid value';
    }

    // Output
    if (!$_err) {
        $image = save_photo($f, 'imgProduct'); // Save only the filename

        $stm = $_db->prepare('INSERT INTO `product` (`image`, `id`, `name`, `price`, `description`, `categories_id`) VALUES (?,?,?,?,?,?)');
        $stm->execute([$image,$id,$name,$price,$description,$categories_id]);

        temp('info','Record inserted');
        redirect('list.php');
    }
}

// ----------------------------------------------------------------------------
$_title = 'Insert';
include '../../header.php';
?>


<form method="post" class="form" enctype = "multipart/form-data">
<label for="image">Image</label>
    <label class="upload">
        <?= html_file('image','image/*') ?>
        <img src="/images/photo.jpg">
    </label>
    <?= err('image') ?>

    <label for="id">Product ID</label>
    <?= html_text('id', 'maxlength="10"') ?>
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