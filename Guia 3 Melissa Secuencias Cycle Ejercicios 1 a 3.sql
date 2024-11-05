-- CYCLE
-- 1. Crear secuencia para generar IDs de municipios con reinicio. 
-- Cada municipio tendrá un ID unico de tres caracteres, comenzando en 100 y aumentando de 10 en 10. 
-- La secuencia se reinicia cuando llega al máximo permitido.
CREATE SEQUENCE Seq_IdMunicipio_C
    START WITH 100
    INCREMENT BY 10
    CYCLE;
GO

-- Crear tabla 'Municipios_Test' que almacena los municipios. 
-- No se usa IDENTITY porque los IDs se generan con la secuencia.
CREATE TABLE Municipios_Test (
    idMunicipio CHAR(3) PRIMARY KEY,
    municipio VARCHAR(30) NOT NULL,
    idDepartamento CHAR(2)
);
GO

-- Insertar en la tabla 'Municipios_Test' usando la secuencia para generar el ID.
INSERT INTO Municipios_Test (idMunicipio, municipio, idDepartamento)
VALUES (NEXT VALUE FOR Seq_IdMunicipio_C, 'Apopa', '10');
GO

-- 2. Crear secuencia para IDs de empleados con reinicio. 
-- Esta secuencia asigna un ID unico de tipo entero para cada empleado, empezando en 1.
CREATE SEQUENCE Seq_IdEmpleado_C
    START WITH 1
    INCREMENT BY 1
    CYCLE;
GO

-- Crear tabla 'Empleados_Test' que almacena la informacion de los empleados. 
CREATE TABLE Empleados_Test (
    idEmpleado INT PRIMARY KEY,
    nombresEmpleados VARCHAR(100) NOT NULL,
    apellidoEmpleados VARCHAR(100) NOT NULL
);
GO

-- Insertar en la tabla 'Empleados_Test' usando la secuencia para generar el ID de empleado.
INSERT INTO Empleados_Test (idEmpleado, nombresEmpleados, apellidoEmpleados)
VALUES (NEXT VALUE FOR Seq_IdEmpleado_C, 'Carlos', 'Lopez');
GO

-- 3. Crear secuencia para IDs de historial de préstamos con reinicio. 
-- Cada registro de prestamo tendra un ID único comenzando en 100 y aumentando de 5 en 5.
CREATE SEQUENCE Seq_IdHistorial_C
    START WITH 100
    INCREMENT BY 5
    CYCLE;
GO

-- Crear tabla 'HistorialPrestamos_Test' para almacenar registros de prestamos.
CREATE TABLE HistorialPrestamos_Test (
    idHistorial INT PRIMARY KEY,
    fechaEntregado DATE NOT NULL,
    fechaRecibido DATE NOT NULL
);
GO

-- Insertar en 'HistorialPrestamos_Test' usando la secuencia para el ID.
INSERT INTO HistorialPrestamos_Test (idHistorial, fechaEntregado, fechaRecibido)
VALUES (NEXT VALUE FOR Seq_IdHistorial_C, '2024-11-01', '2024-11-10');
GO

-- Consultas de prueba para verificar la insercion de datos en cada tabla.
SELECT * FROM Municipios_Test;
GO
SELECT * FROM Empleados_Test;
GO
SELECT * FROM  HistorialPrestamos_Test
