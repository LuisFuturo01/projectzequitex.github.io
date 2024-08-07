<?php
    if (isset($_POST['selectedProducts'])) {
        $selectedProducts = $_POST['selectedProducts'];
        $productsArray = explode(',', $selectedProducts);
        $productsArray = array_map('trim', $productsArray);

        foreach ($productsArray as $product) {
            echo htmlspecialchars($product) . "<br>";
        }
    } else {
        echo "No se han seleccionado productos.";
    }

?>

//*<?php
//*session_start();

// Configuração da pasarela de pagamento e conexão com o banco de dados
//*require 'vendor/autoload.php';
//*$conn = new mysqli("localhost", "tu_usuario", "tu_senha", "tu_banco_de_dados");
//*
//*// Verificar se a sessão está iniciada
//*if (!isset($_SESSION['usuario_id'])) {
//*    die('Você precisa fazer login para realizar um pagamento.');
//*}
//*
//*// Obter os dados do formulário
//*$data = json_decode(file_get_contents('php://input'), true);
//*
//*// Validar os dados
//*// ...
//*
//*// Encriptar os dados sensíveis
//*// ...
//*
//*// Criar a solicitação para a pasarela de pagamento
//*$response = $client->createPayment([
//*    // ... (dados da solicitação)
//*]);
//*
//*// Processar a resposta e salvar a informação no banco de dados
//*if ($response->isSuccessful()) {
//*    // ... (salvar dados no banco de dados)
//*    // Enviar email de confirmação
//*    // ...
//*} else {
//*    // ... (salvar dados no banco de dados)
//*    // Enviar email de erro
//*    // ...
//*}