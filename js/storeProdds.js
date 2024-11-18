function fetchServices(term = '') {
    const url = term ? `../php/buscar_prod.php?term=${encodeURIComponent(term)}` : '../php/products.php';

    fetch(url)
        .then(response => response.json())
        .then(data => {
            const container = document.querySelector('.main-wrapper__products');
            container.innerHTML = ''; // Limpia los resultados anteriores

            // Obtener los IDs de los elementos seleccionados antes de limpiar
            const selectedIds = Array.from(document.querySelectorAll('.item-select'))
                .map(el => el.getAttribute('data-value'));

            data.forEach((service) => {
                const serviceElement = document.createElement('div');
                serviceElement.classList.add('box-product');
                serviceElement.setAttribute('data-value', service.productoID);
                
                // Verificar si este elemento estaba seleccionado antes
                if (selectedIds.includes(service.productoID)) {
                    serviceElement.classList.add('item-select');
                }
                
                let buttonHtml = '';
                if (service.stock > 0) {
                    buttonHtml = '<button class="button-select">SELECCIONAR</button>';
                } else {
                    serviceElement.classList.add('agotado_element');
                }

                serviceElement.innerHTML = `
                <div class="box-product__container-img">    
                    <div class="box-product__id ${selectedIds.includes(service.productoID) ? 'id-select' : ''}">${service.productoID}</div>
                    <img src="../img/products/${service.productoID}.jpg" alt="imagen-invisible" class="box-product__img">
                </div>
                <div class="box-product__container-text">
                    <p class="box-product__title">${service.nombre_producto}</p>
                    <span class="price">Bs. ${service.precio}</span>
                    <span class="description">${service.descripcion}</span>
                    ${buttonHtml}
                </div>
                `;

                if (service.stock <= 0) {
                    serviceElement.innerHTML += `
                    <div class="agotado"><span class="agotado_message">AGOTADO</span></div>
                    `;
                }

                container.appendChild(serviceElement);
            });

            const elements = document.querySelectorAll(".box-product");
            const input = document.querySelector("#input");
            elements.forEach(item => {
                const button = item.querySelector(".button-select");
                if (button) {
                    button.addEventListener('click', (event) => {
                        event.stopPropagation();
                        item.classList.toggle('item-select');
                        const idelement = item.querySelector(".box-product__id");
                        idelement.classList.toggle('id-select');
                        updateSelectedValues();
                    });
                }
            });

            // Actualizar el valor del input después de recrear los elementos
            updateSelectedValues();
        })
        .catch(error => console.error('Error al cargar los servicios:', error));
}

// Función para actualizar los valores seleccionados en el campo oculto
function updateSelectedValues() {
    const selectedValues = Array.from(document.querySelectorAll(".box-product"))
        .filter(el => el.classList.contains('item-select'))
        .map(el => el.getAttribute('data-value'));
    document.querySelector("#input").value = selectedValues.join(',');
}

// Llama a fetchServices al cargar la página con término vacío
fetchServices();

// Función para manejar el evento de entrada en el campo de búsqueda
document.querySelector('#buscador').addEventListener('input', (event) => {
    const term = event.target.value.trim(); // Elimina espacios en blanco al inicio y al final
    fetchServices(term);
});
