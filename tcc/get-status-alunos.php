<?php
include 'db.php';

if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['aluno_id'])) {
    $aluno_id = $_GET['aluno_id'];

    // Verificar se o aluno possui uma chave emprestada que ainda não foi devolvida
    $sql = "SELECT chave_id FROM emprestimos WHERE aluno_cpf = (SELECT cpf FROM alunos WHERE id = '$aluno_id') AND data_devolucao IS NULL";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        echo "Indisponível";
    } else {
        echo "Disponível";
    }
}
?>
