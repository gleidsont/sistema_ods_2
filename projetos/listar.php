<?php
session_start();
include '../includes/auth_check.php';
include '../includes/header.php';
include '../includes/conexao.php';

$usuario_id = $_SESSION['usuario_id'];
$is_admin = $_SESSION['usuario_perfil'] === 'admin';

if ($is_admin) {
    $sql = "SELECT p.*, u.nome AS criador FROM projetos p JOIN usuarios u ON p.id_usuario = u.id ORDER BY p.criado_em DESC";
} else {
    $sql = "SELECT * FROM projetos WHERE id_usuario = $usuario_id ORDER BY criado_em DESC";
}

$resultado = $conexao->query($sql);
?>

<div class="container mt-4">
    <h3>Projetos</h3>

    <table class="table table-bordered table-hover">
        <thead class="table-light">
            <tr>
                <th>Nome</th>
                <th>Descrição</th>
                <?php if ($is_admin): ?><th>Criado por</th><?php endif; ?>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($row = $resultado->fetch_assoc()): ?>
                <tr>
                    <td><?php echo $row['nome_projeto']; ?></td>
                    <td><?php echo $row['descricao']; ?></td>
                    <?php if ($is_admin): ?><td><?php echo $row['criador']; ?></td><?php endif; ?>
                    <td>
                        <a href="visualizar.php?id=<?php echo $row['id']; ?>" class="btn btn-sm btn-primary">Ver</a>

                        <?php if ($is_admin): ?>
                            <a href="editar.php?id=<?php echo $row['id']; ?>" class="btn btn-sm btn-warning">Editar</a>
                            <a href="excluir.php?id=<?php echo $row['id']; ?>" class="btn btn-sm btn-danger" onclick="return confirm('Tem certeza?')">Excluir</a>
                        <?php endif; ?>
                    </td>
                </tr>
            <?php endwhile; ?>
        </tbody>
    </table>
</div>

<?php include '../includes/footer.php'; ?>