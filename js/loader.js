document.addEventListener('DOMContentLoaded', function() {
    // Mostrar el loader
    const loader = document.getElementById('loader');
    loader.style.display = 'flex';

    const tiempoMinimo = 500;
    const tiempoInicio = Date.now();

    // Función para ocultar el loader y mostrar los productos
    function mostrarProductos() {
        loader.style.display = 'none';
        document.querySelector('.main-wrapper__products').style.display = 'grid';
    }

    // Función que se llama cuando los productos están listos
    function productosListo() {
        const tiempoTranscurrido = Date.now() - tiempoInicio;
        
        if (tiempoTranscurrido >= tiempoMinimo) {
            mostrarProductos();
        } else {
            const tiempoRestante = tiempoMinimo - tiempoTranscurrido;
            setTimeout(mostrarProductos, tiempoRestante);
        }
    }

    setTimeout(function() {
        
        productosListo();
    },0);
});