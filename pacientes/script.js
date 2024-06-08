
const pacientes = [
    { id: 1, nombre: "Juan Pérez" },
    { id: 2, nombre: "María Gómez" },
    { id: 3, nombre: "Carlos López" },
    { id: 4, nombre: "Ana Martínez" }
];


function mostrarPacientes(lista) {
    const listaPacientes = document.getElementById('listaPacientes');
    listaPacientes.innerHTML = '';

    lista.forEach(paciente => {
        const li = document.createElement('li');
        li.classList.add('paciente');
        li.innerHTML = `
            <span>${paciente.nombre}</span>
            <button class="boton boton-editar" onclick="editarPaciente(${paciente.id})">Editar</button>
            <button class="boton boton-eliminar" onclick="eliminarPaciente(${paciente.id})">Eliminar</button>
        `;
        listaPacientes.appendChild(li);
    });
}


function buscarPacientes(termino) {
    const resultado = pacientes.filter(paciente => paciente.nombre.toLowerCase().includes(termino.toLowerCase()));
    mostrarPacientes(resultado);
}


function editarPaciente(id) {
    
    window.location.href = `formulario_edicion.html?id=${id}`;
}


function eliminarPaciente(id) {
    
    console.log(`Eliminar paciente con ID ${id}`);
}


window.onload = function() {
    mostrarPacientes(pacientes);

    
    const inputBusqueda = document.getElementById('busqueda');
    inputBusqueda.addEventListener('input', function() {
        buscarPacientes(this.value);
    });
}
