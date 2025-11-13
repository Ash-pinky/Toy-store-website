<?php
require '../base.php';
//-----------------------------------------------------------------------------

auth('Admin');

// ----------------------------------------------------------------------------
$_title = 'Staff menu';
include '../header.php';
?>

<div class="staff-header-container">
    <div class="header2">Staff Menu</div>
</div>


<div class="container">
    <div class="categories">Categories</div>
    <nav class="staff">
        <a href="Product/list.php">Product</a>
        <a href="/MEMBER/memberlist.php">Member</a>
        <a href="Order/orderlisting.php">Order Listing</a>
    </nav>
</div>



<?php
include '../foot.php';