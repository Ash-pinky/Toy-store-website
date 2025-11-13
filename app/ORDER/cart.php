<?php
include '../base.php';

// ----------------------------------------------------------------------------

if (is_post()) {
    $btn = req('btn');
    if ($btn == 'clear') {
        set_cart();
        redirect('?');
    }
    $id   = req('id');
    $unit = req('unit');
    update_cart($id, $unit);
    redirect();
}

// ----------------------------------------------------------------------------

$name = req('name'); // Get the search term from the form

// ----------------------------------------------------------------------------

$_title = 'Order | Shopping Cart';
include '../header.php';
?>

<style>
/* Buttons */
button {
    padding: 10px 18px;
    background-color: #2196F3;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 14px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #1976D2;
}

/* Links */
a {
    color: #2196F3;
    text-decoration: none;
    font-weight: 500;
}

a:hover {
    text-decoration: underline;
}
</style>

<div class="cart-header">🛒 Cart 🛒</div>
<div class="cart-container">

<form method="GET" class="main-search">
    <input type="text" name="name" placeholder="Enter product name" value="<?= htmlspecialchars($name ?? '') ?>">
    <button type="submit">Search</button>
</form>

<table class="cart">
    <tr>
        <th>Photo</th>
        <th>Id</th>
        <th>Name</th>
        <th>Price (RM)</th>
        <th>Unit</th>
        <th>Subtotal (RM)</th>
    </tr>

    <?php
        $count = 0;
        $total = 0;

        // Prepare the SQL query based on the search term
        $stm = $_db->prepare('SELECT * FROM product WHERE id = ? AND name LIKE ?');
        $cart = get_cart();

        foreach ($cart as $id => $unit) {
            // Execute query with the name search term (if provided)
            $searchTerm = "%" . $name . "%";
            $stm->execute([$id, $searchTerm]);
            $p = $stm->fetch();

            // Skip if no product is found (i.e. search term does not match)
            if (!$p) continue;

            $subtotal = $p->price * $unit;
            $count += $unit;
            $total += $subtotal;
    ?>
        <tr>
            <td>
                <img src="../STAFF/Product/imgProduct/<?= $p->image ?>" alt="Product" style="width: 100px;">
            </td>
            <td><?= $p->id ?></td>
            <td><?= $p->name ?></td>
            <td><?= $p->price ?></td>
            <td>
                <form method="post">
                     <?= html_hidden('id', $p->id) ?>
                     <?= html_select('unit', $_units, $unit) ?>
                </form>            
            </td>
            <td>
                <?= sprintf('%.2f', $subtotal) ?>
            </td>
        </tr>
    <?php } ?>

    <tr>
        <th colspan="4"></th>
        <th><?= $count ?></th>
        <th><?= sprintf('%.2f', $total) ?></th>
    </tr>
</table>
</div>

<p>
    <?php if ($cart): ?>
        <form class="Cart" method="post">
            <input type="hidden" name="btn" value="clear">
            <button type="submit">Clear</button>
            
            <?php if ($_user?->role == 'Member'): ?>
                <button type="button" data-post="checkout.php">Checkout</button>
            <?php else: ?>
                Please <a href="../login.php">login</a> as member to checkout
            <?php endif ?>
        </form>
    <?php endif ?>
</p>

<p>
    <button data-get="history.php">Check Order History</button>
</p>

<script>
    $('select').on('change', e => e.target.form.submit());
</script>

<?php include '../foot.php'; ?>
