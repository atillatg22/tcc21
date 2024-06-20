<?php
include 'db.php';

if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['chave_id'])) {
    $chave_id = $_GET['chave_id'];

    // Verificar se a chave está emprestada e não foi devolvida
    $sql = "SELECT aluno_cpf FROM emprestimos WHERE chave_id = '$chave_id' AND data_devolucao IS NULL";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        echo "Indisponível";
    } else {
        echo "Disponível";
    }
}
?>
