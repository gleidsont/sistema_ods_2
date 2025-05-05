<?php
session_start();
include '../../includes/auth_check.php';
include '../../includes/header.php';

if ($_SESSION['usuario_perfil'] !== 'admin') {
    header('Location: ../../index.php');
    exit;
}

include '../../includes/conexao.php';

$sql = "SELECT distinct `imagem`, `numero_ods`, `nome_ods` FROM ods ORDER BY `numero_ods` ASC";
$resultado = $conexao->query($sql);

function otimizarImagem($caminho_original, $qualidade = 70) {
    // Verifica se o arquivo original existe
    if (!file_exists("../../assets/img/".$caminho_original)) {
        return false;
    }
    // Verifica o tipo da imagem
    
    $extensao = strtolower(pathinfo("../../assets/img/".$caminho_original, PATHINFO_EXTENSION));

    // Cria uma versão redimensionada (max 300) e converte para WebP
    $nome_webp = str_replace(".$extensao", ".webp", "../../assets/img/".$caminho_original);

    // Se já existe uma versão WebP, compara os tamanhos
    if (file_exists($nome_webp)) {
        $tamanho_original = filesize("../../assets/img/".$caminho_original);
        $tamanho_webp = filesize($nome_webp);

        // Retorna o menor arquivo (WebP ou original)
        return ($tamanho_webp < $tamanho_original) ? $nome_webp : "../../assets/img/".$caminho_original;
    }

    // Se não existe WebP, cria uma versão otimizada
    $info = getimagesize("../../assets/img/".$caminho_original);

    // Redimensiona (ajustável)
    $largura_desejada = 300;
    list($largura_orig, $altura_orig) = $info;

    // Calcula nova altura proporcional
    $nova_altura = ($altura_orig / $largura_orig) * $largura_desejada;

    // Cria imagem temporária
    if ($extensao == "jpg" || $extensao == "jpeg") {
        $imagem = imagecreatefromjpeg("../../assets/img/".$caminho_original);
    } elseif ($extensao == "png") {
        $imagem = imagecreatefrompng("../../assets/img/".$caminho_original);
    } else {
        return false; // Formato não suportado
    }

    // Redimensiona
    $imagem_redimensionada = imagescale($imagem, $largura_desejada, $nova_altura);

    // Salva em WebP (formato mais leve)
    imagewebp($imagem_redimensionada, $nome_webp, $qualidade);

    // Libera memória
    imagedestroy($imagem);
    imagedestroy($imagem_redimensionada);

    return $nome_webp; // Retorna o caminho da nova imagem
}

?>

<div class="container mt-4">
    <h3>Lista de Fatores</h3>
    <a href="cadastrar.php" class="btn btn-success mb-3">+ Cadastrar Novo Fator</a>

<?php
                if ($resultado->num_rows > 0) {
                    while ($grupo = $resultado->fetch_assoc()) {
                        $numero_ods = $grupo['numero_ods'];
                        $imagem = $grupo['imagem'];
                        $nome_ods = $grupo['nome_ods'];
                    
                        
                        echo "<div class='group-container mb-2'>";
                        echo "<div class='group-header' onclick='toggleGroup(this)'>";
                        echo "<div class='group-title'>";
                        $otimizada = otimizarImagem($imagem);
                            echo "<img src='../../assets/img/{$otimizada}' class='img-preview_2' alt='Ícone do Grupo'>";
                        echo "<strong>ODS {$numero_ods} - {$nome_ods}</strong>";
                        echo "</div>";
                        echo "<span class='group-arrow'>></span>";
                        echo "</div>";
                        
                        echo "<div class='group-items'>";
                        
                        // Busca os itens ODS deste grupo
                        $sql_ods = "SELECT `id`, `imagem`, `numero_ods`, `nome_ods`, `numero_item`, `metas_ipea`, `fatores`, `icone_fator`, 
                        `imagem_ameaca`, `imagem_vulnerabilidade`, `imagem_resiliencia`, `imagem_sagrado` 
                        FROM ods 
                        WHERE numero_ods = '$numero_ods' ORDER BY CAST(SUBSTRING_INDEX(numero_item, '.', 1) AS UNSIGNED),
    CAST(SUBSTRING_INDEX(numero_item, '.', -1) AS UNSIGNED);";
                        $result_ods = $conexao->query($sql_ods);
                        
                        while ($row = $result_ods->fetch_assoc()) {
                            //$checked = in_array($row['id'], $ods_associadas) ? 'checked' : '';
                            echo "<div class='ods-card'>";
                            
                            // Checkbox e descrição da ODS
                            echo "<label class='form-check-label'>";
                            echo "<input class='form-check-input' type='checkbox' name='numero_item[]' value='{$row['numero_item']}'>";
                            echo "<strong>{$row['numero_item']}</strong> - {$row['fatores']}";
                            echo "</label>";
                            
                            // Pré-visualização das imagens por tipo
                            echo "<div class='mt-2 d-flex align-items-center flex-wrap'>";
                            $tipos = [
                                'A' => ['Ameaça', '../../assets/img/'.otimizarImagem($row['imagem_ameaca'])],
                                'V' => ['Vulnerabilidade', '../../assets/img/'.otimizarImagem($row['imagem_vulnerabilidade'])],
                                'R' => ['Resiliência', '../../assets/img/'.otimizarImagem($row['imagem_resiliencia'])],
                                'S' => ['Sagrado', '../../assets/img/'.otimizarImagem($row['imagem_sagrado'])]
                            ];
                            

                            //echo "<pre>".print_r($row, true)."</pre>";
                            //otimizarImagem($dados[1]);
                            foreach ($tipos as $tipo => $dados) {
                                    echo "<div class='me-3 mb-2'>";
                                    echo "<img src='{$dados[1]}' class='img-preview' title='{$dados[0]}'>";
                                    echo "<span class='tipo-imagem-label'>{$dados[0]}</span>";
                                    echo "</div>";
                                    
                                }
                            echo "</div>";
                            ?>
                                    <a href="editar.php?id=<?php echo $row['numero_item']; ?>" class="btn btn-sm btn-warning">Editar</a>
                                    <a href="excluir.php?id=<?php echo $row['numero_item']; ?>" class="btn btn-sm btn-danger" onclick="return confirm('Tem certeza?')">Excluir</a>
                                    <?php
                            echo "</div>";
                        }
                        
                        echo "</div>"; // fecha group-items
                        
                        echo "</div>"; // fecha group-container
                        
                    }
                    ?>
                        <button type="submit" class="btn btn-primary">Salvar</button>
                        <?php
                }
?>
</div>
<script>
        function toggleGroup(element) {
            const groupContainer = element.closest('.group-container');
            const groupItems = groupContainer.querySelector('.group-items');
            const arrow = groupContainer.querySelector('.group-arrow');
            
            if (groupItems.style.display === 'block') {
                groupItems.style.display = 'none';
                arrow.classList.remove('rotated');
            } else {
                groupItems.style.display = 'block';
                arrow.classList.add('rotated');
            }
        }
        
        // Abrir grupos com itens selecionados
        document.addEventListener('DOMContentLoaded', function() {
            const groups = document.querySelectorAll('.group-container');
            groups.forEach(group => {
                const checkboxes = group.querySelectorAll('input[type="checkbox"]:checked');
                if (checkboxes.length > 0) {
                    const groupItems = group.querySelector('.group-items');
                    const arrow = group.querySelector('.group-arrow');
                    groupItems.style.display = 'block';
                    arrow.classList.add('rotated');
                }
            });
        });
    </script>

<?php include '../../includes/footer.php'; ?>