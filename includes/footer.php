<!-- Rodapé do site -->
<footer class="mt-4">
    <div class="container">
        <p class="text-center">© <?php echo date('Y'); ?> PICAPS - Fiocruz</p>
    </div>
</footer>

<!-- Inclui o JavaScript do Bootstrap (opcional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Seu JavaScript personalizado -->
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const checkboxes = document.querySelectorAll('input[name="ods_ids[]"]');
        const selectedItems = document.getElementById('selected-items');

        checkboxes.forEach(checkbox => {
            checkbox.addEventListener('change', function () {
                updateSelectedItems();
            });
        });

        function updateSelectedItems() {
            const selected = [];
            checkboxes.forEach(checkbox => {
                if (checkbox.checked) {
                    // Captura o texto da label associada ao checkbox
                    const labelText = checkbox.closest('.ods-card').querySelector('label').textContent.trim();
                    selected.push(labelText);
                }
            });
            selectedItems.innerHTML = selected.join(', ') || 'Nenhum item selecionado.';
        }

        // Atualiza a lista ao carregar a página
        updateSelectedItems();
    });
</script>
</body>
</html>