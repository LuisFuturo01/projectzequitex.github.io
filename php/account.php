<?php
include('conect.php');
session_start();
$usuario = $_SESSION['usuario'];
$consulta = "SELECT nombre_completo,ci,correo,contraseña,telefono,direccion,usuario FROM clientes WHERE clienteID = $usuario";
$respuesta = $conn->query($consulta);
$cliente = $respuesta->fetch_assoc();

?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="robots" content="noindex">
    <title>Cuenta</title>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet preconnect">
    <link rel='icon' href='../img/logo-zequitex-mini.ico' type='image/x-icon'>
    <link rel="stylesheet" href="../css/menu.css">
    <link rel="stylesheet" href="../css/cursor.css">
    <link rel="stylesheet" href="../css/accountt.css">
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
                            <li class="navbar-item"><a class="material-symbols-outlined icon-navbar-usser" href="cart.php" title="Carrito" aria-label="Carrito">shopping_cart</a></li>
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
        <div class="return">
            <a href="cart.php" class="material-symbols-outlined">arrow_back</a>
        </div>
        <div class="main-wrapper account-wrapper">
            <div class="account-header">
                <h1 class="account-title">Mi Cuenta</h1>
            </div>
            <div class="account-container">
                <form id="account-form" class="account-form" method="POST" action="actualizar_cuenta.php">
                    <div class="form-group">
                        <label for="nombre_completo">Nombre completo:</label>
                        <input type="text" id="nombre_completo" name="nombre_completo" value="<?php echo $cliente['nombre_completo']; ?>" readonly autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="ci">CI:</label>
                        <input type="text" id="ci" name="ci" value="<?php echo $cliente['ci']; ?>" readonly autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="correo">Correo:</label>
                        <input type="email" id="correo" name="correo" value="<?php echo $cliente['correo']; ?>" readonly autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="contraseña_actual">Contraseña actual:</label>
                        <input type="text" id="contraseña_actual" name="contraseña_actual" value="" readonly autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="contraseña_nueva">Contraseña nueva:</label>
                        <input type="text" id="contraseña_nueva" name="contraseña_nueva" value="" readonly autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="telefono">Teléfono:</label>
                        <input type="tel" id="telefono" name="telefono" value="<?php echo $cliente['telefono']; ?>" readonly autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="direccion">Dirección:</label>
                        <input type="text" id="direccion" name="direccion" value="<?php echo $cliente['direccion']; ?>" readonly autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="usuario">Usuario:</label>
                        <input type="text" id="usuario" name="usuario" value="<?php echo $cliente['usuario']; ?>" readonly autocomplete="off">
                    </div>
                    <div class="form-actions">
                        <button type="button" id="edit-btn" class="action-btn">Editar</button>
                        <button type="button" id="cancel-btn" class="action-btn" style="display: none;">Cancelar</button>
                        <button type="submit" id="save-btn" class="action-btn" style="display: none;">Guardar</button>
                    </div>
                </form>
            </div>
        </div>
    </main>
    <footer class="footer">
        <div class="footer-content">
            <ul class="footer-links">
                <li><a href="../index.html" class="footer-link">Inicio</a></li>
                <li><a href="../html/services.html" class="footer-link">Servicios</a></li>
                <li><a href="../html/products.html" class="footer-link">Productos</a></li>
                <li><a href="../html/about_us.html" class="footer-link">Sobre Nosotros</a></li>
                <li><a href="../html/contacts.html" class="footer-link">Contacto</a></li>
            </ul>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2024 Zequitex S.R.L. Todos los derechos reservados.</p>
        </div>
    </footer>
    <script src="../js/cursor.js"></script>
    <script src="../js/account.js"></script>
</body>
</html>
