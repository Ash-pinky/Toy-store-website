<?php
require '../base.php';

$category = $_GET['category'] ?? null; 

if (!$category) {
    die('Category not specified.');
}

$name = $_GET['name'] ?? '';
$min = isset($_GET['min_price']) ? floatval($_GET['min_price']) : 0;
$max = isset($_GET['max_price']) ? floatval($_GET['max_price']) : 999999;

$sql = "SELECT * FROM product WHERE categories_id = ? AND price BETWEEN ? AND ?";
$params = [$category, $min, $max];

if ($name) {
    $sql .= " AND name LIKE ?";
    $params[] = "%$name%";
}

$stm = $_db->prepare($sql);
$stm->execute($params);
$arr = $stm->fetchAll(PDO::FETCH_OBJ);

// Dynamic Page Title
$categoryNames = [
    'LG' => 'LEGO',
    'PM' => 'POPMART',
    'SYL' => 'SYLVANIAN FAMILIES',
    'HW' => 'HOTWHEEL'
];

$pageTitle = $categoryNames[$category] ?? 'Products';

$_title = $pageTitle . ' Products';
include '../header.php';
?>

<nav class="main">
    <div class="left-section">
        <div class="top-row">
            <form action="../ORDER/cart.php" method="get">
                <button type="submit">🛒 Cart
                    <?php
                        $cart = get_cart();
                        $count = count($cart);
                        if ($count) echo "($count)";
                    ?>
                </button>
            </form>

            <form action="../USER/wishlist.php" method="get">
                <button type="submit">❤️</button>
            </form>

            <div class="category-name">BRANDS
            <div class="dropdown-menu">
                <a href="brand_of_product.php?category=LG">LEGO</a>
                <a href="brand_of_product.php?category=PM">POPMART</a>
                <a href="brand_of_product.php?category=SYL">SLYVANIAN FAMILIES</a>
                <a href="brand_of_product.php?category=HW">HOTWHEEL</a>
            </div>
            </div>
        </div>

        <div class="bottom-row">
        <form method="GET" class="main-search">
            <input type="hidden" name="category" value="<?= htmlspecialchars($category) ?>">
            <input type="text" name="name" placeholder="Enter product name" value="<?= htmlspecialchars($_GET['name'] ?? '') ?>">
            <button type="submit">Search</button>
        </form>


        <form method="GET" class="price-filter">
            <input type="hidden" name="category" value="<?= htmlspecialchars($category) ?>">
            <button type="button" id="show-filter">Filter</button>
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

        </div>
    </div>

    <div class="right-section">
        <?php if (!$_user): ?>
            <button class="loginButton" onclick="location.href='../USER/register.php'">Register</button>
            <button class="registerButton" onclick="location.href='../login.php'">Login</button>
        <?php endif ?>
        <button class="helpButton" onclick="location.href='../USER/help.php'">Help</button>
    </div>
</nav>

<div>
    <div class="title-container">
        <div class="recommend-title"><?= htmlspecialchars($pageTitle) ?> PRODUCTS</div>
    </div>
    <div class="new-Arr-Container">
        <div class="new-list-container">
            <?php foreach ($arr as $p): ?>
                <div class="new-list-item">
                    <a href="../USER/ProductItem/detailItem.php?id=<?= $p->id ?>" class="img-container">
                        <img class="product-img" src="/STAFF/Product/imgProduct/<?= $p->image ?>" data-get="../USER/ProductItem/detailItem.php?id=<?= $p->id ?>">
                    </a>
                    <div class="pro-title"><?= $p->name ?></div>
                    <div class="pro-price">RM <?= $p->price ?></div>
                    <div class="sub-price">
                        <button class="wishlist-btn" data-id="<?= $p->id ?>" onclick="toggleWishlist(this)">
                            <span class="heart-icon"><?= is_in_wishlist($p->id) ? '❤️' : '♡' ?></span>
                        </button>
                    </div>
                </div>
            <?php endforeach ?>
        </div>
    </div>
</div>

<?php include '../foot.php'; ?>
