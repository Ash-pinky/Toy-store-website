<?php
require '../base.php';

if (!$_user) {
    header('Content-Type: application/json');
    echo json_encode(['status' => 'error', 'message' => 'Please login first']);
    exit;
}

$action = req('action');
$productId = req('id');

if ($action === 'add') {
    if (!in_array($productId, $_SESSION['wishlist'])) {
        $_SESSION['wishlist'][] = $productId;
    }
} elseif ($action === 'remove') {
    $_SESSION['wishlist'] = array_diff($_SESSION['wishlist'], [$productId]);
}

header('Content-Type: application/json');
echo json_encode(['status' => 'success', 'count' => count($_SESSION['wishlist'])]);