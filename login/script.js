document.getElementById('formularioLogin').addEventListener('submit', function(event) {
    event.preventDefault(); // Evita el envío del formulario

    const usuario = document.getElementById('usuario').value;
    const contraseña = document.getElementById('contraseña').value;
    const mensajeError = document.getElementById('mensajeError');

    // Aquí puedes agregar la lógica de validación que necesites
    if (usuario === 'admin' && contraseña === 'password') {
        // Redirige a la página de éxito
        window.location.href = 'exito.html';
    } else {
        // Muestra un mensaje de error
        mensajeError.textContent = 'Usuario o contraseña inválidos. Por favor, inténtalo de nuevo.';
    }
});
