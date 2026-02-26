<nav class="navbar bg-dark border-bottom border-body navbar-expand-lg bg-body-tertiary" data-bs-theme="dark" id="navbarScroll">
    <div class="container-fluid">
<!-- <a href="javascript:history.back()" class="btn btn-sm btn-outline-primary me-3">⬅ Voltar Página</a> Retirado provisóriamente-->
        <a class="navbar-brand" href="/index.php">PGT - Plataforma de Gestão Territorial</a>   
    
    <?php if (isset($_SESSION['usuario_id'])):?>

    <ul class="navbar-nav me-auto my-1 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="/index.php">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="/perfil.php">Painel</a>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Projetos
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/projetos/criar.php">Criar Novo Projeto</a></li>
            <li><a class="dropdown-item" href="/projetos/listar.php">Meus Projetos</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="/ods/associar.php">Associar Fatores a Projetos</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="/export/excel.php">Exportar tudo para Excel</a></li>
          </ul>
        </li>


        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Fatores
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/admin/ods/listar.php">Gerenciar Fatores</a></li>
            <li><a class="dropdown-item" href="/admin/ods/cadastrar.php">Cadastrar Novos Fatores</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="/ods/associar.php">Associar Fatores a Projetos</a></li>
          </ul>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Usuários
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/admin/usuarios/gerenciar.php">Gerenciar Usuários</a></li>
            <li><a class="dropdown-item" href="#">Criar Usuários (em desenvolvimento)</a></li>
            <li><a class="dropdown-item" href="#">Resetar Senha (em desenvolvimento)</a></li>
            <li><a class="dropdown-item" href="/admin/logs/logs.php">Logs (Auditoria)</a></li>
          </ul>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            ODK
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href= "/ODK/codigo_export_odk.php">Código Export ODK</a></li>
            <li><a class="dropdown-item" href= "/ODK/tabulacao.php">Tabulação</a></li>
          </ul>            
        </li>
        
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="/logout.php">Sair</a>
        </li>

        <?php else: ?>
            <li class="nav-item">
                <a class="nav-link" href="/login.php">Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/registro.php">Registrar</a>
            </li>
        <?php endif; ?>  
        
      </ul>
    </div>
    </div>
    </div>
</nav>