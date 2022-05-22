CREATE DATABASE consultorio_dental COLLATE 'utf8mb4_general_ci';

CREATE TABLE configuracion (
    IdConfiguracion bigint NOT NULL,
    NombrePagina varchar(200) NOT NULL,
    IconoPagina varchar(500) NOT NULL,
    LogoPagina varchar(500) NOT NULL,
    FrasePagina varchar(500) NOT NULL,
    TelefonoPagina int NOT NULL,
    CorreoPagina varchar(200) NOT NULL,
    SobreNosotros mediumtext NOT NULL,
    HorariosAtencion mediumtext,
    PiePagina mediumtext,
    Latitud int,
    Longitud int,
    Profundidad int,
    PRIMARY KEY (IdConfiguracion)
);
CREATE TABLE redes_sociales (
    IdSocial bigint NOT NULL,
    EnlaceSocial mediumtext NOT NULL,
    IconoSocial varchar(50) NOT NULL,
    PRIMARY KEY (IdSocial)
);
CREATE TABLE publicidades (
  IdPublicidad bigint NOT NULL,
  TitularPublicidad varchar(200) NOT NULL,
  DescripcionPublicidad mediumtext NOT NULL,
  ImagenPublicidad varchar(500) NOT NULL,
  EnlacePublicidad mediumtext,
  PRIMARY KEY (IdPublicidad)
);
CREATE TABLE usuarios (
    IdUsuario bigint NOT NULL,
    Usuario varchar(200) UNIQUE NOT NULL,
    Contraseña mediumtext NOT NULL,
    RolAsignado varchar(50) NOT NULL,
    FechaRegistro date,
    PRIMARY KEY (IdUsuario)
);
CREATE TABLE agendas (
    IdAgenda bigint NOT NULL,
    Doctor bigint NOT NULL,
    FechaAgenda date NOT NULL,
    HoraAgenda time NOT NULL,
    EstadoAgenda varchar(100) NOT NULL,
    PRIMARY KEY (IdAgenda),
    FOREIGN KEY (Doctor) REFERENCES usuarios (IdUsuario)
);
CREATE TABLE pacientes (
    CarnetIdentidad int NOT NULL,
    Nombres varchar(100) NOT NULL,
    ApellidoPaterno varchar(100) NOT NULL,
    ApellidoMaterno varchar(100) NOT NULL,
    Direccion varchar(100),
    Telefono int,
    CorreoElectronico varchar(100),
    Genero varchar(10) NOT NULL,
    FechaNacimiento date NOT NULL,
    FechaRegistro date,
    PRIMARY KEY (CarnetIdentidad)
);
CREATE TABLE tratamientos (
    IdTratamiento bigint NOT NULL,
    NombreTratamiento varchar(200) NOT NULL,
    DescripcionTratamietno mediumtext,
    PrecioTratamiento int NOT NULL,
    PRIMARY KEY (IdTratamiento)
);
CREATE TABLE historial_tratamientos (
    IdHistorialTratamiento bigint NOT NULL,
    Paciente bigint NOT NULL,
    Tratamiento bigint NOT NULL,
    AbonoTratamiento int,
    EstadoTratamiento varchar(100),
    PRIMARY KEY (IdHistorialTratamiento),
    FOREIGN KEY (Paciente) REFERENCES pacientes (CarnetIdentidad),
    FOREIGN KEY (Tratamiento) REFERENCES tratamientos (tratamientos)
);
CREATE TABLE historial_citas (
    IdHistorialCita bigint NOT NULL,
    Agenda bigint NOT NULL,
    Paciente bigint NOT NULL,
    Tratamiento bigint NOT NULL,
    Asistencia varchar(100),
    DescripcionCita mediumtext,
    PRIMARY KEY (IdHistorialCita),
    FOREIGN KEY (Agenda) REFERENCES agendas (IdAgenda),
    FOREIGN KEY (Paciente) REFERENCES pacientes (CarnetIdentidad),
    FOREIGN KEY (Tratamiento) REFERENCES tratamientos (IdTratamiento)
);
CREATE TABLE odontogramas (
    IdOdontograma bigint NOT NULL,
    Paciente bigint NOT NULL,
    NumeroCliente int,
    DescripcionOdontograma mediumtext,
    PRIMARY KEY (IdOdontograma),
    FOREIGN KEY (Paciente) REFERENCES pacientes (CarnetIdentidad)
);

CREATE TABLE inventarios (
    IdInventario bigint NOT NULL,
    NombreInventario varchar(100) NOT NULL,
    Marca varchar(100) NOT NULL,
    Represent varchar(100),
    Lote varchar(100),
    Registro varchar(100),
    Fecha date,
    Riesgo varchar(100),
    PRIMARY KEY (IdInventario)
);

/*
*/