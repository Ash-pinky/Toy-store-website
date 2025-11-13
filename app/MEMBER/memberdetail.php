<?php
require '../base.php';
//-----------------------------------------------------------------------------

$id = req('id');

$stm = $_db->prepare('SELECT * FROM user WHERE id=?');
$stm->execute([$id]);
$s = $stm->fetch();

if(!$s){
    redirect('/');
}

// ----------------------------------------------------------------------------
$_title = 'Member Detail';
include '../header.php';
?>

<div class="member-detail-header">
    <h2>Member Detail</h2>
</div>

<table class="memberDetail">

    <tr>
        <th>No</th>
        <td><?= $s->id ?></td>
    </tr>
    <tr>
        <th>First Name</th>
        <td><?= $s->firstname ?></td>
    </tr>
    <tr>
        <th>Last Name</th>
        <td><?= $s->lastname ?></td>
    </tr>
    <tr>
        <th>Email</th>
        <td><?= $s->email ?></td>
    </tr>
    <tr>
        <th>Phone Number</th>
        <td><?= $s->phone ?></td>
    </tr>

    <tr>
    <th>Photo</th>
    <td>
        <img src="imageMember/<?= $s->photo ?>" alt="MEMBER Image" style="max-width: 200px; height: auto;">
    </td>
    </tr>

</table>

<br>

<?php
include '../foot.php';