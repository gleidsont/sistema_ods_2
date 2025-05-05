<?php
session_start();
include '../../includes/auth_check.php';
include '../../includes/header.php';
include '../../includes/conexao.php';

if ($_SESSION['usuario_perfil'] !== 'admin') {
    header('Location: ../../index.php');
    exit;
}

// Carrega usuários para filtro (opcional)
$usuarios = $conexao->query("SELECT id, nome FROM usuarios ORDER BY nome");

// Filtros
$filtro_usuario = $_GET['usuario'] ?? '';
$filtro_acao = $_GET['acao'] ?? '';
$filtro_tabela = $_GET['tabela'] ?? '';
$filtro_de = $_GET['data_de'] ?? '';
$filtro_ate = $_GET['data_ate'] ?? '';

// Monta SQL com filtros
$sql = "SELECT l.*, u.nome AS nome_usuario
        FROM logs_auditoria l
        LEFT JOIN usuarios u ON l.id_usuario = u.id
        WHERE 1=1";

$params = [];
$types = '';

if ($filtro_usuario) {
    $sql .= " AND l.id_usuario = ?";
    $params[] = $filtro_usuario;
    $types .= 'i';
}
if ($filtro_acao) {
    $sql .= " AND l.acao = ?";
    $params[] = $filtro_acao;
    $types .= 's';
}
if ($filtro_tabela) {
    $sql .= " AND l.tabela_afetada = ?";
    $params[] = $filtro_tabela;
    $types .= 's';
}
if ($filtro_de) {
    $sql .= " AND l.data_hora >= ?";
    $params[] = $filtro_de . " 00:00:00";
    $types .= 's';
}
if ($filtro_ate) {
    $sql .= " AND l.data_hora <= ?";
    $params[] = $filtro_ate . " 23:59:59";
    $types .= 's';
}

$sql .= " ORDER BY l.data_hora DESC";

$stmt = $conexao->prepare($sql);
if (!empty($params)) {
    $stmt->bind_param($types, ...$params);
}
$stmt->execute();
$resultado = $stmt->get_result();
?>

<div class="container mt-4">
    <h3>Logs de Auditoria</h3>

    <form method="GET" class="row g-3 mb-4">
        <div class="col-md-3">
            <label>Usuário</label>
            <select name="usuario" class="form-control">
                <option value="">Todos</option>
                <?php while ($u = $usuarios->fetch_assoc()): ?>
                    <option value="<?= $u['id']; ?>" <?= ($filtro_usuario == $u['id']) ? 'selected' : '' ?>>
                        <?= htmlspecialchars($u['nome']); ?>
                    </option>
                <?php endwhile; ?>
            </select>
        </div>
        <div class="col-md-2">
            <label>Ação</label>
            <select name="acao" class="form-control">
                <option value="">Todas</option>
                <option value="INSERT" <?= ($filtro_acao == 'INSERT') ? 'selected' : '' ?>>INSERT</option>
                <option value="UPDATE" <?= ($filtro_acao == 'UPDATE') ? 'selected' : '' ?>>UPDATE</option>
                <option value="DELETE" <?= ($filtro_acao == 'DELETE') ? 'selected' : '' ?>>DELETE</option>
            </select>
        </div>
        <div class="col-md-2">
            <label>Tabela</label>
            <input type="text" name="tabela" class="form-control" value="<?= htmlspecialchars($filtro_tabela); ?>">
        </div>
        <div class="col-md-2">
            <label>Data de</label>
            <input type="date" name="data_de" class="form-control" value="<?= $filtro_de; ?>">
        </div>
        <div class="col-md-2">
            <label>Data até</label>
            <input type="date" name="data_ate" class="form-control" value="<?= $filtro_ate; ?>">
        </div>
        <div class="col-md-1 d-flex align-items-end">
            <button type="submit" class="btn btn-primary w-100">Filtrar</button>
        </div>
    </form>

    <table class="table table-bordered table-hover table-striped">
        <thead class="table-light">
            <tr>
                <th>Data/Hora</th>
                <th>Usuário</th>
                <th>Ação</th>
                <th>Tabela</th>
                <th>ID Projeto</th>
                <th>Detalhes</th>
            </tr>
        </thead>
        <tbody>
            <?php if ($resultado->num_rows > 0): ?>
                <?php while ($log = $resultado->fetch_assoc()): ?>
                    <tr>
                        <td><?= date('d/m/Y H:i', strtotime($log['data_hora'])); ?></td>
                        <td><?= htmlspecialchars($log['nome_usuario'] ?? 'Desconhecido'); ?></td>
                        <td><?= htmlspecialchars($log['acao']); ?></td>
                        <td><?= htmlspecialchars($log['tabela_afetada']); ?></td>
                        <td><?= $log['id_registro']; ?></td>
                        <td><?= nl2br(htmlspecialchars($log['detalhes'])); ?></td>
                    </tr>
                <?php endwhile; ?>
            <?php else: ?>
                <tr><td colspan="6" class="text-center">Nenhum log encontrado.</td></tr>
            <?php endif; ?>
        </tbody>
    </table>
</div>

<?php include '../../includes/footer.php'; ?>