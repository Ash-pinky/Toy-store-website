<?php
require '../../base.php';
//-----------------------------------------------------------------------------

$arr = $_db->query('SELECT * FROM product')->fetchAll();
$slideshowProducts = $_db->query('SELECT product_id FROM slideshow')->fetchAll(PDO::FETCH_COLUMN);

$name = req('name');
$min = isset($_GET['min_price']) ? floatval($_GET['min_price']) : 0;
$max = isset($_GET['max_price']) ? floatval($_GET['max_price']) : 999999;

$sql = "SELECT * FROM product WHERE price BETWEEN ? AND ?";
$params = [$min, $max];

// Add name filter if provided
if ($name) {
    $sql .= " AND name LIKE ?";
    $params[] = "%$name%";
}

$stm = $_db->prepare($sql);
$stm->execute($params);
$arr = $stm->fetchAll();



// ----------------------------------------------------------------------------
$_title = 'PRODUCT LIST';
include '../../header.php';
?>

<nav class = "list">
        <a href="/">Categories</a>
        <a href="insert.php">Insert</a>
        <form method="get" class="price-filter">
    <!-- Button to reveal the inputs -->
    <button type="button" id="show-filter">Filter</button>

    <!-- Hidden inputs initially -->
    <div id="price-inputs">
        <label>Min Price:
            <input type="number" name="min_price" step="0.01" placeholder="e.g. 10.00">
        </label>
        <label>Max Price:
            <input type="number" name="max_price" step="0.01" placeholder="e.g. 100.00">
        </label>
        <button type="submit" id="submit-filter">Apply Filter</button>
    </div>
</form>

<form class="search">
<input type="text" name="name" placeholder="Enter product name" value="<?= htmlspecialchars($_GET['name'] ?? '') ?>">
<button>Search</button>
</form>

</nav>

<div class="admin-product-list">PRODUCTS LIST</div>

<table class="table">
   
    <tr>
        <th>Images</th>
        <th>Product ID</th>
        <th>Name</th>
        <th>Price</th>
        <th>Description</th>
        <th>Category ID</th>
        <th></th>
    </tr>

    <?php foreach ($arr as $s): ?>
    <tr>
        <td>
        <img src="imgProduct/<?= htmlspecialchars($s->image) ?>" alt="PRODUCT Image" width="100">
        </td>
        <td><?= $s->id ?></td>
        <td><?= $s->name ?></td>
        <td><?= $s->price ?></td>
        <td><?= $s->description ?></td>
        <td><?= $s->categories_id ?></td>
        <td>
            <button  data-get="detail.php?id=<?= $s->id ?>">Detail</button>
            <button  data-get="update.php?id=<?= $s->id ?>">Update</button>
            <button data-post="delete.php?id=<?= $s->id ?>"
                    data-confirm>Delete</button>
                    <?php if (in_array($s->id, $slideshowProducts)): ?>
            <form method="post" action="slideshow/unset_slideshow.php" style="display:inline;">
                <input type="hidden" name="product_id" value="<?= $s->id ?>">
                <button type="submit">Unset as Slideshow</button>
            </form>
        <?php else: ?>
            <form method="post" action="slideshow/set_slideshow.php" style="display:inline;">
                <input type="hidden" name="product_id" value="<?= $s->id ?>">
                <button type="submit">Set as Slideshow</button>
            </form>
        <?php endif; ?>
        </td>
    </tr>
    <?php endforeach ?>
</table>

<p><?= count($arr) ?> record(s)</p>



<?php
include '../../foot.php';