<?php
include '../base.php';
$isGuest = !$_user;

if ($isGuest) {
    $_title = 'Wishlist';
    include '../header.php';
    ?>

<script>
    const isGuest = <?= json_encode($isGuest) ?>;
    if (isGuest) {
        showLoginPopup();
    }
</script>

    <?php
    include '../foot.php';
    return;
}


// Handle clear action
if (is_post() && req('btn') === 'clear') {
    $_SESSION['wishlist'] = [];
    redirect('wishlist.php');
}

// ----------------------------------------------------------------------------
$_title = 'Wishlist';
include '../header.php';
?>


<!-- Your existing styles -->

<div class="wishlist-header">❤️ Wishlist ❤️</div>
<div class="wishlist-container">
    <?php if (!empty($_SESSION['wishlist'])): ?>
        <table class="wishlist">
            <tr>
                <th>Photo</th>
                <th>Name</th>
                <th>Price (RM)</th>
                <th>Action</th>
            </tr>

            <?php
            $placeholders = implode(',', array_fill(0, count($_SESSION['wishlist']), '?'));
            $stm = $_db->prepare("SELECT * FROM product WHERE id IN ($placeholders)");
            $stm->execute(array_values($_SESSION['wishlist']));
            while ($p = $stm->fetch()):
            ?>
            <tr>
                <td>
                    <img src="../STAFF/Product/imgProduct/<?= $p->image ?>" alt="Product" style="width: 100px;">
                </td>
                <td><?= $p->name ?></td>
                <td><?= $p->price ?></td>
                <td>
                    <button class="wishlist-btn" data-id="<?= $p->id ?>" onclick="toggleWishlist(this)">
                        <span class="heart-icon">❤️</span> Remove
                    </button>
                </td>
            </tr>
            <?php endwhile; ?>
        </table>
        
        <form method="post" class="clear-form">
            <input type="hidden" name="btn" value="clear">
            <button type="submit">Clear Wishlist</button>
        </form>
    <?php else: ?>
        <p>Your wishlist is empty. Start adding products by clicking the ♡ icon!</p>
    <?php endif; ?>
</div>

<script>
    const isGuest = <?= json_encode($isGuest) ?>;
    if (isGuest) {
        showLoginPopup();
    }
</script>

<?php include '../foot.php'; ?>