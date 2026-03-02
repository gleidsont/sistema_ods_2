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
                    projetos.pais, 
                    projetos.local, 
                    projetos.localizacao,
                    projetos.painel_pbi,  	
                    projetos.descricao, 	
                    projetos.criado_em, 	 
                    usuarios.nome AS criador,
                    (SELECT COUNT(*) FROM projetos_ods WHERE projetos_ods.id_projeto = projetos.id ) AS qtd_fator_projeto 
            FROM projetos 
            INNER JOIN usuarios ON projetos.id_usuario = usuarios.id 
            ORDER BY projetos.criado_em DESC";
} else {
    $sql = "SELECT * FROM projetos WHERE id_usuario = $usuario_id ORDER BY criado_em DESC";
}

function renderChecklist($row)
{
    // Cada item: [label, condição booleana para marcar como feito]
    $itens = [
        ['Georreferenciamento', !empty($row['localizacao'])],
        ['Escolha dos Fatores: ' . $row['qtd_fator_projeto'],  !empty($row['qtd_fator_projeto'])],       // ajuste o campo conforme seu banco
        ['Formulário de Coleta', !empty($row['formulario'])],    // ajuste o campo conforme seu banco
        ['Mapa com os Ícones',   !empty($row['painel_pbi'])],
        ['Mapa de Risco',        !empty($row['mapa_risco'])],    // ajuste o campo conforme seu banco
        ['Plano de Ação',        !empty($row['plano_acao'])],    // ajuste o campo conforme seu banco
    ];

    echo '<div class="checklist-projeto mt-2">';
    foreach ($itens as $item) {
        [$label, $feito] = $item;
        $icon  = $feito ? '✔' : '✘';
        $class = $feito ? 'checklist-item done' : 'checklist-item pending';
        echo "<div class='$class'><span class='checklist-icon'>$icon</span> $label</div>";
    }
    echo '</div>';
}

$resultado = $conexao->query($sql);
?>
<link rel="stylesheet" href="../assets/css/barra_progresso.css">
<style>
    .acoes {
        display: flex;
        /* Habilita o Flexbox */
        flex-direction: column;
        /* Alinha os itens em coluna */
    }

    .conteudo {
        flex-grow: 1;
        /* Faz o conteúdo ocupar todo o espaço restante */
    }

    .modal-xl {
        max-width: 70%;
        /* Ocupa 70% da largura da tela */
    }

    /* Garante que o iframe preencha o espaço corretamente */
    .ratio-16x9 iframe {
        width: 100%;
        height: 100%;
    }


    .checklist-projeto {
        display: flex;
        flex-wrap: wrap;
        gap: 6px;
        margin-top: 8px;
    }

    .checklist-item {
        display: flex;
        align-items: center;
        gap: 5px;
        font-size: 12px;
        padding: 3px 8px;
        border-radius: 20px;
        font-weight: 500;
    }

    .checklist-item.done {
        background-color: #d1fae5;
        color: #065f46;
    }

    .checklist-item.pending {
        background-color: #fee2e2;
        color: #991b1b;
    }

    .checklist-icon {
        font-weight: bold;
    }
</style>
<div class="container mt-4">
    <h3>Projetos</h3>

    <table class="table table-bordered table-hover">
        <thead class="table-light">
            <tr>
                <th>Nome</th>
                <th>Ações</th>
                <th>Localização</th>
                <!-- <th>Progresso</th> -->
            </tr>
        </thead>
        <tbody>
            <?php while ($row = $resultado->fetch_assoc()): ?>
                <tr>
                    <td>Projeto: <?php echo $row['nome_projeto']; ?> <br>
                        Data: <?php echo date('d/m/Y H:i:s', strtotime($row['criado_em'])); ?> <br>
                        País: <?php echo $row['pais']; ?> <br>
                        Local: <?php echo $row['local']; ?> <br>
                        Criado por: <?php echo $row['criador']; ?>

                        <?php renderChecklist($row); ?>

                    </td>
                    <td class=acoes>
                        <a href="../ods/associar.php?projeto_id=<?php echo $row['id']; ?>" class="btn btn-sm btn-primary"><img src="../assets/img/associar.png"> Associar Fatores</a> <br>
                        <a href="visualizar.php?id=<?php echo $row['id']; ?>" class="btn btn-sm btn-primary"><img src="../assets/img/visualizar.png"> Visualizar Fatores</a> <br>
                        <!-- <a href="../export/exportar_projeto.php?id=<? //= $row['id']; 
                                                                        ?>" class="btn btn-sm btn-success">Exportar Excel</a> <br> -->
                        <a href="../export/exportar_projeto_excel_odk.php?id=<?= $row['id']; ?>" class="btn btn-sm btn-success"><img src="../assets/img/excel.png"> Exportar Excel</a> <br>
                        <a href="../export/exportar_projeto_zip.php?id=<?= $row['id']; ?>" class="btn btn-sm btn-secondary"><img src="../assets/img/download.png"> Baixar imagens</a> <br>
                        <button type="button" class="btn btn-sm" data-bs-toggle="modal" data-bs-target="#powerBiModal<?= $row['id']; ?>">
                            <i class="fas fa-chart-bar"></i><img src="../assets/img/localizacoes.png"> Mapa Territorial
                        </button>
                        <!-- Estrutura do Modal -->
                        <div class="modal fade" id="powerBiModal<?= $row['id']; ?>" tabindex="-1" aria-labelledby="powerBiModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-xl modal-dialog-centered"> <!-- modal-xl para ficar bem grande -->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="powerBiModalLabel">Dashboard</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body p-0"> <!-- p-0 remove as bordas brancas -->
                                        <div class="ratio ratio-16x9"> <!-- Mantém a proporção do Power BI -->
                                            <iframe src=" <?php echo $row['painel_pbi']; ?> " frameborder="0" allowFullScreen="true"> </iframe>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- <a href="../paineis/cartografia.html?id=<?= $row['id']; ?>" class="btn btn-sm"><img src="../assets/img/localizacoes.png"> Mapa Territorial</a> <br> -->

                        <?php if ($is_admin): ?>
                            <a href="editar.php?id=<?php echo $row['id']; ?>" class="btn btn-sm btn-warning"><img src="../assets/img/edit.png"> Editar</a> <br>
                            <a href="excluir.php?id=<?php echo $row['id']; ?>" class="btn btn-sm btn-danger" onclick="return confirm('Tem certeza?')"><img src="../assets/img/delete.png"> Excluir</a>
                        <?php endif; ?>
                    </td>
                    <!-- <td><img src="../assets/img/localizacao/pinhao.jpg" style="width: 50%; height: 50%; object-fit: contain;"> -->
                    <!-- <td><iframe src="https://www.google.com/maps/d/embed?mid=1XRBGpKujQRPlFLkK5Whgtx2vCELs-T0&ehbc=2E312F&noprof=1" width="600" height="300"></iframe> </td> -->
                    <td><iframe src=" <?php echo $row['localizacao']; ?>" width="600" height="300"></iframe> </td>


                </tr>

            <?php endwhile; ?>

        </tbody>
    </table>
</div>



<?php include '../includes/footer.php'; ?>
<script src="../assets/js/barra_progresso.js"></script>