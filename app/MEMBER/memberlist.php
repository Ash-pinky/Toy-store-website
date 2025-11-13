<?php
require '../base.php';
//-----------------------------------------------------------------------------

$arr = $_db->query('SELECT * FROM user')->fetchAll();

$firstname = req('firstname');

$stm = $_db->prepare('SELECT * FROM user WHERE firstname LIKE ?');
$stm->execute(["$firstname%"]);
$arr= $stm->fetchAll();


// ----------------------------------------------------------------------------
$_title = 'Index';
include '../header.php';
?>

<div class="member-header">
    <h2>Member List</h2>
</div>
<p><?= count($arr) ?> record(s)</p>

<form class="searchmember">
    <input type="text" name="firstname" placeholder="Enter first name" value="<?= htmlspecialchars($_GET['firstname'] ?? '') ?>">
    <button>Search</button>
</form>


<table class="tableMember">
    <tr>
        <th>Id</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Email</th>
        <th>Phone Number</th>
        <th>Photo</th>
        <th>Member Detail</th>
    </tr>

    <?php foreach ($arr as $s): ?>
    <tr>
        <td><?= $s->id ?></td>
        <td><?= $s->firstname ?></td>
        <td><?= $s->lastname ?></td>
        <td><?= $s->email ?></td>
        <td><?= $s->phone ?></td>
        <td>
        <img src="imageMember/<?= htmlspecialchars($s->photo) ?>" alt="MEMBER Image" width="50">
        </td>
        <td>
            <button  data-get="memberdetail.php?id=<?= $s->id ?>">Detail</button>
        </td>
    </tr>
    <?php endforeach ?>
</table>


<?php
include '../foot.php';