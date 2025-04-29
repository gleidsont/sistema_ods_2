<?php
session_start();
include '../includes/auth_check.php';
include '../includes/header.php';
include '../includes/conexao.php';

$id_usuario = $_SESSION['usuario_id'];
$mensagem = '';

// Carrega os projetos do usuário
$projetos = $conexao->query("SELECT id, nome_projeto FROM projetos WHERE id_usuario = $id_usuario");

// Carrega todas as ODS
$ods = $conexao->query("SELECT * FROM ods ORDER BY numero_item ASC");

// Ao submeter
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $projeto_id = $_POST['projeto_id'];
    $ods_ids = $_POST['ods_ids'] ?? [];

    // Remove associações anteriores
    $stmt = $conexao->prepare("DELETE FROM projetos_ods WHERE id_projeto = ?");
    $stmt->bind_param("i", $projeto_id);
    $stmt->execute();

    // Insere novas associações
    foreach ($ods_ids as $id_ods) {
        $stmt = $conexao->prepare("INSERT INTO projetos_ods (id_projeto, id_ods) VALUES (?, ?)");
        $stmt->bind_param("ii", $projeto_id, $id_ods);
        $stmt->execute();
    }

    $mensagem = "Associações atualizadas com sucesso!";
}
?>

<div class="container mt-4">
    <h3>Associar ODS a Projeto</h3>

    <?php if ($mensagem): ?>
        <div class="alert alert-success"><?php echo $mensagem; ?></div>
    <?php endif; ?>

    <form method="POST">
        <div class="form-group mb-3">
            <label>Escolha o Projeto:</label>
            <select name="projeto_id" class="form-control" required>
                <option value="">Selecione...</option>
                <?php while ($proj = $projetos->fetch_assoc()): ?>
                    <option value="<?php echo $proj['id']; ?>"><?php echo $proj['nome_projeto']; ?></option>
                <?php endwhile; ?>
            </select>
        </div>

        <div class="form-group mb-3">
            <label>Marque as ODS que deseja associar:</label>
            <div class="row">
                <?php while ($item = $ods->fetch_assoc()): ?>
                    <div class="col-md-4 mb-2">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="ods_ids[]" value="<?php echo $item['id']; ?>" id="ods_<?php echo $item['id']; ?>">
                            <label class="form-check-label" for="ods_<?php echo $item['id']; ?>">
                                <?php echo $item['numero_item'] . ' - ' . $item['nome_ods']; ?>
                            </label>
                        </div>
                    </div>
                <?php endwhile; ?>
            </div>
        </div>

        <button type="submit" class="btn btn-primary">Salvar Associações</button>
    </form>
</div>

<?php include '../includes/footer.php'; ?>