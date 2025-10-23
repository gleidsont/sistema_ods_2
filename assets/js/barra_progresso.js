// Atualiza todas as barras de progresso na página  
function updateAllProgressBars() {  
    const progressContainers = document.querySelectorAll('.progress-container');  
      
    progressContainers.forEach(container => {  
        const steps = container.querySelectorAll('.step');  
        const progressFill = container.querySelector('.progress-fill');  
          
        const activeSteps = container.querySelectorAll('.step.active').length;  
        const totalSteps = steps.length;  
          
        const progressPercentage = ((activeSteps - 1) / (totalSteps - 1)) * 100;  
        progressFill.style.width = progressPercentage + '%';  
    });  
}  
  
// Inicializa ao carregar a página  
document.addEventListener('DOMContentLoaded', function() {  
    updateAllProgressBars();  
});