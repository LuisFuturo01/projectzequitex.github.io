<?php
session_start();

if (empty($_SESSION['remember']) || $_SESSION['remember']==false) {
    session_unset();
    session_destroy();
    echo json_encode(['status' => 'destroyed']);
} else {
    echo json_encode(['status' => 'active']);
}
?>
