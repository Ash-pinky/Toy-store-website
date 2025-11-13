
function toggleWishlist(button) {
    const productId = button.getAttribute('data-id');
    const heartIcon = button.querySelector('.heart-icon');
    const isInWishlist = heartIcon && heartIcon.textContent === '❤️';
    const action = isInWishlist ? 'remove' : 'add';

    fetch('/USER/update_wishlist.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: `action=${action}&id=${productId}`,
    })
    .then(response => response.json())
    .then(data => {
        if (data.status === 'error' && data.message === 'Please login first') {
            showLoginPopup();
        } else if (data.status === 'success') {
            // Toggle heart icon if exists
            if (heartIcon) {
                heartIcon.textContent = isInWishlist ? '♡' : '❤️';
            }

            // Remove row if on wishlist page
            const parentRow = button.closest('tr');
            if (action === 'remove' && parentRow) {
                parentRow.remove();

                // If only header row left in wishlist table, reload
                const rows = document.querySelectorAll('.wishlist tr');
                if (rows.length === 1) {
                    location.reload();
                }
            }

            updateWishlistCount();
        }
    })
    .catch(error => {
        console.error('Error updating wishlist:', error);
    });
}

function showLoginPopup() {
    const existing = document.getElementById('login-popup');
    if (existing) return;

    const popup = document.createElement('div');
    popup.id = 'login-popup';
    popup.innerHTML = `
        <div style="
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background: rgba(0,0,0,0.5);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 9999;
        ">
            <div style="
                background: white;
                padding: 20px;
                border-radius: 10px;
                max-width: 300px;
                text-align: center;
                box-shadow: 0 0 20px rgba(0,0,0,0.3);
            ">
                <p>You must be logged in to use the wishlist feature.</p>
                <button onclick="window.location.href='/login.php'" style="margin-right: 10px;">Login</button>
                <button onclick="window.location.href='/index.php'">Cancel</button>
            </div>
        </div>
    `;
    document.body.appendChild(popup);
}
window.addEventListener("DOMContentLoaded", function() {
    // Assuming `isGuest` is a JS variable passed from PHP
    if (isGuest) {
        showLoginPopup();
    }
});
