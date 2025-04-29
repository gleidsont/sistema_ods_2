<?php
session_start();
include '../includes/auth_check.php';
include '../includes/header.php';
include '../includes/conexao.php';

$id_projeto = $_GET['id'] ?? null;
if (!$id_projeto) {
    header("Location: listar.php");
    exit;
}

// Valida se o projeto pertence ao usuário (caso não seja admin)
$is_admin = $_SESSION['usuario_perfil'] === 'admin';
$id_usuario = $_SESSION['usuario_id'];

$sql = $is_admin
    ? "SELECT * FROM projetos WHERE id = ?"
    : "SELECT * FROM projetos WHERE id = ? AND id_usuario = ?";

$stmt = $conexao->prepare($sql);
$is_admin ? $stmt->bind_param("i", $id_projeto) : $stmt->bind_param("ii", $id_projeto, $id_usuario);
$stmt->execute();
$projeto = $stmt->get_result()->fetch_assoc();

if (!$projeto) {
    echo "<div class='container mt-4 alert alert-danger'>Projeto não encontrado ou acesso não autorizado.</div>";
    include '../includes/footer.php';
    exit;
}

// Pega as ODS associadas
$stmt = $conexao->prepare("SELECT o.* FROM projetos_ods po JOIN ods o ON po.id_ods = o.id WHERE po.id_projeto = ?");
$stmt->bind_param("i", $id_projeto);
$stmt->execute();
$ods_lista = $stmt->get_result();
?>

<div class="container mt-4">
    <h3><?php echo $projeto['nome_projeto']; ?></h3>
    <p><strong>Descrição:</strong> <?php echo $projeto['descricao']; ?></p>
    <p><strong>Criado em:</strong> <?php echo date('d/m/Y H:i', strtotime($projeto['criado_em'])); ?></p>

    <hr>
    <h5>ODS Associadas:</h5>

    <?php if ($ods_lista->num_rows > 0): ?>
        <div class="row">
            <?php while ($ods = $ods_lista->fetch_assoc()): ?>
                <div class="col-md-3 mb-3">
                    <div class="card">
                        <div class="card-header bg-light">
                            <strong>ODS <?php echo $ods['numero_item']; ?>:</strong> <?php echo $ods['fatores']; ?>
                        </div>
                        <div class="card-body">
                            
                            <div class="d-flex flex-wrap">
                                <?php
                                $tipos = ['A' => 'ameaca', 'V' => 'vulnerabilidade', 'R' => 'resiliencia', 'S' => 'sagrado'];
                                foreach ($tipos as $sigla => $coluna) {
                                    if (!empty($ods["imagem_$coluna"])) {
                                        echo "<img src='../assets/img/{$ods["imagem_$coluna"]}' title='$coluna' width='60' class='me-2 mb-2'>";
                                    }
                                }
                                ?>
                            </div>
                        </div>
                    </div>
                </div>
            <?php endwhile; ?>
        </div>
    <?php else: ?>
        <div class="alert alert-warning">Nenhuma ODS associada a este projeto.</div>
    <?php endif; ?>
</div>

<?php include '../includes/footer.php'; ?>