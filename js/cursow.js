function checkAndHandleSession() {
    // Realizamos la solicitud para verificar el estado de la sesión
    fetch('http://localhost/project-zequitex/php/session_remember.php', {
        method: 'POST', 
        async: false  
    })
    .then(response => response.json())
    .then(data => {
        if (data.status === 'destroyed') {
            console.log('Sesión destruida. Redirigiendo al usuario...');
        } else if (data.status === 'active') {
            console.log('Sesión activa. El usuario puede continuar.');
        } else {
            console.error('Solicitud inválida.');
        }
    })
    .catch(error => console.error('Error en la verificación de la sesión:', error));
}

checkAndHandleSession();
