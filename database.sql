
CREATE TABLE EstadoTurno (
    id INT AUTO_INCREMENT,
    estado VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE EstadoUsuario (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Estado VARCHAR(50)
);
CREATE TABLE Perfil (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    TipoPerfil VARCHAR(100)
);

CREATE TABLE Usuario (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Clave VARCHAR(100),
    EstadoId INT,
    PerfilId INT,
    FOREIGN KEY (EstadoId) REFERENCES EstadoUsuario(Id),
    FOREIGN KEY (PerfilId) REFERENCES Perfil(Id)
);

CREATE TABLE ObraSocial (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100)
);

CREATE TABLE Paciente (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    DNI VARCHAR(20),
    ObraSocialId INT,
    NumeroAsociado VARCHAR(50),
    Direccion VARCHAR(200),
    Telefono VARCHAR(20),
    FOREIGN KEY (ObraSocialId) REFERENCES ObraSocial(Id)
);

CREATE TABLE Turnos (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE,
    Hora TIME,
    PacienteId INT,
    EstadoId INT,
    FOREIGN KEY (PacienteId) REFERENCES Paciente(Id),
    FOREIGN KEY (EstadoId) REFERENCES EstadoTurno(Id)
);


*/--------Insertar obra social--------*/

INSERT INTO ObraSocial (Nombre) VALUES ('OSDE');
INSERT INTO ObraSocial (Nombre) VALUES ('IOMA');
INSERT INTO ObraSocial (Nombre) VALUES ('OSCEP');


/*------inserto pacientes-------*/

INSERT INTO Paciente (Nombre, DNI, ObraSocialId, NumeroAsociado, Direccion, Telefono) VALUES 
('Paciente1', 'DNI1', 1, 'NumeroAsociado1', 'Direccion1', 'Telefono1'),
('Paciente2', 'DNI2', 2, 'NumeroAsociado2', 'Direccion2', 'Telefono2'),
('Paciente3', 'DNI3', 3, 'NumeroAsociado3', 'Direccion3', 'Telefono3'),
('Paciente4', 'DNI4', 1, 'NumeroAsociado4', 'Direccion4', 'Telefono4'),
('Paciente5', 'DNI5', 2, 'NumeroAsociado5', 'Direccion5', 'Telefono5'),
('Paciente6', 'DNI6', 3, 'NumeroAsociado6', 'Direccion6', 'Telefono6'),
('Paciente7', 'DNI7', 1, 'NumeroAsociado7', 'Direccion7', 'Telefono7'),
('Paciente8', 'DNI8', 2, 'NumeroAsociado8', 'Direccion8', 'Telefono8'),
('Paciente9', 'DNI9', 3, 'NumeroAsociado9', 'Direccion9', 'Telefono9'),
('Paciente10', 'DNI10', 1, 'NumeroAsociado10', 'Direccion10', 'Telefono10'),
('Paciente11', 'DNI11', 2, 'NumeroAsociado11', 'Direccion11', 'Telefono11'),
('Paciente12', 'DNI12', 3, 'NumeroAsociado12', 'Direccion12', 'Telefono12'),
('Paciente13', 'DNI13', 1, 'NumeroAsociado13', 'Direccion13', 'Telefono13'),
('Paciente14', 'DNI14', 2, 'NumeroAsociado14', 'Direccion14', 'Telefono14'),
('Paciente15', 'DNI15', 3, 'NumeroAsociado15', 'Direccion15', 'Telefono15');


/*-------Insertamos perfiles-------*/

INSERT INTO Perfil (TipoPerfil) VALUES ('Admin');
INSERT INTO Perfil (TipoPerfil) VALUES ('Secretaria');
INSERT INTO Perfil (TipoPerfil) VALUES ('Obra Social');

/*------Insertamos Estado de usuarios------*/

INSERT INTO EstadoUsuario (Estado) VALUES ('Activo');
INSERT INTO EstadoUsuario (Estado) VALUES ('Inactivo');

/*-------Insertamos Usuarios------*/

INSERT INTO Usuario (Nombre, Clave, EstadoId, PerfilId) VALUES 
('Admin', '123456', (SELECT Id FROM EstadoUsuario WHERE Estado = 'Activo'), (SELECT Id FROM Perfil WHERE TipoPerfil = 'Admin')),
('Secretaria', '123456', (SELECT Id FROM EstadoUsuario WHERE Estado = 'Activo'), (SELECT Id FROM Perfil WHERE TipoPerfil = 'Secretaria')),
('Obra Social', '123456', (SELECT Id FROM EstadoUsuario WHERE Estado = 'Activo'), (SELECT Id FROM Perfil WHERE TipoPerfil = 'Obra Social'));


/*--------Insertamos Estados de turnos ----*/

INSERT INTO EstadoTurno (estado) VALUES ('Ocupado');
INSERT INTO EstadoTurno (estado) VALUES ('Libre');