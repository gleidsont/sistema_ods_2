<?php
session_start();
include '../../includes/auth_check.php';


if ($_SESSION['usuario_perfil'] !== 'admin') {
    header('Location: ../../index.php');
    exit;
}
include '../../includes/header.php';
include '../../includes/conexao.php';

$usuarios = $conexao->query("SELECT id, nome, email, perfil, ativo, criado_em FROM usuarios ORDER BY criado_em DESC");
?>

<div class="container mt-4">
    <h3>Usuários Cadastrados</h3>

    <table class="table table-bordered table-hover">
        <thead class="table-light">
            <tr>
                <th>Nome</th>
                <th>E-mail</th>
                <th>Perfil</th>
                <th>Data de Cadastro</th>
                <th>Status</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($usuario = $usuarios->fetch_assoc()): ?>
                <tr>
                    <td><?php echo $usuario['nome']; ?></td>
                    <td><?php echo $usuario['email']; ?></td>
                    <td><?php echo ucfirst($usuario['perfil']); ?></td>
                    <td><?php echo date('d/m/Y H:i', strtotime($usuario['criado_em'])); ?></td>
                    <td><?php echo $usuario['ativo'] ? 'Ativo' : 'Bloqueado'; ?></td>
                    <td>
                        <a href="editar.php?id=<?php echo $usuario['id']; ?>" class="btn btn-sm btn-warning">Editar</a>
                        
                        <?php if ($usuario['ativo']): ?>
                            <a href="toggle_status.php?id=<?php echo $usuario['id']; ?>&acao=bloquear" class="btn btn-sm btn-secondary">Bloquear</a>
                        <?php else: ?>
                            <a href="toggle_status.php?id=<?php echo $usuario['id']; ?>&acao=ativar" class="btn btn-sm btn-success">Ativar</a>
                        <?php endif; ?>

                        <a href="excluir.php?id=<?php echo $usuario['id']; ?>" class="btn btn-sm btn-danger" onclick="return confirm('Tem certeza que deseja excluir este usuário?')">Excluir</a>
                    </td>
                </tr>
            <?php endwhile; ?>
        </tbody>
    </table>
</div>

<?php include '../../includes/footer.php'; ?>