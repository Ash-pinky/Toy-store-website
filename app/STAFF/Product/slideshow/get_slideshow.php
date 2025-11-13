<?php
require '../../../base.php';

$sql = "SELECT p.id, p.image, p.name 
        FROM product p
        JOIN slideshow s ON p.id = s.product_id";

$stm = $_db->query($sql);
$products = $stm->fetchAll(PDO::FETCH_ASSOC);

header('Content-Type: application/json');
echo json_encode($products);
?>