CREATE DATABASE Biblioteca;
GO

USE Biblioteca;
GO

CREATE TABLE departamentos (
	idDepartamento CHAR(2) PRIMARY KEY,
    departamento VARCHAR(25) NOT NULL,
    pais VARCHAR(25)
);

CREATE TABLE municipios (
	idMunicipio CHAR(3) PRIMARY KEY,
    municipio VARCHAR(30) NOT NULL,
    idDepartamento CHAR(2) NOT NULL,
    FOREIGN KEY (idDepartamento) REFERENCES departamentos(idDepartamento)
);

CREATE TABLE distritos (
	idDistrito CHAR(5) PRIMARY KEY,
    distrito VARCHAR(50) NOT NULL,
    idMunicipio CHAR(3) NOT NULL,
    FOREIGN KEY (idMunicipio) REFERENCES municipios(idMunicipio)
);

CREATE TABLE direcciones (
	idDireccion INT PRIMARY KEY IDENTITY(1,1),
    linea1 VARCHAR(100) NOT NULL,
    linea2 VARCHAR(50),
    idDistrito CHAR(5),
    codigoPostal VARCHAR(7),
    FOREIGN KEY (idDistrito) REFERENCES distritos(idDistrito)
);

CREATE TABLE cargos (
	idCargo INT PRIMARY KEY,
    cargo VARCHAR(25) NOT NULL
);

CREATE TABLE empleados (
	idEmpleado INT PRIMARY KEY,
    nombresEmpleados VARCHAR(100) NOT NULL,
    apellidoEmpleados VARCHAR(100) NOT NULL,
    duiEmpleado CHAR(10) NOT NULL,
    isssEmpleado CHAR(9),
    fechanacEmpleado DATE NOT NULL,
    telefonoEmpleado VARCHAR(15),
    correoEmpleado VARCHAR(100) NOT NULL,
    idCargo INT NOT NULL,
    idDireccion INT NOT NULL,
    FOREIGN KEY (idCargo) REFERENCES cargos(idCargo),
    FOREIGN KEY (idDireccion) REFERENCES direcciones(idDireccion)
);

CREATE TABLE lectores (
	idLector INT PRIMARY KEY,
    nombreLector VARCHAR(45) NOT NULL,
    apellidoLector VARCHAR(45) NOT NULL,
    duiLector CHAR(10) NOT NULL,
    telefonoLector VARCHAR(15),
    idDireccion INT NOT NULL,
    FOREIGN KEY (idDireccion) REFERENCES direcciones(idDireccion)
);

CREATE TABLE historialPrestamos (
	idHistorial INT PRIMARY KEY,
    fechaEntregado DATE NOT NULL,
    fechaRecibido DATE NOT NULL
);

CREATE TABLE prestamos (
	idPrestamo INT PRIMARY KEY,
    fechaPrestamo DATE NOT NULL,
    fechaDevolucion DATE NOT NULL,
    idHistorial INT NOT NULL,
    idEmpleado INT NOT NULL,
    idLector INT NOT NULL,
    FOREIGN KEY (idEmpleado) REFERENCES empleados(idEmpleado),
    FOREIGN KEY (idLector) REFERENCES lectores(idLector),
    FOREIGN KEY (idHistorial) REFERENCES historialPrestamos(idHistorial)
);

CREATE TABLE moras (
	idMora INT PRIMARY KEY,
    cantidadDias INT NOT NULL,
    moraDia DECIMAL(10, 2) NOT NULL,
    cantidadMora DECIMAL(10, 2) NOT NULL,
    idPrestamo INT NOT NULL,
    FOREIGN KEY (idPrestamo) REFERENCES prestamos(idPrestamo)
);

CREATE TABLE autores (
	idAutor INT PRIMARY KEY,
    nombreAutor VARCHAR(45) NOT NULL,
    apellidoAutor VARCHAR(45) NOT NULL
);

CREATE TABLE categoriaLibros (
	idCategoria INT PRIMARY KEY,
    categoria1 VARCHAR(45) NOT NULL,
    categoria2 VARCHAR(45) NOT NULL
);

CREATE TABLE editoriales (
	idEditorial INT PRIMARY KEY,
    editorial VARCHAR(45) NOT NULL
);

CREATE TABLE condicionLibros (
	idCondicionLibro INT PRIMARY KEY,
    condicion VARCHAR(45) NOT NULL
);

CREATE TABLE libros (
	ISBN CHAR(13) PRIMARY KEY,
    libro VARCHAR(100) NOT NULL,
    estado VARCHAR(45) NOT NULL,
    fechaPublicacion DATE NOT NULL,
    idEditorial INT NOT NULL,
    idCategoria INT NOT NULL,
    idCondicionLibro INT NOT NULL,
    FOREIGN KEY (idCategoria) REFERENCES categoriaLibros(idCategoria),
    FOREIGN KEY (idEditorial) REFERENCES editoriales(idEditorial),
    FOREIGN KEY (idCondicionLibro) REFERENCES condicionLibros(idCondicionLibro)
);

CREATE TABLE prestamoLibro (
	idPrestamoLibro INT PRIMARY KEY,
    ISBN CHAR(13) NOT NULL,
    idPrestamo INT NOT NULL,
    FOREIGN KEY (ISBN) REFERENCES libros(ISBN),
    FOREIGN KEY (idPrestamo) REFERENCES prestamos(idPrestamo)
);

CREATE TABLE autoresLibros (
	idAutoresLibro INT PRIMARY KEY,
    idAutor INT NOT NULL,
    ISBN CHAR(13) NOT NULL,
    FOREIGN KEY (ISBN) REFERENCES libros(ISBN),
    FOREIGN KEY (idAutor) REFERENCES autores(idAutor)
);

CREATE TABLE roles (
	idRol INT PRIMARY KEY IDENTITY(1,1),
    rol VARCHAR(50) NOT NULL
);

CREATE TABLE opciones (
	idOpcion INT PRIMARY KEY IDENTITY(1,1),
    opcion VARCHAR(50) NOT NULL
);

CREATE TABLE asignacionRolesOpciones (
	idAsignacion INT PRIMARY KEY IDENTITY(1,1),
    idRol INT NOT NULL,
    idOpcion INT NOT NULL,
    FOREIGN KEY (idRol) REFERENCES roles(idRol),
    FOREIGN KEY (idOpcion) REFERENCES opciones(idOpcion)
);

CREATE TABLE usuarios (
	idUsuario INT PRIMARY KEY IDENTITY(1,1),
    usuario VARCHAR(50) NOT NULL,
    contrasenia VARCHAR(50) NOT NULL,
    idRol INT NOT NULL,
    idEmpleado INT NOT NULL,
    FOREIGN KEY (idRol) REFERENCES roles(idRol),
    FOREIGN KEY (idEmpleado) REFERENCES empleados(idEmpleado)
);
