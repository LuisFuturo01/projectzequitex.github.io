<?php
session_start();
session_unset();
session_destroy();
$params = session_get_cookie_params();
setcookie(session_name(), '', time() - 42000, $params["path"], $params["domain"], $params["secure"], $params["httponly"]);

header("Location: ../html/login.html");
exit();
?>
