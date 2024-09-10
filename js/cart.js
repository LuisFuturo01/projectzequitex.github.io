function fetchServices() {
    fetch('../php/data-cart.php')
        .then(response => response.json())
        .then(data => {
            const tableBody = document.getElementById('table').querySelector('tbody');
            data.forEach((service) => {
                const newRow = document.createElement('tr');
                newRow.innerHTML = `
                    <td>${service.productoID}
                        <form class="delete" method="post" action="del.php">
                            <p>
                                <input type="hidden" value="${service.carritoID}" id="input" name="del">
                            </p>
                            <input type="submit" value="X" class="delete">
                        </form>
                    </td>
                    <td>${service.nombre_producto}</td>
                    <td>${service.descripcion}</td>
                    <td>Bs. ${service.precio}</td>
                    <td><img class='table-img' src='../img/products/${service.productoID}.jpg'></td>
                    <td class='celda'>
                        <button class='less cant' type="button">-</button>
                        <input class='input-number' type='number' name="cant" min="1" max="99" value="1" disabled>
                        <button class='add cant' type="button">+</button>
                    </td>
                
                `;
                tableBody.appendChild(newRow);
                
            });
            document.querySelectorAll('.celda').forEach(celda => {
                const add = celda.querySelector('.add');
                const less = celda.querySelector('.less');
                const inputNumber = celda.querySelector('.input-number');
        
                let cantidad = parseInt(inputNumber.value, 10);
        
                function updateInputValue() {
                    inputNumber.value = cantidad;
                }
        
                add.addEventListener('click', () => {
                    cantidad += 1; // Incrementar la cantidad
                    updateInputValue(); // Actualizar el valor del input
                });
        
                less.addEventListener('click', () => {
                    if (cantidad > 1) { // Asegurarse de que la cantidad no sea menor que el mínimo permitido
                        cantidad -= 1; // Decrementar la cantidad
                        updateInputValue(); // Actualizar el valor del input
                    }
                });
        
                // Inicializa el valor del input al cargar la página
                updateInputValue();
            });
        })
        .catch(error => console.error('Error al cargar los servicios:', error));
};
fetchServices();
console.log(document.querySelectorAll('.celda')); // Verifica si devuelve elementos


    
