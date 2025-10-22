<?php  
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES['arquivo'])) {  
    $arquivo = $_FILES['arquivo'];  
      
    // URL da API Python  
    $url = 'https://gleidsonlima.pythonanywhere.com/processar_excel';  
      
    // Preparar arquivo para envio  
    $cfile = new CURLFile($arquivo['tmp_name'], $arquivo['type'], $arquivo['name']);  
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
      
    echo "<h3>Resposta da API:</h3>";  
    echo "<p>Status HTTP: $http_code</p>";  
    echo "<pre>$response</pre>";  
      
    // Se deu certo, processar para gerar planilha ODK  
    if ($http_code == 200) {  
        $resultado = json_decode($response, true);  
          
        if (isset($resultado['arquivo_txt'])) {  
            echo "<h3>Gerando planilha ODK...</h3>";  
              
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
                // Salvar arquivo  
                $nome_arquivo = 'form_odk_' . date('YmdHis') . '.xlsx';  
                file_put_contents($nome_arquivo, $planilha);  
                  
                echo "<p style='color: green;'>✅ Planilha gerada com sucesso!</p>";  
                echo "<a href='$nome_arquivo' download>📥 Baixar Planilha ODK</a>";  
            } else {  
                echo "<p style='color: red;'>❌ Erro ao gerar planilha: $http_code2</p>";  
            }  
        }  
    }  
} else {  
    echo "Nenhum arquivo enviado.";  
}  
?>