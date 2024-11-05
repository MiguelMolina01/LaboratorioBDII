-- 4. Crear secuencia para IDs de mora con reinicio. 
-- Genera un ID unico para cada registro de mora, iniciando en 1.
CREATE SEQUENCE Seq_IdMora_C
    START WITH 1
    INCREMENT BY 1
    CYCLE;
GO

-- Crear tabla 'Moras_Test' para almacenar informacion sobre moras.
CREATE TABLE Moras_Test (
    idMora INT PRIMARY KEY,
    cantidadDias INT NOT NULL,
    moraDia DECIMAL(10, 2) NOT NULL
);
GO

-- Insertar en 'Moras_Test' usando la secuencia para el ID de mora.
INSERT INTO Moras_Test (idMora, cantidadDias, moraDia)
VALUES (NEXT VALUE FOR Seq_IdMora_C, 5, 1.25);
GO

-- 5. Crear secuencia para IDs de usuarios con reinicio. 
-- Esta secuencia genera un ID unico para cada usuario, comenzando en 1.
CREATE SEQUENCE Seq_IdUsuario_C
    START WITH 1
    INCREMENT BY 1
    CYCLE;
GO

-- Crear tabla 'Usuarios_Test' que almacena la informacion de usuarios.
CREATE TABLE Usuarios_Test (
    idUsuario INT PRIMARY KEY,
    usuario VARCHAR(50) NOT NULL,
    contrasenia VARCHAR(50) NOT NULL
);
GO

-- Insertar en 'Usuarios_Test' usando la secuencia para generar el ID del usuario.
INSERT INTO Usuarios_Test (idUsuario, usuario, contrasenia)
VALUES (NEXT VALUE FOR Seq_IdUsuario_C, 'usuario1', 'password123');
GO

-- Consultas de prueba para verificar la insercion de datos en cada tabla.
SELECT * FROM Moras_Test;
GO
SELECT * FROM Usuarios_Test;
GO