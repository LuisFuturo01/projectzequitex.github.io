function fetchServices(term = '') {
    const url = term ? `../php/buscar_prod.php?term=${encodeURIComponent(term)}` : '../php/products.php';

    fetch(url)
        .then(response => response.json())
        .then(data => {
            const container = document.querySelector('.main-wrapper__products');
            container.innerHTML = ''; // Limpia los resultados anteriores

            data.forEach((service) => {
                const serviceElement = document.createElement('div');
                serviceElement.classList.add('box-product');
                serviceElement.setAttribute('data-value', service.productoID);
                serviceElement.innerHTML = `
                <div class="box-product__container-img">    
                    <div class="box-product__id">${service.productoID}</div>
                    <img src="../img/products/${service.productoID}.jpg" alt="imagen-invisible" class="box-product__img">
                </div>
                <div class="box-product__container-text">
                    <p class="box-product__title">${service.nombre_producto}</p>
                    <button class='button-select'>SELECCIONAR</button>
                </div>
                `;
                container.appendChild(serviceElement);
            });

            const elements = document.querySelectorAll(".box-product");
            const input = document.querySelector("#input");
            elements.forEach(item => {
                const button = item.querySelector(".button-select");
                button.addEventListener('click', (event) => {
                    event.stopPropagation();
                    item.classList.toggle('item-select');
                    const idelement = item.querySelector(".box-product__id");
                    idelement.classList.toggle('id-select');
                    const selectedValues=Array.from(elements)
                        .filter(el => el.classList.contains('item-select'))
                        .map(el => el.getAttribute('data-value'));
                    input.value=selectedValues.join(',');
                })
            });
        })
        .catch(error => console.error('Error al cargar los servicios:', error));
}

// Función para actualizar los valores seleccionados en el campo de búsqueda
function updateSelectedValues() {
    const selectedValues = Array.from(document.querySelectorAll(".box-product"))
        .filter(el => el.classList.contains('item-select'))
        .map(el => el.getAttribute('data-value'));
    document.querySelector("#buscador").value = selectedValues.join(',');
}

// Llama a fetchServices al cargar la página con término vacío
fetchServices();

// Función para manejar el evento de entrada en el campo de búsqueda
document.querySelector('#buscador').addEventListener('input', (event) => {
    const term = event.target.value.trim(); // Elimina espacios en blanco al inicio y al final
    fetchServices(term);
});
