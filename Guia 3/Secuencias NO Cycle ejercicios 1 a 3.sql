-- NO CYCLE
-- 1. Crear secuencia para IDs de departamentos sin reinicio. 
-- La secuencia comienza en 10 y aumenta de 1 en 1 sin volver a empezar.
CREATE SEQUENCE Seq_IdDepartamento_NC
    START WITH 10
    INCREMENT BY 1
    NO CYCLE;
GO

-- Crear tabla 'Departamentos_Test' para almacenar informacion sobre departamentos.
CREATE TABLE Departamentos_Test (
    idDepartamento CHAR(2) PRIMARY KEY,
    departamento VARCHAR(25) NOT NULL,
    pais VARCHAR(25)
);
GO

-- Insertar en 'Departamentos_Test' usando la secuencia para el ID de departamento.
INSERT INTO Departamentos_Test (idDepartamento, departamento, pais)
VALUES (NEXT VALUE FOR Seq_IdDepartamento_NC, 'San Vicente', 'El Salvador');
GO

-- 2. Crear secuencia para IDs de distritos sin reinicio.
-- Asigna un ID unico para cada distrito, comenzando en 1000 y aumentando en 50.
CREATE SEQUENCE Seq_IdDistrito_NC
    START WITH 1000
    INCREMENT BY 50
    NO CYCLE;
GO

-- Crear tabla 'Distritos_Test' para almacenar la informacion de distritos.
CREATE TABLE Distritos_Test (
    idDistrito CHAR(5) PRIMARY KEY,
    distrito VARCHAR(50) NOT NULL,
    idMunicipio CHAR(3)
);
GO

-- Insertar en 'Distritos_Test' usando la secuencia para el ID del distrito.
INSERT INTO Distritos_Test (idDistrito, distrito, idMunicipio)
VALUES (NEXT VALUE FOR Seq_IdDistrito_NC, 'Distrito Central', '100');
GO

-- 3. Crear secuencia para IDs de categorias sin reinicio. 
-- Genera IDs para cada categoria, empezando en 20 y aumentando de 5 en 5.
CREATE SEQUENCE Seq_IdCategoria_NC
    START WITH 20
    INCREMENT BY 5
    NO CYCLE;
GO

-- Crear tabla 'Categorias_Test' para almacenar informacion de categorias.
CREATE TABLE Categorias_Test (
    idCategoria INT PRIMARY KEY,
    categoria1 VARCHAR(45) NOT NULL
);
GO

-- Insertar en 'Categorias_Test' usando la secuencia para el ID de categoria.
INSERT INTO Categorias_Test (idCategoria, categoria1)
VALUES (NEXT VALUE FOR Seq_IdCategoria_NC, 'Electrónica');
GO

-- Consultas de prueba para verificar la insercion de datos en cada tabla.
SELECT * FROM Departamentos_Test;
GO
SELECT * FROM Distritos_Test;
GO
SELECT * FROM Categorias_Test;
GO