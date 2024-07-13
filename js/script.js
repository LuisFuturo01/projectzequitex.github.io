//creando el cursor personalizado
isTouchDevice=()=>{
    return (("ontouchstart" in window) || (navigator.maxTouchPoints>0) || (navigator.msMaxTouchPoints>0));
};
const isTouch= isTouchDevice();
if(!isTouch){
    const cursorEl = document.querySelector(".js-cursor");
    const isClickedClass="is-clicked";
    const isHiddenClass="is-hidden";
    const isLinkHoveredClass="is-link-hovered";
    const hasCustomCursosClass="has-custom-cursor";

    const cursorPersonality = () =>{
        document.addEventListener("mousemove", onMouseMove);
        document.addEventListener("mousedown", onMouseDown);
        document.addEventListener("mouseup", onMouseUp);
        document.addEventListener("mouseenter", onMouseEnter);
        document.addEventListener("mouseleave", onMouseLeave);
        handleLinkHoverEvents();
    };
    const onMouseMove =(e)=>{
        cursorEl.style.setProperty("--cursor-x", e.clientX + "px");
        cursorEl.style.setProperty("--cursor-y", e.clientY + "px");
    };
    const onMouseDown=()=>{
        cursorEl.classList.add(isClickedClass);
    };
    const onMouseUp=()=>{
        cursorEl.classList.remove(isClickedClass);
    };
    const onMouseEnter=()=>{
        cursorEl.classList.remove(isHiddenClass);
    }
    const onMouseLeave=()=>{
        cursorEl.classList.add(isHiddenClass);
    }
    const handleLinkHoverEvents = () => {
        document.querySelectorAll("a, button, .js-link, input, label").forEach((el) => {
            el.addEventListener("mouseover", () => cursorEl.classList.add(isLinkHoveredClass));
            el.addEventListener("mouseout", () => cursorEl.classList.remove(isLinkHoveredClass));
        });
    };
    cursorPersonality();
    document.body.classList.add(hasCustomCursosClass);
}
//Fin creando cursor personalizado

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
//añadiendo triángulos locos al section principal
const groupTriangles = document.getElementById("group-triangles");

const addTriangles = (numTriangles) => {
    for (let i = 0; i < numTriangles; i++) {
        const transformX = Math.random() * 93;
        const transformY = Math.random() * 7.2;
        const rotation = calculateRotation(transformX, transformY);
        const codePathTriangles = `
            <g style="transform: translate(${transformX}%, ${transformY}vh) rotate(${rotation}deg);" class="g-triangle">
                <path class="path-triangle" d="M0 0 8 1 2 7 3 3 0 0" />
            </g>
        `;
        groupTriangles.insertAdjacentHTML('beforeend', codePathTriangles);
    };
};
const updateTriangles = () => {
    const triangles = document.querySelectorAll('.g-triangle');
    triangles.forEach(triangle => {
        const transformX = Math.random() * 93;
        const transformY = Math.random() * 7.2;
        const rotation = calculateRotation(transformX, transformY);
        triangle.style.transform = `translate(${transformX}%, ${transformY}vh) rotate(${rotation}deg)`;
    });
};
const calculateRotation = (x, y) => {
    const angle = Math.atan2(y - 50, x - 50) * (180 / Math.PI);
    const speedFactor = 6;
    return angle * speedFactor;
};
setInterval(updateTriangles, 5000);
addTriangles(20);
//acabando el efecto triángulos locos