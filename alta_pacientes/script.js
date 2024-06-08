document.getElementById('tieneObraSocial').addEventListener('change', function() {
    const campoObraSocial = document.getElementById('campoObraSocial');
    if (this.value === 'si') {
        campoObraSocial.classList.remove('oculto');
    } else {
        campoObraSocial.classList.add('oculto');
        document.getElementById('obraSocial').value = ''; // Limpia el campo de texto si se oculta
    }
});

document.getElementById('formularioAltaPacientes').addEventListener('submit', function(event) {
    event.preventDefault(); // Evita el envío del formulario

    const nombre = document.getElementById('nombre').value;
    const apellido = document.getElementById('apellido').value;
    const fechaNacimiento = document.getElementById('fechaNacimiento').value;
    const direccion = document.getElementById('direccion').value;
    const telefono = document.getElementById('telefono').value;
    const correo = document.getElementById('correo').value;
    const tieneObraSocial = document.getElementById('tieneObraSocial').value;
    const obraSocial = document.getElementById('obraSocial').value;
    const historialMedico = document.getElementById('historialMedico').value;
    const mensajeExito = document.getElementById('mensajeExito');
    const mensajeError = document.getElementById('mensajeError');

    // Validación del formulario
    if (nombre && apellido && fechaNacimiento && direccion && telefono && correo && historialMedico && tieneObraSocial) {
        if (tieneObraSocial === 'si' && !obraSocial) {
            mensajeExito.textContent = '';
            mensajeError.textContent = 'Por favor, ingrese el nombre de la obra social.';
        } else {
            // Muestra un mensaje de éxito
            mensajeExito.textContent = 'Paciente dado de alta exitosamente.';
            mensajeError.textContent = '';

            // Aquí podrías agregar una llamada a una API o backend para guardar los datos

            // Limpiar el formulario
            document.getElementById('formularioAltaPacientes').reset();
            campoObraSocial.classList.add('oculto'); // Oculta el campo de obra social nuevamente
        }
    } else {
        // Muestra un mensaje de error
        mensajeExito.textContent = '';
        mensajeError.textContent = 'Por favor, completa todos los campos.';
    }
});
