<?php
require '../../../base.php';

if (isset($_POST['product_id'])) {
    $productId = $_POST['product_id'];

    $sql = "DELETE FROM slideshow WHERE product_id = ?";
    $stm = $_db->prepare($sql);

    if ($stm->execute([$productId])) {
        header('Location: ../list.php?message=Product successfully removed from slideshow.');
        exit;
    } else {
        echo "Error: Unable to remove the product from the slideshow.";
    }
} else {
    header('Location: ../list.php?error=No product specified.');
    exit;
}
?>