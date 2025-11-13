<?php
require '../base.php';

// Check if the form was submitted via POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get form data
    $product_id = req('product_id');
    $rating = req('rating');
    $review_text = req('review_text');
    $user_id = $_user->id;  // Assuming you're storing the logged-in user's ID in $_user
    $image = null;

    // Handle image upload (optional)
    if (isset($_FILES['image']) && $_FILES['image']['error'] == 0) {
        $image_name = $_FILES['image']['name'];
        $image_tmp = $_FILES['image']['tmp_name'];
        $image_path = '/USER/review_images/' . $image_name;

        // Move the image to the appropriate directory
        move_uploaded_file($image_tmp, $_SERVER['DOCUMENT_ROOT'] . $image_path);
        $image = $image_name; // Save the image path
    }

    // Insert review into the database
    $stm = $_db->prepare("INSERT INTO review (product_id, user_id, rating, review_text, image) 
    VALUES (?, ?, ?, ?, ?)");
$stm->execute([$product_id, $user_id, $rating, $review_text, $image]);

    // Redirect back to the product detail page (or show a success message)
    redirect("/User/ProductItem/detailItem.php?id=$product_id&review_success=1");
}
?>