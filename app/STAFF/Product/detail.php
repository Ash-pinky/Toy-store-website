<?php
require '../../base.php';
//-----------------------------------------------------------------------------

$id = req('id');

$stm = $_db->prepare('SELECT * FROM product WHERE id=?');
$stm->execute([$id]);
$s = $stm->fetch();

if(!$s){
    redirect('/');
}

// ----------------------------------------------------------------------------
$_title = 'Detail';
include '../../header.php';
?>

<div class="product-detail-header">PRODUCT DETAIL</div>

<table class="tabledetail">
<tr>
    <th>Images</th>
    <td>
        <img src="imgProduct/<?= $s->image ?>" alt="Product Image" style="max-width: 200px; height: auto;">
    </td>
</tr>


    <tr>
        <th>Product ID</th>
        <td><?= $s->id ?></td>
    </tr>
    <tr>
        <th>Name</th>
        <td><?= $s->name ?></td>
    </tr>
    <tr>
        <th>Price</th>
        <td><?= $s->price ?></td>
    </tr>
    <tr>
        <th>Description</th>
        <td><?= $s->description ?></td>
    </tr>
    <tr>
        <th>Category ID</th>
        <td><?= $s->categories_id ?></td>
    </tr>
</table>

<br>

<button class="back" data-get="list.php">Back</button>

<?php
include '../../foot.php';