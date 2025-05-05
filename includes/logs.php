<?php
function registrar_log($conexao, $id_usuario, $acao, $tabela, $id_registro, $detalhes = '') {
    $stmt = $conexao->prepare("INSERT INTO logs_auditoria (id_usuario, acao, tabela_afetada, id_registro, detalhes) VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param("issis", $id_usuario, $acao, $tabela, $id_registro, $detalhes);
    $stmt->execute();
}
?>