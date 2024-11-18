
//creando el cursor personalizado
const cursorHTML = `
    <div class="c-cursor js-cursor">
        <div class="c-cursor__inner"></div>
    </div>
`;
document.body.insertAdjacentHTML('beforeend', cursorHTML);
isTouchDevice=()=>{
    return (("ontouchstart" in window) || (navigator.maxTouchPoints>0) || (navigator.msMaxTouchPoints>0));
};


const isTouch= isTouchDevice();
if(isTouch || !isTouch){
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




