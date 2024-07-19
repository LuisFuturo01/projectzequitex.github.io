//eliminando el animation-delay, de sidebar, y de open-button
const delaySidebar=()=>{
    document.addEventListener('DOMContentLoaded', function() {
        setTimeout(function() {
            var elements = document.querySelectorAll('.sidebar__form, .sidebar');
            elements.forEach(function(element) {
                element.style.setProperty('animation-delay', '0s');
            });
        }, 5);
    });
};
delaySidebar();
//Fin de eliminando delay del sidebar-open
