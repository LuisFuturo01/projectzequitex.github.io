const fields = document.querySelectorAll('input[required], select[required]');
        
        // Función para mostrar/ocultar mensajes de error
        function handleValidation(event) {
          const field = event.target;
          const errorMessage = field.nextElementSibling;
          
          // Mostrar el mensaje de error si el campo es inválido
          if (field.validity.valueMissing) {
            errorMessage.classList.add('active'); // Mostrar mensaje
          } else {
            errorMessage.classList.remove('active'); // Ocultar mensaje
          }
        }
    
        // Añadir listeners para inputs y selects
        fields.forEach(field => {
          field.addEventListener('focus', () => {
            field.hasFocus = true; // Indicar que el campo ha sido enfocado
            handleValidation({ target: field }); // Verificar si el mensaje debe mostrarse
          });
          field.addEventListener('blur', () => {
            field.hasFocus = false; // Indicar que el campo ya no tiene el foco
            handleValidation({ target: field }); // Verificar si el mensaje debe ocultarse
          });
          field.addEventListener('input', handleValidation); // Para inputs
          field.addEventListener('change', handleValidation); // Para selects
        });
    
        // Validación al enviar
        document.getElementById('miFormulario').addEventListener('submit', function(e) {
          fields.forEach(field => {
            if (!field.checkValidity()) {
              e.preventDefault(); // Prevenir envío si hay errores
              handleValidation({ target: field }); // Mostrar mensaje si hay error
            }
          });
        });