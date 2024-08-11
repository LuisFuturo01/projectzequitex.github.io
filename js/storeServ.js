function fetchServices() {
    fetch('../php/services.php')
        .then(response => response.json())
        .then(data => {
            const container = document.querySelector('.main-wrapper__products');
            data.forEach((service, index) => {
                const serviceElement = document.createElement('div');
                serviceElement.classList.add('box-product');
                serviceElement.setAttribute('data-value', index+1);
                serviceElement.innerHTML = `
                    <div class="box-product__id">${index+1}</div>
                    <img src="../img/Company.webp" alt="imagen-invisible" class="box-product__img">
                    <p class="box-product__title">${service.nombre_servicio}</p>
                    <p class="box-product__text">${service.descripcion}</p>
                `;
                container.appendChild(serviceElement);
            });
            const elements = document.querySelectorAll(".box-product");
            const input = document.querySelector("#input");
            elements.forEach(item => {
                item.addEventListener('click', () => {
                    item.classList.toggle('item-select');
                    const selectedValues=Array.from(elements)
                        .filter(el => el.classList.contains('item-select'))
                        .map(el => el.getAttribute('data-value'));
                    input.value=selectedValues.join(',')
                });
            });
        })
        .catch(error => console.error('Error al cargar los servicios:', error));
};
fetchServices();

