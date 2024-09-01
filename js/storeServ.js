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
                <div class="box-product__container-img">
                    <div class="box-product__id">${index+1}</div>
                    <img src="../img/services/${index+1}.jpg" alt="imagen servicio de zequitex" class="box-product__img">
                </div>
                <div class="box-product__container-text">
                    <p class="box-product__title">${service.nombre_servicio}</p>
                    <p class="box-product__text">${service.descripcion}</p>
                </div>
                `;
                container.appendChild(serviceElement);
            });
            const elements = document.querySelectorAll(".box-product");
            const input = document.querySelector("#input");
            elements.forEach(item => {
                item.addEventListener('click', () => {
                    item.classList.toggle('item-select');
                    const idelement = item.querySelector(".box-product__id");
                    idelement.classList.toggle('id-select');
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

