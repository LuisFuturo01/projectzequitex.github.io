document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('account-form');
    const editBtn = document.getElementById('edit-btn');
    const cancelBtn = document.getElementById('cancel-btn');
    const saveBtn = document.getElementById('save-btn');
    const inputs = form.querySelectorAll('input[readonly]');
    
    let originalValues = {};
  
    function saveOriginalValues() {
        inputs.forEach(input => {
            originalValues[input.id] = input.value;
        });
    }
  
    function restoreOriginalValues() {
        inputs.forEach(input => {
            input.value = originalValues[input.id];
        });
    }
  
    function enableEditing() {
        inputs.forEach(input => {
            input.removeAttribute('readonly');
        });
        editBtn.style.display = 'none';
        cancelBtn.style.display = 'inline-block';
        saveBtn.style.display = 'inline-block';
    }
  
    function disableEditing() {
        inputs.forEach(input => {
            input.setAttribute('readonly', true);
        });
        editBtn.style.display = 'inline-block';
        cancelBtn.style.display = 'none';
        saveBtn.style.display = 'none';
    }
  
    editBtn.addEventListener('click', function() {
        saveOriginalValues();
        enableEditing();
    });
  
    cancelBtn.addEventListener('click', function() {
        restoreOriginalValues();
        disableEditing();
    });

    saveBtn.addEventListener('click', function() {
        form.submit(); // Enviar el formulario directamente
    });
});