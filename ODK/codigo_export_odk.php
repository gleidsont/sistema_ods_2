<?php
session_start();
include '../includes/auth_check.php';
include '../includes/conexao.php';

$mensagem = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nome = $_POST['nome_projeto'];
    $descricao = $_POST['descricao'];
    $usuario_id = $_SESSION['usuario_id'];

    $stmt = $conexao->prepare("INSERT INTO projetos (id_usuario, nome_projeto, descricao) VALUES (?, ?, ?)");
    $stmt->bind_param("iss", $usuario_id, $nome, $descricao);
    if ($stmt->execute()) {       
        $novo_id = $stmt->insert_id;
        registrar_log($conexao, $_SESSION['usuario_id'], 'INSERT', 'projetos', $novo_id, "Projeto criado: $nome");
        header("Location: listar.php");
        exit;
    } else {
        $mensagem = "Erro ao salvar o projeto.";
    }
}
include '../includes/header.php';
?>

<?php  
// Pasta onde você salva as planilhas  
$pastaServidor = __DIR__ . '/../export/planilhas/';
$pastas = glob($pastaServidor . "*", GLOB_ONLYDIR);
?>
    <table border='1'>
        <tr>
            <th>Nome do Projeto</th>
            <th>Tamanho</th>
            <th>Quantidade de Planilhas</th>
            <th>Data de Modificação</th>
            <th>Download Formulário ODK</th>
        </tr>
<?php 
foreach ($pastas as $pasta) {
    $nome = basename($pasta);
    $tamanho = filesize($pasta);
    $data_modificacao = date("d/m/Y H:i:s", filemtime($pasta));

     // Buscar planilhas dentro da pasta
    $planilhas = glob($pasta . "/*.{xlsx,xls}", GLOB_BRACE);
    $quantidade_planilhas = count($planilhas);
 ?>       
        <tr>
        <td> <?php echo $nome ?> </td>
        <td> <?php echo $tamanho ?> bytes</td>
        <td><?php echo $quantidade_planilhas; ?> planilha(s)</td>
        <td> <?php echo $data_modificacao?></td>       
        <td>
            <?php if ($quantidade_planilhas > 0): ?>
            <form action="processar.php" method="post">
                <input type="hidden" name="pasta_projeto" value="<?php echo htmlspecialchars($nome); ?>">
                <select name="arquivo_selecionado" required>
                    <option value="">-- Selecione uma planilha --</option>
                    <?php
                    foreach ($planilhas as $planilha) {
                        $nome_planilha = basename($planilha);
                        $data_planilha = date('d/m/Y H:i', filemtime($planilha));
                        echo "<option value='" . htmlspecialchars($planilha) . "'>";
                        echo $nome_planilha . " (" . $data_planilha . ")";
                        echo "</option>";
                    }
                    ?>
                </select>
                <button type="submit">Processar</button>
            </form>
            <?php else: ?>
            <em>Nenhuma planilha encontrada</em>
            <?php endif; ?>
        </td>
        </tr>
    <?php 
    }
?>    
    </table> 
</html>
<?php  
// Padrões de nomes que você usa (xlsx)  
//$padrao = $pastaServidor . '*.xlsx';  
  
// Busca todos os arquivos .xlsx  
//$arquivos = glob($padrao);  
  
// Se não houver arquivos, trate o caso  
//if (!$arquivos || count($arquivos) === 0) {  
//    http_response_code(404);  
//    exit('Nenhuma planilha encontrada.');  
//}  
  
// Ordena por data de modificação (mais recente primeiro)  
// usort($arquivos, function ($a, $b) {  
//     return filemtime($b) <=> filemtime($a);  
// });  
  
// O mais recente é o primeiro  
// $arquivoMaisRecente = $arquivos[0];  
  
// Opcional: obter nome base e data  
// $nomeArquivo = basename($arquivoMaisRecente);  
// $dataModificacao = date('d/m/Y H:i:s', filemtime($arquivoMaisRecente));  
  
// Exemplo de saída  
// echo "Última planilha: {$nomeArquivo} (modificada em {$dataModificacao})";
?>

<?php include '../includes/footer.php'; ?>