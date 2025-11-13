<?php
include '../base.php';

// ----------------------------------------------------------------------------

// (1) Authorization (member)
auth('Member');

// (2) Get order based on id and user
$id = req('id');
$stm = $_db->prepare('
    SELECT * FROM `order`
    WHERE id = ? AND user_id = ?
');
$stm->execute([$id, $_user->id]);
$o = $stm->fetch();
if (!$o) redirect('history.php');

// ----------------------------------------------------------------------------

$_title = 'Order | Status';
include '../header.php';
?>

<div class="orderstatus-title">Order Status</div>

<form class="form">
    <label>Order Id</label>
    <b><?= $o->id ?></b>
    <br>

    <label>Datetime</label>
    <div><?= $o->datetime ?></div>
    <br>

    <label>Status</label>
    <div>
        <?php
        // Display status with color
        $color = 'gray';
        if ($o->status == 'Pending') $color = 'orange';
        else if ($o->status == 'Processing') $color = 'blue';
        else if ($o->status == 'Shipped') $color = 'purple';
        else if ($o->status == 'Delivered') $color = 'green';
        else if ($o->status == 'Cancelled') $color = 'red';
        ?>
        <span style="padding:5px 10px; background:<?= $color ?>; color:white; border-radius:5px;">
            <?= $o->status ?>
        </span>

        <!-- Show cancel button only if not cancelled yet -->
        <?php if ($o->status != 'Cancelled' && $o->status != 'Delivered'): ?>
            <button id="cancelBtn" data-id="<?= $o->id ?>" style="margin-left:10px; background:red; color:white; padding:5px 10px; border:none; border-radius:5px;">
                Cancel Order
            </button>
        <?php endif; ?>
    </div>
    <br>
</form>

<p>
    <button data-get="orderdetail.php?id=<?= $o->id ?>">Back to Order Detail</button>
</p>

<?php
include '../foot.php';
?>
