<?php
require 'base.php';

if ($_user && $_user->role == 'Admin') {
    header("Location: STAFF/staffmenu.php");
    exit();
}

if (is_post()) {
    $id   = req('id');
    $unit = req('unit');
    update_cart($id,$unit);
    redirect();
}

$slideshowImages = $_db->query('SELECT image FROM slideshow ORDER BY id');

// Filters
$name = req('name');
$min = isset($_GET['min_price']) ? floatval($_GET['min_price']) : 0;
$max = isset($_GET['max_price']) ? floatval($_GET['max_price']) : 9999;

// Pagination
$productsPerPage = 8;
$page = isset($_GET['page']) ? max(1, intval($_GET['page'])) : 1;
$offset = ($page - 1) * $productsPerPage;

// Count total products
$countSql = "SELECT COUNT(*) FROM product WHERE price BETWEEN ? AND ?";
$countParams = [$min, $max];
if ($name) {
    $countSql .= " AND name LIKE ?";
    $countParams[] = "%$name%";
}
$countStm = $_db->prepare($countSql);
$countStm->execute($countParams);
$totalProducts = $countStm->fetchColumn();
$totalPages = ceil($totalProducts / $productsPerPage);

// Get current page products
$sql = "SELECT * FROM product WHERE price BETWEEN ? AND ?";
$params = [$min, $max];
if ($name) {
    $sql .= " AND name LIKE ?";
    $params[] = "%$name%";
}
$sql .= " LIMIT $productsPerPage OFFSET $offset";
$stm = $_db->prepare($sql);
$stm->execute($params);
$arr = $stm->fetchAll();

$_title = 'Cherry House';
include 'header.php';
?>


<nav class="main">
    <div class="left-section">
        <div class="top-row">
            <form action="/ORDER/cart.php" method="get">
                <button type="submit">🛒 Cart
                    <?php
                        $cart = get_cart();
                        $count = count($cart);
                        if ($count) echo "($count)";
                    ?>
                </button>
            </form>

            <form action="USER/wishlist.php" method="get">
                <button type="submit">❤️</button>
            </form>

            <div class="category-name">BRANDS
            <div class="dropdown-menu">
                <a href="CATEGORIES/brand_of_product.php?category=LG">LEGO</a>
                <a href="CATEGORIES/brand_of_product.php?category=PM">POPMART</a>
                <a href="CATEGORIES/brand_of_product.php?category=SYL">SLYVANIAN FAMILIES</a>
                <a href="CATEGORIES/brand_of_product.php?category=HW">HOTWHEEL</a>
            </div>
            </div>
        </div>

        <div class="bottom-row">
            <form method="GET" class="main-search">
                <input type="text" name="name" placeholder="Enter product name" value="<?= htmlspecialchars($_GET['name'] ?? '') ?>">
                <button type="submit">Search</button>
            </form>

            <form method="get" class="price-filter">
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
            <button class="loginButton" onclick="location.href='USER/register.php'">Register</button>
            <button class="registerButton" onclick="location.href='login.php'">Login</button>
        <?php endif ?>
        <button class="helpButton" onclick="location.href='USER/help.php'">Help</button>
    </div>
</nav>



<div>
        <div class="parent-container">
            <div class="recommend-title-slideshow">TOP PRODUCTS</div>
        </div>
        <div class="container-slide">
         <div class="wrapper"></div>
            <button class="left" onclick="prevSlide()">&#10094;</button>
            <button class="right" onclick="nextSlide()">&#10095;</button>
        </div>
    </div>



    <div class="new-Arr-Container">
    <div class="recommend-title">Products List</div>
    <div class="new-list-container">
        <?php foreach ($arr as $p): ?>
            <?php
                $cart = get_cart();
                $id   = $p->id;
                $unit = $cart[$id] ?? 0;
            ?>
            <div class="new-list-item" data-id="<?= $p->id ?>">

                <a href="USER/ProductItem/detailItem.php?id=<?= $p->id ?>" class="img-container">
                    <img class="product-img" src="/STAFF/Product/imgProduct/<?= $p->image ?>"data-get="USER/ProductItem/detailItem.php?id=<?= $p->id ?>">
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
</div> 

<div class="pagination">
    <?php for ($i = 1; $i <= $totalPages; $i++): ?>
        <a href="?<?= http_build_query(array_merge($_GET, ['page' => $i])) ?>" 
           class="<?= $i === $page ? 'active' : '' ?>">
            <?= $i ?>
        </a>
    <?php endfor ?>
</div>

<script>
    $('select').on('change',e => e.target.form.submit());
</script>

<!-- Back to Top Button -->
<button id="backToTop" title="Back to Top">⬆</button>

<?php
include 'foot.php';