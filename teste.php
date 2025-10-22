<!DOCTYPE html>  
<html>  
<head>  
    <title>Teste API Python</title>  
</head>  
<body>  
    <h2>Enviar Excel para Processar</h2>  
    <form action="processar.php" method="post" enctype="multipart/form-data">  
        <input type="file" name="arquivo" accept=".xlsx,.xls" required>  
        <button type="submit">Enviar</button>  
    </form>  
</body>  
</html>