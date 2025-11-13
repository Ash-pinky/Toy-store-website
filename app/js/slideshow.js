let currentIndex = 0; 
let slides = []; 
let totalSlides = 0; 
const wrapper = document.querySelector('.wrapper');
const slideWidth = 100; 



function showSlide(index) {
    const translateX = -index * slideWidth; 
    wrapper.style.transform = `translateX(${translateX}%)`; 
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


async function loadSlides() {
    try {
        const response = await fetch('/STAFF/Product/slideshow/get_slideshow.php');
        const products = await response.json();

        wrapper.innerHTML = ''; 

        products.forEach(product => {
            const slideItem = document.createElement('div');
            slideItem.classList.add('slide-item');
        
            const link = document.createElement('a');
            link.href = `/USER/ProductItem/detailItem.php?id=${product.id}`;
            link.style.display = 'block';
            link.style.width = '100%';
            link.style.height = '100%';
        
            const slide = document.createElement('img');
            slide.classList.add('slide');
            slide.src = `/STAFF/Product/imgProduct/${product.image}`;
            slide.alt = product.name;
        
            link.appendChild(slide);
            slideItem.appendChild(link);
            wrapper.appendChild(slideItem);
        });

        slides = document.querySelectorAll('.slide'); 
        totalSlides = slides.length;

        showSlide(0); 
    } catch (error) {
        console.error('Error loading slideshow:', error);
    }
}

loadSlides();
