function fetchServices() {
    fetch('../php/products.php')
        .then(response => response.json())
        .then(data => {
            const container = document.querySelector('.main-wrapper__products');
            container.innerHTML = ''; // Limpiar contenido anterior

            data.forEach(service => {
                const serviceElement = document.createElement('div');
                serviceElement.classList.add('box-product');
                serviceElement.innerHTML = `
                    <img src="../img/Company.webp" alt="imagen-invisible" class="box-product__img">
                    <p class="box-product__title">${service.nombre_servicio}</p>
                    <p class="box-product__text">${service.descripcion}</p>
                `;
                container.appendChild(serviceElement);
            });
            console.log('Servicios añadidos:', container.innerHTML); // Verifica la salida
        })
        .catch(error => console.error('Error al cargar los servicios:', error));
}

fetchServices();
