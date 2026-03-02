<style>
    /* Container do ícone para posicionar o tooltip */
    .info-container {
        position: relative;
        display: inline-block;
    }

    .info-container:hover .info-tooltip {
        visibility: visible;
        opacity: 1;
    }

    /* Estilo do ícone "i" */
    .info-icon {
        display: flex;
        align-items: center;
        justify-content: center;
        width: 24px;
        height: 24px;
        background-color: #1a73e8;
        color: white;
        border-radius: 50%;
        font-size: 14px;
        font-weight: bold;
        font-family: "Georgia", serif;
        font-style: italic;
        cursor: help;
        transition: background-color 0.2s;
    }

    .info-icon:hover {
        background-color: #1558b0;
    }

    /* Estilo do Tooltip (balão de informação) */
    .info-tooltip {
        visibility: hidden;
        width: 280px;
        background-color: #333;
        color: #fff;
        text-align: center;
        border-radius: 6px;
        padding: 10px;
        position: absolute;
        z-index: 1;
        bottom: 125%;
        /* Posiciona acima do ícone */
        left: 50%;
        margin-left: -140px;
        /* Centraliza o balão */
        opacity: 0;
        transition: opacity 0.3s;
        font-size: 13px;
        line-height: 1.4;
        font-style: normal;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    }

    /* Setinha do balão */
    .info-tooltip::after {
        content: "";
        position: absolute;
        top: 100%;
        left: 50%;
        margin-left: -5px;
        border-width: 5px;
        border-style: solid;
        border-color: #333 transparent transparent transparent;
    }
</style>
<?php
session_start();
include '../includes/auth_check.php';

include '../includes/conexao.php';
include_once '../includes/logs.php';

$id_projeto = $_GET['id'] ?? null;
if (!$id_projeto) {
    header("Location: listar.php");
    exit;
}

$is_admin = $_SESSION['usuario_perfil'] === 'admin';
$id_usuario = $_SESSION['usuario_id'];

// Verifica se o projeto pertence ao usuário ou se é admin
$sql = $is_admin
    ? "SELECT * FROM projetos WHERE id = ?"
    : "SELECT * FROM projetos WHERE id = ? AND id_usuario = ?";

$stmt = $conexao->prepare($sql);
if ($is_admin) {
    $stmt->bind_param("i", $id_projeto);
} else {
    $stmt->bind_param("ii", $id_projeto, $id_usuario);
}
$stmt->execute();
$projeto = $stmt->get_result()->fetch_assoc();

if (!$projeto) {
    echo "<div class='container mt-4 alert alert-danger'>Projeto não encontrado ou acesso negado.</div>";
    include '../includes/footer.php';
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nome = trim($_POST['nome_projeto']);
    $pais = trim($_POST['pais']);
    $local = trim($_POST['local']);
    $localizacao = trim($_POST['localizacao']);
    $painel_pbi = trim($_POST['painel_pbi']);
    $descricao = trim($_POST['descricao']);

    $stmt = $conexao->prepare("UPDATE projetos SET nome_projeto = ?, pais = ?, local = ?, localizacao = ?, painel_pbi = ?, descricao = ? WHERE id = ?");
    $stmt->bind_param("ssssssi", $nome, $pais, $local, $localizacao, $painel_pbi, $descricao, $id_projeto);
    $stmt->execute();

    registrar_log($conexao, $_SESSION['usuario_id'], 'UPDATE', 'projetos', $id_projeto, "Projeto editado: $nome");
    header("Location: listar.php");
    exit;
}
include '../includes/header.php';
?>

<div class="container mt-4">
    <h3>Editar Projeto</h3>

    <form method="POST">
        <div class="mb-3">
            <label for="nome_projeto" class="form-label">Nome do Projeto</label>
            <input type="text" name="nome_projeto" id="nome_projeto" class="form-control" required value="<?= htmlspecialchars($projeto['nome_projeto']); ?>">
        </div>
        <div class="mb-3">
            <label for="pais" class="form-label">País</label>
            <input type="text" name="pais" id="pais" class="form-control" value="<?= htmlspecialchars($projeto['pais']); ?>">
        </div>
        <div class="mb-3">
            <label for="local" class="form-label">Local</label>
            <input type="text" name="local" id="local" class="form-control" value="<?= htmlspecialchars($projeto['local']); ?>">
        </div>
        <div class="mb-3">
            <label for="localizacao" class="form-label">Localização</label>
            <div class="info-container">
                <div class="info-icon">i</div>
                <div class="info-tooltip">
                    Para criar um link de localização, acesse este site: <br>
                    <a href="https://www.google.com/maps/d/?hl=pt-BR" target="_blank">https://www.google.com/maps/d/?hl=pt-BR</a> <br>
                    Crie um novo mapa, defina a área do território e coloque o link neste espaço
                </div>
            </div>
            <input type="text" name="localizacao" id="localizacao" class="form-control" value="<?= htmlspecialchars($projeto['localizacao']); ?>">
        </div>
        <div class="mb-3">
            <label for="painel_pbi" class="form-label">Link Painel Power BI</label>
            <div class="info-container">
                <div class="info-icon">i</div>
                <div class="info-tooltip">
                    O painel será criado após a Oficina
                </div>
            </div>
            <input type="text" name="painel_pbi" id="painel_pbi" class="form-control" value="<?= htmlspecialchars($projeto['painel_pbi']); ?>">
        </div>
        <div class="mb-3">
            <label for="descricao" class="form-label">Descrição</label>
            <textarea name="descricao" id="descricao" rows="4" class="form-control"><?= htmlspecialchars($projeto['descricao']); ?></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Salvar Alterações</button>
        <a href="listar.php" class="btn btn-secondary">Cancelar</a>
    </form>
</div>

<?php include '../includes/footer.php'; ?>