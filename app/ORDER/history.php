<?php
include '../base.php';

// ----------------------------------------------------------------------------

// (1) Authorization (member)
auth('Member');

// (2) Return orders belong to the user (descending)
$stm = $_db->prepare('
    SELECT * FROM `order`
    WHERE user_id = ?
    ORDER BY id DESC
');
$stm->execute([$_user->id]);
$arr = $stm->fetchAll();

// ----------------------------------------------------------------------------

$_title = 'Order | History';
include '../header.php';
?>

<p>
    <button data-post="reset.php" data-confirm>Reset</button>
</p>

<p><?= count($arr) ?> record(s)</p>

<table class="table-order-history">
    <tr>
        <th>Id</th>
        <th>Datetime</th>
        <th>Count</th>
        <th>Total (RM)</th>
        <th>Image</th>
        <th>Status</th>

    </tr>

    <?php foreach ($arr as $o): ?>
    <tr>
        <td><?= $o->id ?></td>
        <td><?= $o->datetime ?></td>
        <td><?= $o->count ?></td>
        <td><?= $o->total ?></td>
        <td>
            <button data-get="orderdetail.php?id=<?= $o->id ?>">Detail</button>
            <!-- (A) EXTRA: Product photos -->
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
            echo "<img src='../STAFF/Product/imgProduct/$photo' class='popup''>";
        }
    ?>
        </td>
        <td><button data-get="orderStatus.php?id=<?= $o->id ?>">Check Status</button></td>
    </tr>
    <?php endforeach ?>
</table>

<?php
include '../foot.php';