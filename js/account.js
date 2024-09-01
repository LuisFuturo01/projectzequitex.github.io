fetch('php/session_check.php')
    .then(response => response.json())
    .then(user => {
        const accountSection = document.getElementById('account-section');
        if (user) {
            // Si el usuario está logueado, mostrar la foto de perfil
            accountSection.innerHTML = `
                <img src="${user.profile_picture_url}" alt="Perfil" style="width:50px;height:50px;border-radius:50%;">
                <span>${user.nombre}</span>
            `;
        } else {
            // Si no está logueado, mostrar el botón "Account"
            accountSection.innerHTML = '<button id="account-button">Account</button>';
        }
    });