<?php
include '../../base.php';

// ----------------------------------------------------------------------------
// (1) Authorization (Admin)
auth('Admin');

// (2) If form submitted, update order status
if (is_post()) {
    $id = req('id');
    $status = req('status');

    $stm = $_db->prepare('
        UPDATE `order`
        SET status = ?
        WHERE id = ?
    ');
    $stm->execute([$status, $id]);

    temp('success', 'Order status updated successfully!');
    redirect('orderlisting.php'); // redirect back
}

// (2) Get all orders (descending)
$stm = $_db->prepare('
    SELECT o.*, CONCAT(u.firstname, \' \', u.lastname) AS user_name 
    FROM `order` o
    JOIN `user` u ON o.user_id = u.id
    ORDER BY o.id DESC
');
$stm->execute();
$arr = $stm->fetchAll();

// ----------------------------------------------------------------------------

$_title = 'Orders | Admin';
include '../../header.php';
?>

<div class="OrderList">Order Management</div>

<p>
    <button data-post="resetAdmin.php" data-confirm>Reset All Orders</button>
</p>

<p><?= count($arr) ?> order(s) total</p>

<table class="table-order-admin">
    <thead>
        <tr>
            <th>Order ID</th>
            <th>Date/Time</th>
            <th>Customer</th>
            <th>Items</th>
            <th>Total (RM)</th>
            <th>Photo</th>
            <th>Status</th>
            
        </tr>
    </thead>
    <tbody>
        <?php foreach ($arr as $o): ?>
        <tr>
            <td><?= $o->id ?></td>
            <td><?= $o->datetime ?></td>
            <td><?= htmlspecialchars($o->user_name) ?></td>
            <td><?= $o->count ?></td>
            <td><?= number_format($o->total, 2) ?></td>
            <td>
                
                <!-- Product photos preview -->
                <?php
                    $stm = $_db->prepare('
                        SELECT p.image
                        FROM item AS i, product AS p
                        WHERE i.product_id = p.id
                        AND i.order_id = ?
                    ');
                    $stm->execute([$o->id]);
                    $photos = $stm->fetchAll(PDO::FETCH_COLUMN);
                    foreach ($photos as $photo) {
                        echo "<img src='../Product/imgProduct/$photo' class='popup'>";
                    }
                ?>
            </td>
            <td><?= $o->status ?></td>
        <td>
            <form method="post" style="display:inline-flex; gap:5px;">
                <input type="hidden" name="id" value="<?= $o->id ?>">
                <select name="status" required>
                    <option value="Pending" <?= $o->status == 'Pending' ? 'selected' : '' ?>>Pending</option>
                    <option value="Processing" <?= $o->status == 'Processing' ? 'selected' : '' ?>>Processing</option>
                    <option value="Shipped" <?= $o->status == 'Shipped' ? 'selected' : '' ?>>Shipped</option>
                    <option value="Delivered" <?= $o->status == 'Delivered' ? 'selected' : '' ?>>Delivered</option>
                    <option value="Cancelled" <?= $o->status == 'Cancelled' ? 'selected' : '' ?>>Cancelled</option>
                </select>
                <button>Update</button>
            </form>
        </td>
        </tr>
        <?php endforeach ?>
    </tbody>
</table>



<?php
include '../../foot.php';