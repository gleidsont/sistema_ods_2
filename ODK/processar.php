<?php
session_start();
include '../includes/auth_check.php';
include '../includes/conexao.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['arquivo_selecionado'])) {
    $caminhoArquivo = $_POST['arquivo_selecionado'];
    $pastaProjeto = $_POST['pasta_projeto']; // Ex: projeto_12
    
    // URL da API Python
    $url = 'https://gleidsonlima.pythonanywhere.com/processar_excel';

    // Preparar arquivo para envio (Correção do array feita aqui)
    $cfile = new CURLFile(
        $caminhoArquivo, 
        mime_content_type($caminhoArquivo), 
        basename($caminhoArquivo)
    );
    
    $data = array('arquivo' => $cfile);

    // Enviar para API Python
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $response = curl_exec($ch);
    $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($http_code == 200) {
        $resultado = json_decode($response, true);
        
        if (isset($resultado['arquivo_txt'])) {
            // Segunda requisição para gerar planilha
            $url2 = 'https://gleidsonlima.pythonanywhere.com/gerar_planilha';
            $data2 = json_encode(array('arquivo_txt' => $resultado['arquivo_txt']));
            
            $ch2 = curl_init();
            curl_setopt($ch2, CURLOPT_URL, $url2);
            curl_setopt($ch2, CURLOPT_POST, 1);
            curl_setopt($ch2, CURLOPT_POSTFIELDS, $data2);
            curl_setopt($ch2, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch2, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));
            $planilha = curl_exec($ch2);
            $http_code2 = curl_getinfo($ch2, CURLINFO_HTTP_CODE);
            curl_close($ch2);

            if ($http_code2 == 200) {
                // Define o local de salvamento: dentro da pasta do projeto
                $diretorioDestino = __DIR__ . '/../export/planilhas/' . $pastaProjeto . '/';
                if (!is_dir($diretorioDestino)) {
                    @mkdir($diretorioDestino, 0775, true);
                }

                $nome_arquivo = 'resultado_odk_' . date('YmdHis') . '.xlsx';
                $caminho_final = $diretorioDestino . $nome_arquivo;
                
                file_put_contents($caminho_final, $planilha);

                // Redireciona com sucesso
                $_SESSION['msg_sucesso'] = "Processamento concluído! <a href='../export/planilhas/$pastaProjeto/$nome_arquivo' class='btn btn-sm btn-light'>📥 Baixar Planilha Gerada</a>";
                header("Location: tabulacao.php");
                exit;
            }
        }
    }
    
    $_SESSION['msg_erro'] = "Erro no processamento (Status: $http_code). Verifique o arquivo enviado.";
    header("Location: tabulacao.php");
    exit;

} else {
    header("Location: tabulacao.php");
    exit;
}