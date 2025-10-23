<?php
session_start();
include 'includes/header.php';
?>
<link rel="stylesheet" href="assets/css/barra_progresso.css">
<?php  
// Define o estágio atual do projeto (1-4)  
$estagioAtual = 3; // Exemplo: projeto está em Testes  
  
function renderProgressBar($estagioAtual) {  
    $estagios = [  
        1 => 'Georreferenciamento',  
        2 => 'Escolha dos Fatores',  
        3 => 'Formulário de Coleta',  
        4 => 'Mapa com os Ícones',
        4 => 'Mapa de Risco',    
        5 => 'Plano de Ação'  
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
    echo '<div class="progress-fill" id="progressFill"></div>';  
    echo '</div>';  
    echo '</div>';  
}  
  
// Renderiza a barra  
renderProgressBar($estagioAtual);  
?>

<?php include 'includes/footer.php'; ?>

<script src="assets/js/barra_progresso.js"></script>