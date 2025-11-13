// ============================================================================
// General Functions
// ============================================================================

// ============================================================================
// Page Load (jQuery)
// ============================================================================

$(() => {
    // Slider functionality
    let currentIndex = 0;
    const totalSlides = 3;
    const wrapper = document.querySelector('.wrapper');

    function showSlide(index) {
        const translateX = -index * 100;
        if (wrapper) wrapper.style.transform = `translateX(${translateX}%)`;
    }

    function nextSlide() {
        currentIndex = (currentIndex + 1) % totalSlides;
        showSlide(currentIndex);
        resetAutoSlide();
    }

    function prevSlide() {
        currentIndex = (currentIndex - 1 + totalSlides) % totalSlides;
        showSlide(currentIndex);
        resetAutoSlide();
    }

    let autoSlideInterval = setInterval(nextSlide, 5000);

    function resetAutoSlide() {
        clearInterval(autoSlideInterval);
        autoSlideInterval = setInterval(nextSlide, 5000);
    }

    if (wrapper) showSlide(currentIndex);

    // Autofocus
    $('form :input:not(button):first').focus();
    $('.err:first').prev().focus();
    $('.err:first').prev().find(':input:first').focus();
    
    // Confirmation message
    $(document).on('click', '[data-confirm]', function(e) {
        const text = e.target.dataset.confirm || 'Are you sure?';
        if (!confirm(text)) {
            e.preventDefault();
            e.stopImmediatePropagation();
            return false;
        }
    });

    // Initiate GET request - Modified to work with your buttons
    $(document).on('click', '[data-get]', function(e) {
        e.preventDefault();
        const url = $(this).attr('data-get');
        if (url) window.location.href = url;
    });

    // Initiate POST request - Modified to work with your buttons
    $(document).on('click', '[data-post]', function(e) {
        e.preventDefault();
        const url = $(this).attr('data-post');
        if (url) {
            const form = $('<form>', {
                method: 'POST',
                action: url
            }).appendTo('body');
            form.submit();
        }
    });

    // Reset form
    $('[type=reset]').on('click', function(e) {
        e.preventDefault();
        location.reload();
    });

    // Auto uppercase
    $('[data-upper]').on('input', function(e) {
        const a = e.target.selectionStart;
        const b = e.target.selectionEnd;
        e.target.value = e.target.value.toUpperCase();
        e.target.setSelectionRange(a, b);
    });

    $('label.upload input[type=file]').on('change', function(e) {
        const f = e.target.files[0];
        const img = $(e.target).siblings('img')[0];

        if (!img) return;

        img.dataset.src ??= img.src;

        if (f?.type.startsWith('image/')) {
            img.src = URL.createObjectURL(f);
        } else {
            img.src = img.dataset.src;
            e.target.value = '';
        }
    });

  

    // Price filter toggle
    const filterButton = document.getElementById('show-filter');
    const priceInputs = document.getElementById('price-inputs');

    if (filterButton && priceInputs) {
        // Initially hide the price inputs
        priceInputs.style.display = 'none';
        
        filterButton.addEventListener('click', (e) => {
            e.preventDefault();
            e.stopPropagation();
            priceInputs.style.display = priceInputs.style.display === 'none' ? 'block' : 'none';
        });

        // Hide the dropdown if clicking outside
        document.addEventListener('click', function(event) {
            if (!event.target.closest('.price-filter') && priceInputs.style.display === 'block') {
                priceInputs.style.display = 'none';
            }
        });
    }
});

// Make sure the price filter form submits properly
$(document).on('click', '#submit-filter', function(e) {
    e.preventDefault();
    $(this).closest('form').submit();
});

//for cancel order
// Handle cancel button click
document.addEventListener('DOMContentLoaded', function() {
    const cancelBtn = document.getElementById('cancelBtn');
    if (cancelBtn) {
        cancelBtn.addEventListener('click', function(e) {
            e.preventDefault();
            if (confirm('Are you sure you want to cancel this order?')) {
                const orderId = cancelBtn.getAttribute('data-id');
                location.href = 'cancelOrder.php?id=' + orderId;
            }
        });
    }
});


