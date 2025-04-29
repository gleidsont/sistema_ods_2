<?php
session_start();
include '../../includes/auth_check.php';
include '../../includes/header.php';

if ($_SESSION['usuario_perfil'] !== 'admin') {
    header('Location: ../../index.php');
    exit;
}

include '../../includes/conexao.php';

$sql = "SELECT * FROM ods ORDER BY numero_item ASC";
$resultado = $conexao->query($sql);
?>

<div class="container mt-4">
    <h3>Lista de ODS</h3>
    <a href="cadastrar.php" class="btn btn-success mb-3">+ Cadastrar Nova ODS</a>

    <table class="table table-bordered table-hover">
        <thead class="table-light">
            <tr>
                <th>Nº</th>
                <th>Nome</th>
                <th>Metas IPEA</th>
                <th>Imagens</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($row = $resultado->fetch_assoc()): ?>
                <tr>
                    <td><?php echo $row['numero_item']; ?></td>
                    <td><?php echo $row['nome_ods']; ?></td>
                    <td><?php echo $row['metas_ipea']; ?></td>
                    <td>
                        <?php
                        $tipos = ['A' => 'ameaca', 'V' => 'vulnerabilidade', 'R' => 'resiliencia', 'S' => 'sagrado'];
                        foreach ($tipos as $sigla => $coluna) {
                            if (!empty($row["imagem_$coluna"])) {
                                echo "<img src='../../assets/img/{$row["imagem_$coluna"]}' width='40' class='me-1' title='$coluna'>";
                            }
                        }
                        ?>
                    </td>
                    <td>
                        <a href="editar.php?id=<?php echo $row['id']; ?>" class="btn btn-sm btn-warning">Editar</a>
                        <a href="excluir.php?id=<?php echo $row['id']; ?>" class="btn btn-sm btn-danger" onclick="return confirm('Tem certeza?')">Excluir</a>
                    </td>
                </tr>
            <?php endwhile; ?>
        </tbody>
    </table>
</div>

<?php include '../../includes/footer.php'; ?>