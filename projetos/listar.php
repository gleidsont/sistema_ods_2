<?php
session_start();
include '../includes/auth_check.php';
include '../includes/header.php';
include '../includes/conexao.php';

$usuario_id = $_SESSION['usuario_id'];
$is_admin = $_SESSION['usuario_perfil'] === 'admin';

if ($is_admin) {
    $sql = "SELECT  projetos.id, 	
                    projetos.id_usuario, 	
                    projetos.nome_projeto, 	
                    projetos.descricao, 	
                    projetos.criado_em, 	 
                    usuarios.nome AS criador 
            FROM projetos 
            INNER JOIN usuarios ON projetos.id_usuario = usuarios.id 
            ORDER BY projetos.criado_em DESC";
} else {
    $sql = "SELECT * FROM projetos WHERE id_usuario = $usuario_id ORDER BY criado_em DESC";
}

function renderProgressBar($estagioAtual, $projetoId) {  
                            $estagios = [  
                                1 => 'Georreferen-ciamento',  
                                2 => 'Escolha dos Fatores',  
                                3 => 'Formulário de Coleta',  
                                4 => 'Mapa com os Ícones',
                                5 => 'Mapa de Risco',    
                                6 => 'Plano de Ação'  
                            ];  
                            
                            echo '<div class="progress-container">';  
                            echo '<div class="progress-steps">';  
                            
                            foreach ($estagios as $numero => $nome) {  
                                $classes = 'step';  
                                if ($numero < $estagioAtual) {  
                                    $classes .= ' active completed';  
                                } elseif ($numero == $estagioAtual) {  
                                    $classes .= ' active';  
                                }  
                                
                                echo "<div class='$classes'>";  
                                echo "<div class='step-circle'>$numero</div>";  
                                echo "<div class='step-label'>$nome</div>";  
                                echo "</div>";  
                            }  
                            
                            echo '</div>';  
                            echo '<div class="progress-bar">';  
                            echo '<div class="progress-fill" id="progressFill-' . $projetoId . '"></div>';
                            echo '</div>';  
                            echo '</div>';  
                        } 

$resultado = $conexao->query($sql);
?>
<link rel="stylesheet" href="../assets/css/barra_progresso.css">
<div class="container mt-4">
    <h3>Projetos</h3>

    <table class="table table-bordered table-hover">
        <thead class="table-light">
            <tr>
                <th>Nome</th>
                <th>Ações</th>
                <th>Progresso</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($row = $resultado->fetch_assoc()): ?>
                <tr>
                    <td>Projeto: <?php echo $row['nome_projeto']; ?> <br>
                        Data: <?php echo $row['criado_em']; ?> <br>
                        País:  <br>
                        Local:  <br>
                        Criado por: <?php echo $row['criador']; ?> 
                    </td>
                    <td>
                        <a href="../ods/associar.php?projeto_id=<?php echo $row['id']; ?>" class="btn btn-sm btn-primary">Associar Fatores</a> <br>
                        <a href="visualizar.php?id=<?php echo $row['id']; ?>" class="btn btn-sm btn-primary">Visualizar Fatores</a> <br>
                        <a href="../export/exportar_projeto.php?id=<?= $row['id']; ?>" class="btn btn-sm btn-success">Exportar Excel</a> <br>
                        <a href="../export/exportar_projeto_zip.php?id=<?= $row['id']; ?>" class="btn btn-sm btn-secondary">Baixar imagens</a> <br>

                        <?php if ($is_admin): ?>
                            <a href="editar.php?id=<?php echo $row['id']; ?>" class="btn btn-sm btn-warning">Editar</a> <br>
                            <a href="excluir.php?id=<?php echo $row['id']; ?>" class="btn btn-sm btn-danger" onclick="return confirm('Tem certeza?')">Excluir</a>
                        <?php endif; ?>
                    </td>
                    <td><?php  
                        $estagioAtual = 3;
                        // Renderiza a barra  
                        renderProgressBar($estagioAtual, $row['id']); 
                        ?></td>
                </tr>
            <?php endwhile; ?>
        </tbody>
    </table>
</div>
<?php include '../includes/footer.php'; ?>
<script src="../assets/js/barra_progresso.js"></script>