<?php
session_start();
include 'includes/header.php';
?>

<div class="container mt-5">
    <div class="text-center mb-4">
        <h1 class="display-5">Sistema de Gestão de Projetos com ODS</h1>
        <p class="lead">Crie projetos, associe aos Objetivos de Desenvolvimento Sustentável (ODS) e exporte seus dados com facilidade.</p>
    </div>

    <?php if (isset($_SESSION['usuario_id'])): ?>
        <div class="text-center">
            <p class="fw-bold">Olá, <?php echo $_SESSION['usuario_nome']; ?>! Você já está logado.</p>
            <a href="perfil.php" class="btn btn-primary">Ir para o painel</a>
        </div>
    <?php else: ?>
        <div class="row justify-content-center">
            <div class="col-md-5">
                <div class="card border-primary">
                    <div class="card-body">
                        <h5 class="card-title">Acesse sua conta</h5>
                        <a href="login.php" class="btn btn-primary w-100 mb-2">Fazer Login</a>
                        <a href="registro.php" class="btn btn-outline-primary w-100">Criar Conta</a>
                    </div>
                </div>
            </div>
        </div>
    <?php endif; ?>
</div>

<?php include 'includes/footer.php'; ?>