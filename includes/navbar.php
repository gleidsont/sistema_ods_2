<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="/sistema_ods/index.php">Sistema ODS</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <?php if (isset($_SESSION['usuario_id'])): ?>
                    <li class="nav-item"><a class="nav-link" href="/sistema_ods/perfil.php">Painel</a></li>
                    <li class="nav-item"><a class="nav-link" href="/sistema_ods/logout.php">Sair</a></li>
                <?php else: ?>
                    <li class="nav-item"><a class="nav-link" href="/sistema_ods/login.php">Login</a></li>
                    <li class="nav-item"><a class="nav-link" href="/sistema_ods/registro.php">Registrar</a></li>
                <?php endif; ?>
            </ul>
        </div>
    </div>
</nav>