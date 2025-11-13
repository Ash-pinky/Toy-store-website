<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= $_title ?? 'Untitled' ?></title>
    <link rel="shortcut icon" href="/images/Logo.png">
    <link rel="stylesheet" href="/css/help.css">
    <link rel="stylesheet" href="/css/hNfoot.css">
    <link rel="stylesheet" href="/css/staff.css">
    <link rel="stylesheet" href="/css/staffProductList.css">
    <link rel="stylesheet" href="/css/login.css">
    <link rel="stylesheet" href="/css/profile.css">
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/member.css">
    <link rel="stylesheet" href="/css/slideshow.css">
    <link rel="stylesheet" href="/css/cart.css">
    <link rel="stylesheet" href="/css/order.css">
    <link rel="stylesheet" href="/css/orderlist.css">
    <link rel="stylesheet" href="/css/tabledetail.css">
    <link rel="stylesheet" href="/css/wishlist.css">
    <link rel="stylesheet" href="/css/review.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300..700&display=swap" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="/js/app.js"></script>
    <script src="/js/hearticon.js" defer></script>
    <script src="/js/slideshow.js" defer></script>

</head>

<body>
    <div id="info"><?= temp('info') ?></div>
   
    <header>
        <h1><a href="/">CHERRY HOUSE</a></h1>

        <?php if ($_user): ?>
            
            <div class="user-dropdown">
                <div style="display: flex; align-items: center; gap: 10px;">
                    <div style="text-align: right;">
                        <?= $_user->firstname . ' ' . $_user->lastname ?><br>
                        <?= $_user->role ?>
                    </div>
                    <img src="/MEMBER/imageMember/<?= $_user->photo ?>" id="userAvatar">
                </div>
                
                <div class="dropdown-content">
                    <a href="/USER/profile.php"><i class="fas fa-user"></i> Profile</a>
                    <a href="/logout.php"><i class="fas fa-sign-out-alt"></i> Logout</a>
                </div>
            </div>
        <?php endif ?>
    </header>

   

</body>
</html>