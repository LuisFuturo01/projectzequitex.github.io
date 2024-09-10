<?php
session_start();

if (!isset($_SESSION['usuario'])) {
    header("Location: ../html/login.html");
    exit();
}

?>

<!DOCTYPE html>
<html lang='es'>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrito</title>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet preconnect">
    <link rel='icon' href='../img/logo-zequitex-mini.ico' type='image/x-icon'>
    <link rel="stylesheet" href="../css/cart.css">
    <link rel="stylesheet" href="../css/menu.css">
</head>
<body>
    <header id="header-start" class="header-container">
        <div class="header-wrapper">
            <div class="logo-container">
                    <a href="index.html" aria-label="Ir a la página principal" title="ZEQUITEX S.R.L. - Bordados, Estampados y Diseños Computarizados en Bolivia" role="link">
                        <picture class="logo-picture">
                            <source srcset="../img/logo-width.webp" type="image/webp">
                            <source srcset="../img/logo-width.AVIF" type="image/AVIF">
                            <img src="../img/logo-width.AVIF" alt="Logo de ZEQUITEX S.R.L." role="img" />
                        </picture>
                    </a>
            </div>      
            <nav class="menu-navbar-container" role="navigation">
                <ul class="menu-navbar-container__ul" title="Menú de navegación principal"> 
                    <li class="container__division-ul__list">
                        <ul class="navbar-items-list">
                            <li class="navbar-item"><a href="../index.html" title="Inicio" aria-label="Inicio">inicio</a></li>
                            <li class="navbar-item"><a href="../html/about_us.html" title="Sobre Nosotros" aria-label="Sobre Nosotros">nosotros</a></li>
                            <li class="navbar-item"><a href="../html/services.html" title="Servicios" aria-label="Servicios">servicios</a></li>
                            <li class="navbar-item"><a href="../html/products.html" title="Productos" aria-label="Productos">productos</a></li>
                            <li class="navbar-item"><a href="../html/contacts.html" title="Contactos" aria-label="Contactos">contactos</a></li>
                        </ul>
                    </li>
                    <li class="container__division-ul__list">
                        <ul class="navbar-items-list">
                            <li class="navbar-item"><a class="material-symbols-outlined icon-navbar-usser" href="login.html" title="Carrito" aria-label="Carrito">shopping_cart</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <aside class="sidebar-wrapper">
                    <form class="sidebar__form">
                        <input type="checkbox" id="open-menu">
                        <label for="open-menu" class="material-symbols-outlined close-button">flutter</label>
                        <label for="open-menu" class="material-symbols-outlined open-button">flutter</label>
                    </form> 
                    <nav class="sidebar" role="navigation">
                        <ul role="list">
                            <li class='item-sidebar' role="listitem" title="inicio">
                                <div class='list__icon list-property-size'>
                                    <div class="material-symbols-outlined list__icon">home</div>
                                </div>
                                <div class='list__option-text list-property-size'>
                                    <a role="link" class='content-list' href='../index.html' aria-label="Inicio">Inicio</a>
                                </div>
                            </li>
                            <li class='item-sidebar' role="listitem" title="servicios">
                                <div class='list__icon list-property-size'>
                                    <div class="material-symbols-outlined">linked_services</div>
                                </div>
                                <div class='list__option-text list-property-size'>
                                    <a role="link" class='content-list' href='../html/services.html' aria-label="Servicios">servicios</a>
                                </div>
                            </li>
                            <li class='item-sidebar' role="listitem" title="productos">
                                <div class='list__icon list-property-size'>
                                    <div class="material-symbols-outlined">inventory</div>
                                </div>
                                <div class='list__option-text list-property-size'>
                                    <a role="link" class='content-list' href='../html/products.html' aria-label="Productos">productos</a>
                                </div>
                            </li>
                            <li class='item-sidebar' role="listitem" title="sobre nosotros">
                                <div class='list__icon list-property-size'>
                                    <div class="material-symbols-outlined">groups</div>
                                </div>
                                <div class='list__option-text list-property-size'>
                                    <a role="link" class='content-list' href='../html/about_us.html' aria-label="Nosotros">nosotros</a>
                                </div>
                            </li>
                            <li class='item-sidebar' role="listitem" title="contactos">
                                <div class='list__icon list-property-size'>
                                    <div class="material-symbols-outlined">call</div>
                                </div>
                                <div class='list__option-text list-property-size'>
                                    <a role="link" class='content-list' href='../html/contacts.html' aria-label="Productos">contactos</a>
                                </div>
                            </li>
                            <li class='item-sidebar' role="listitem" title="Carrito">
                                <div class='list__icon list-property-size'>
                                    <div class="material-symbols-outlined">shopping_cart</div>
                                </div>
                                <div class='list__option-text list-property-size'>
                                    <a role="link" class='content-list' href='cart.php' aria-label="Carrito">Carrito</a>
                                </div>
                            </li>
                        </ul>
                    </nav>
            </aside>
        </div>
    </header>
    <main>
        <div class="main-wrapper">
            <button class="cerrar-sesion"><a href="logout.php">Cerrar Sesión</a></button>
            <div class="container">
                <h1>Tu Carrito</h1>
                <form method="post" action="buy.php" class="cart-container">
                    <table id="table" border="1">
                    <thead>
                        <tr>
                            <th>Código</th>
                            <th>Nombre del producto</th>
                            <th>Descripción</th>
                            <th>Precio/uni</th>
                            <th>Imagen</th>
                            <th>Cantidad</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                    </tbody>
                    </table>
                    <input class="submit" type="submit" value="pagar" >
                </form>
            </div>
        </div>
    </main>
    <footer class="footer">
        <div class="footer-content">
            <ul class="footer-links">
                <li><a href="../index.html" class="footer-link">Inicio</a></li>
                <li><a href="services.html" class="footer-link">Servicios</a></li>
                <li><a href="products.html" class="footer-link">Productos</a></li>
                <li><a href="about_us.html" class="footer-link">Sobre Nosotros</a></li>
                <li><a href="contacts.html" class="footer-link">Contacto</a></li>
            </ul>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2024 Zequitex S.R.L. Todos los derechos reservados.</p>
        </div>
    </footer>
    <script src="../js/cart.js"></script>
</body>
</html>


