document.addEventListener('DOMContentLoaded', () => {
    setTimeout(() => {
        const elements = document.querySelectorAll(".box-product");
        const input = document.querySelector("#input");
        console.log('Elementos encontrados:', elements); // Verifica los elementos encontrados

        elements.forEach((item, index) => {
            item.setAttribute('data-value', index+1);
            const idItem = document.createElement('DIV');
            idItem.textContent = index + 1;
            idItem.classList.add('box-product__id');
            item.appendChild(idItem);
            item.addEventListener('click', () => {
                item.classList.toggle('item-select');
                const selectedValues = Array.from(elements)
                    .filter(el => el.classList.contains('item-select'))
                    .map(el => el.getAttribute('data-value'));
                input.value = selectedValues.join(',');
            });
        });
    }, 1000);
});
