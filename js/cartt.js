function fetchServices() {
    fetch('../php/data-cart.php')
        .then(response => response.json())
        .then(data => {
            const tableBody = document.getElementById('table').querySelector('tbody');
            const totalElement = document.getElementById('total');
            let granTotal = 0;
            let productQuantities = {};

            let productosLista = [];
            data.forEach((service) => { 
                if (!productQuantities[service.productoID]) {
                    productQuantities[service.productoID] = 0;
                }
                productQuantities[service.productoID] += 1;

                if (productQuantities[service.productoID] <= service.stock) {
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
                            <input class='input-number' type='number' name="cant" min="1" max="${service.stock}" value="1" disabled>
                            <button class='add cant' type="button">+</button>
                        </td>
                        <td class='total'>Bs. ${service.precio}</td>
                    `;
                    tableBody.appendChild(newRow);
                    
                    const celda = newRow.querySelector('.celda');
                    const add = celda.querySelector('.add');
                    const less = celda.querySelector('.less');
                    const inputNumber = celda.querySelector('.input-number');
                    const totalCell = newRow.querySelector('.total');
            
                    let cantidad = parseInt(inputNumber.value, 10);
            
                    function updateInputValue() {
                        inputNumber.value = cantidad;
                        const subtotal = service.precio * cantidad;
                        totalCell.textContent = `Bs. ${subtotal.toFixed(2)}`;
                        actualizarGranTotal();
                        actualizarProductosLista();
                    }
            
                    add.addEventListener('click', () => {
                        if (cantidad < service.stock && productQuantities[service.productoID] < service.stock) {
                            cantidad += 1;
                            productQuantities[service.productoID] += 1;
                            updateInputValue();
                        }
                    });
            
                    less.addEventListener('click', () => {
                        if (cantidad > 1) {
                            cantidad -= 1;
                            productQuantities[service.productoID] -= 1;
                            updateInputValue();
                        }
                    });
            
                    updateInputValue();
                } else {
                    // Si la cantidad supera el stock, eliminar el producto del carrito
                    fetch('del.php', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded',
                        },
                        body: `del=${service.carritoID}`
                    })
                    .then(response => response.text())
                    .then(data => console.log(data))
                    .catch((error) => console.error('Error:', error));
                }
            });

            function actualizarProductosLista() {
                productosLista = [];
                document.querySelectorAll('tr').forEach(row => {
                    const productoID = row.querySelector('td:first-child')?.textContent.trim();
                    const cantidad = row.querySelector('.input-number')?.value;
                    if (productoID && cantidad) {
                        productosLista.push(`${productoID}:${cantidad}`);
                    }
                });
                document.getElementById('productos-lista').value = productosLista.join(',');
            }

            function actualizarGranTotal() {
                granTotal = Array.from(document.querySelectorAll('.total')).reduce((sum, cell) => {
                    return sum + parseFloat(cell.textContent.replace('Bs. ', ''));
                }, 0);
                totalElement.textContent = `Bs. ${granTotal.toFixed(2)}`;
                actualizarPrecioTotal();
            }

            actualizarGranTotal();

            function actualizarPrecioTotal() {
                const preciototal = document.getElementById('precio-total');
                preciototal.value = granTotal.toFixed(2);
                console.log(preciototal.value);
            }
        })
        .catch(error => console.error('Error al cargar los servicios:', error));
}

fetchServices();

console.log(document.querySelectorAll('.celda'));
