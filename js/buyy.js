document.addEventListener('DOMContentLoaded', function() {
    fetchServices();
});

function fetchServices() {
    fetch('../php/data-cart.php')
        .then(response => response.json())
        .then(data => {
            const elementContainer = document.getElementById('element');
            
            // Limpiar el contenido existente
            elementContainer.innerHTML = '';
            
            if (data.length > 0) {
                data.forEach(service => {
                    const li = document.createElement('li');
                    li.textContent = service.nombre_producto;
                    elementContainer.appendChild(li);
                });
            } else {
                elementContainer.innerHTML = '<li>No hay productos en el carrito</li>';
            }
        })
        .catch(error => {
            console.error('Error al cargar los servicios:', error);
            document.getElementById('element').innerHTML = '<li>Error al cargar los productos</li>';
        });
}