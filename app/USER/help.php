<?php
include '../base.php';

$_title = 'Help & FAQs';
include '../header.php';
?>
<link rel="stylesheet" href="../styles/help.css">

<div class="help-container">
    <h1 class="help-title">Need Help? 💬</h1>

    <div class="faq-container">
        <div class="faq-question">🛒 How do I place an order?</div>
        <div class="faq-answer hidden">
            Just browse your favorite figures, make sure you login before click the cart, and proceed to checkout. Easy peasy!
        </div>
    </div>

    <div class="faq-container">
        <div class="faq-question">🚚 What are the shipping options?</div>
        <div class="faq-answer">
            We offer standard and express shipping. Estimated delivery is shown at checkout based on your location.
        </div>
    </div>

    <div class="faq-container">
        <div class="faq-question">📦 How do I track my package?</div>
        <div class="faq-answer">
            After your order ships, we’ll send you a tracking link via email and you can also view it in your profile.
        </div>
    </div>

    <div class="faq-container">
        <div class="faq-question">🔁 What's your return policy?</div>
        <div class="faq-answer">
            We accept returns within 14 days if the item is unopened and in original condition. Just contact support!
        </div>
    </div>
    
    <?php
if (is_post()) {
    $feedback = trim(req('feedback'));
    if ($feedback) {
        $stm = $_db->prepare('INSERT INTO feedback (message, created_at) VALUES (?, NOW())');
        $stm->execute([$feedback]);
        
        echo "<script>
            document.addEventListener('DOMContentLoaded', function() {
                const popup = document.createElement('div');
                popup.textContent = 'Thanks for your feedback!❤️';
                popup.className = 'feedback-popup';
                document.body.appendChild(popup);
                setTimeout(() => popup.remove(), 3000);
            });
        </script>";
    }
}
?>

<form method="post" class="feedback-form">
    <label for="feedback">Still have questions? Leave us a message 💬</label>
    <textarea name="feedback" id="feedback" placeholder="Write your question or suggestion..." required></textarea>
    <button type="submit">Submit</button>
</form>

</div>

<script>
document.querySelectorAll('.faq-question').forEach(q => {
    q.addEventListener('click', () => {
        const container = q.parentElement;
        container.classList.toggle('active');
    });
});
</script>

<?php
include '../foot.php';
