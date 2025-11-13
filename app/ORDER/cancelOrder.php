<?php
include '../base.php';

// ----------------------------------------------------------------------------

// (1) Authorization (member)
auth('Member');

// (2) Get order id and validate
$id = req('id');
$stm = $_db->prepare('
    SELECT * FROM `order`
    WHERE id = ? AND user_id = ?
');
$stm->execute([$id, $_user->id]);
$o = $stm->fetch();
if (!$o) redirect('history.php');

// (3) Only allow cancel if not already cancelled or delivered
if ($o->status != 'Cancelled' && $o->status != 'Delivered') {
    $stm = $_db->prepare('UPDATE `order` SET status = "Cancelled" WHERE id = ?');
    $stm->execute([$id]);
    temp('info', 'Order cancelled successfully');
}

// (4) Redirect back to order status page
redirect("orderStatus.php?id=$id");

// ----------------------------------------------------------------------------
?>
