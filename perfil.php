<?php
session_start();
include 'includes/auth_check.php'; // Garante que está logado
include 'includes/header.php';
?>

<div class="container mt-5">
    <div class="text-center">
        <h2>Bem-vindo, <?php echo $_SESSION['usuario_nome']; ?>!</h2>
        <p class="lead">Perfil: <strong><?php echo ucfirst($_SESSION['usuario_perfil']); ?></strong></p>
    </div>

    <div class="row justify-content-center mt-4">
        <?php if ($_SESSION['usuario_perfil'] === 'admin'): ?>
            <div class="col-md-4 mb-3">
                <a href="admin/ods/listar.php" class="btn btn-primary w-100">Gerenciar Fatores</a>
            </div>
            <div class="col-md-4 mb-3">
                <a href="admin/usuarios/gerenciar.php" class="btn btn-primary w-100">Gerenciar Usuários</a>
            </div>
        <?php endif; ?>

        <div class="col-md-4 mb-3">
            <a href="projetos/criar.php" class="btn btn-primary w-100">Criar Novo Projeto</a>
        </div>

        <div class="col-md-4 mb-3">
            <a href="projetos/listar.php" class="btn btn-primary w-100">Meus Projetos</a>
        </div>

        <div class="col-md-4 mb-3">
            <a href="ods/associar.php" class="btn btn-primary w-100">Associar Fatores a Projetos</a>
        </div>

        <div class="col-md-4 mb-3">
            <a href="export/excel.php" class="btn btn-outline-success w-100">Exportar para Excel</a>
        </div>

        <div class="col-md-4 mb-3">
            <a href="admin/logs/logs.php" class="btn btn-outline-dark w-100">Logs (Auditoria)</a>
        </div>

        <div class="col-md-4 mb-3">
            <a href="logout.php" class="btn btn-danger w-100">Sair</a>
        </div>
    </div>
</div>

<?php include 'includes/footer.php'; ?>