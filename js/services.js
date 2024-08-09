const elements = document.querySelectorAll(".box-service");
const input = document.querySelector("#input");
elements.forEach((item, index) => {
    item.setAttribute('data-value', `element-${index+1}`);
    const idItem=document.createElement('DIV');
    idItem.textContent=index+1;
    idItem.classList.add('box-service__id')
    item.appendChild(idItem)
    item.addEventListener('click', () => {
        item.classList.toggle('item-select');
        const selectedValues=Array.from(elements)
            .filter(el => el.classList.contains('item-select'))
            .map(el => el.getAttribute('data-value'));
        input.value=selectedValues.join(',')
    });
});
