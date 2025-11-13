<?php
include '../../base.php';

// ----------------------------------------------------------------------------
$review_success = req('review_success');

if (is_post()) {
    $id   = req('id');
    $unit = req('unit');
    update_cart($id,$unit);
    redirect();
}

$id  = req('id');
$stm = $_db->prepare('SELECT * FROM product WHERE id = ?');
$stm->execute([$id]);
$p = $stm->fetch();
if (!$p) redirect('index.php');

// ----------------------------------------------------------------------------

$_title = 'Product | Detail';
include '../../header.php';
?>

<div class="product-detail-header">PRODUCT DETAIL</div>

<table class="tabledetail">
    <tr>
        <th>Photo</th>
        <td><img src="/../STAFF/Product/imgProduct/<?= $p->image ?>" alt="Product Image" style="max-width: 200px; height: auto;"></td>
    </tr>
    <tr>
        <th>Id</th>
        <td><?= $p->id ?></td>
    </tr>
    <tr>
        <th>Name</th>
        <td><?= $p->name ?></td>
    </tr>
    <tr>
        <th>Price</th>
        <td>RM <?= $p->price ?></td>
    </tr>
    <tr>
        <th>Description</th>
        <td><?= $p->description ?></td>
    </tr>
    <tr>
        <th>Video</th>
        <td>
        <?php if (!empty($p->video_url)): ?>
            <div style="margin-top: 10px;">
                <a href="<?= str_replace('embed/', 'watch?v=', $p->video_url) ?>" target="_blank" style="text-decoration: none;">
                    <button style="color: black;">🎥 Watch on YouTube</button>
                </a>
            </div>
        <?php else: ?>
            <p>No video available.</p>
        <?php endif; ?>
    </td>
    </tr>
    <tr>
        <th>Unit</th>
        <td>
             <?php
             $cart = get_cart();
             $id   = $p->id;
             $unit = $cart[$p->id] ?? 0;
             ?>
            <form method="post">
                 <?= html_hidden('id') ?>
                 <?= html_select('unit',$_units,'') ?>
                 <?= $unit ? '🛒' : '' ?>
            </form>
        </td>
    </tr>
</table>

<div class="review-section">
    <h2>Product Reviews</h2>

    <?php
    // Fetch all reviews for this product
    $stm = $_db->prepare("SELECT r.*, u.firstname FROM review r 
                          JOIN user u ON r.user_id = u.id 
                          WHERE r.product_id = ? 
                          ORDER BY r.created_at DESC");
    $stm->execute([$p->id]);
    $reviews = $stm->fetchAll(PDO::FETCH_OBJ);
    ?>

    <?php if ($reviews): ?>
        <?php foreach ($reviews as $review): ?>
            <div class="review-item">
                <div class="review-header">
                    <strong><?= htmlspecialchars($review->firstname) ?></strong> 
                    <span class="rating">
                        <?php for ($i = 1; $i <= 5; $i++): ?>
                            <?= $i <= $review->rating ? '⭐' : '☆' ?>
                        <?php endfor; ?>
                    </span>
                </div>
                <div class="review-text"><?= nl2br(htmlspecialchars($review->review_text)) ?></div>
                <?php if ($review->image): ?>
                    <div class="review-image">
                        <img src="/USER/review_images/<?= htmlspecialchars($review->image) ?>" alt="Review Image">
                    </div>
                <?php endif ?>
                <div class="review-date"><?= date('d M Y', strtotime($review->created_at)) ?></div>
            </div>
        <?php endforeach ?>
    <?php else: ?>
        <p>No reviews yet. Be the first to leave a review!</p>
    <?php endif ?>
</div>

<?php if ($_user): ?>
    <div class="add-review-section">
        <h2>Leave a Review</h2>
        <form action="../submit_review.php" method="POST" enctype="multipart/form-data" class="review-form">
            <input type="hidden" name="product_id" value="<?= $p->id ?>">

            <label for="rating">Rating:</label>
            <div class="star-rating">
    <input type="radio" id="star5" name="rating" value="5" required>
    <label for="star5"><i class="fas fa-star"></i></label>

    <input type="radio" id="star4" name="rating" value="4">
    <label for="star4"><i class="fas fa-star"></i></label>

    <input type="radio" id="star3" name="rating" value="3">
    <label for="star3"><i class="fas fa-star"></i></label>

    <input type="radio" id="star2" name="rating" value="2">
    <label for="star2"><i class="fas fa-star"></i></label>

    <input type="radio" id="star1" name="rating" value="1">
    <label for="star1"><i class="fas fa-star"></i></label>
</div>

            <label for="review_text">Review:</label>
            <textarea name="review_text" id="review_text" rows="5" required></textarea>

            <label for="image">Upload an Image (optional):</label>
            <input type="file" name="image" id="image" accept="image/*">

            <button type="submit">Submit Review</button>
        </form>
    </div>
<?php else: ?>
    <p class="login-to-review">Please <a href="/login.php">login</a> to leave a review.</p>
<?php endif ?>

<?php if ($review_success): ?>
    <div class="popup-message" id="popupMessage">
        <p>Thank you for your review!</p>
    </div>

    <style>
        .popup-message {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: rgba(76, 175, 80, 0.8); 
            color: white;
            padding: 20px;
            border-radius: 5px;
            z-index: 1000;
            display: block;
            font-size: 16px;
        }
    </style>

    <script>
        setTimeout(function() {
            document.getElementById('popupMessage').style.display = 'none';
        }, 2000); 
    </script>
<?php endif; ?>

<button class="back" data-get="../../index.php">Back</button>


<script>
    $('select').on('change',e => e.target.form.submit());
</script>

<?php
include '../../foot.php';