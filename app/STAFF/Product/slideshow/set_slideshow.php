<?php
require '../../../base.php';

if (isset($_POST['product_id'])) {
    $productId = $_POST['product_id'];

    $imgQuery = $_db->prepare("SELECT image FROM product WHERE id = :id");
    $imgQuery->bindParam(':id', $productId, PDO::PARAM_STR);
    $imgQuery->execute();
    $product = $imgQuery->fetch(PDO::FETCH_ASSOC);

    if (!$product) {
        header("Location: ../list.php?error=Product not found");
        exit;
    }

    $sqlCheck = "SELECT COUNT(*) FROM slideshow WHERE product_id = :product_id";
    $check = $_db->prepare($sqlCheck);
    $check->bindParam(':product_id', $productId, PDO::PARAM_STR);
    $check->execute();

    if ($check->fetchColumn() > 0) {
        header("Location: ../list.php?error=Product is already in slideshow");
        exit;
    }

    $productImage = $product['image'];

    $sql = "INSERT INTO slideshow (product_id, image) VALUES (:product_id, :image)";
    try {
        $stm = $_db->prepare($sql);
        $stm->bindParam(':product_id', $productId, PDO::PARAM_STR);
        $stm->bindParam(':image', $productImage, PDO::PARAM_STR);
        $stm->execute();

        header("Location: ../list.php?message=Product added to slideshow successfully");
        exit;
    } catch (PDOException $e) {
        error_log($e->getMessage());
        header("Location: ../list.php?error=An error occurred while adding to slideshow");
        exit;
    }
} else {
    header("Location: ../list.php?error=No product ID provided");
    exit;
}
?>