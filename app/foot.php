</main>

<footer>
    Developed by <b>CHERRY GANG</b> &middot;
    Copyrighted &copy; <?= date('Y') ?>
</footer>

<script>
    const backToTopBtn = document.getElementById("backToTop");

    backToTopBtn.style.display = "block"; // Always show it

    backToTopBtn.addEventListener("click", () => {
        window.scrollTo({
            top: 0,
            behavior: "smooth"
        });
    });
</script>

</body>
</html>