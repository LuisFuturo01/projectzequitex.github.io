document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('.container-slider-img').forEach(slider => {
        const sliderInner = slider.querySelector('.container-slider-img__inner');
        const [prevButton, nextButton] = slider.querySelectorAll('.slider-btn');
        let slideWidth = sliderInner.firstElementChild.offsetWidth;
        const updateButtonVisibility = () => {
            const { scrollLeft, scrollWidth, clientWidth } = sliderInner;
            prevButton.style.display = scrollLeft === 0 ? 'none' : 'block';
            nextButton.style.display = scrollLeft + clientWidth >= scrollWidth ? 'none' : 'block';
        };
        updateButtonVisibility();
        sliderInner.addEventListener('scroll', updateButtonVisibility);
        window.addEventListener('resize', () => {
            slideWidth = sliderInner.firstElementChild.offsetWidth;
            updateButtonVisibility();
        });
        prevButton.addEventListener('click', () => {
            sliderInner.scrollBy({ left: -slideWidth, behavior: 'smooth' });
            updateButtonVisibility();
        });
        nextButton.addEventListener('click', () => {
            sliderInner.scrollBy({ left: slideWidth, behavior: 'smooth' });
            updateButtonVisibility();
        });
    });
});
