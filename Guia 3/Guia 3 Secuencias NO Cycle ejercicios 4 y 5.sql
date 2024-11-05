-- 4. Crear secuencia para IDs de prestamos sin reinicio.
-- Asigna un ID unico para cada prestamo, comenzando en 200 y aumentando en 10.
CREATE SEQUENCE Seq_IdPrestamo_NC
    START WITH 200
    INCREMENT BY 10
    NO CYCLE;
GO

-- Crear tabla 'Prestamos_Test' para almacenar los datos de prestamos.
CREATE TABLE Prestamos_Test (
    idPrestamo INT PRIMARY KEY,
    fechaPrestamo DATE NOT NULL,
    fechaDevolucion DATE NOT NULL
);
GO

-- Insertar en 'Prestamos_Test' usando la secuencia para el ID del prestamo.
INSERT INTO Prestamos_Test (idPrestamo, fechaPrestamo, fechaDevolucion)
VALUES (NEXT VALUE FOR Seq_IdPrestamo_NC, '2024-11-01', '2024-11-15');
GO

-- 5. Crear secuencia para IDs de autores sin reinicio. 
-- Esta secuencia genera un ID unico para cada autor, comenzando en 300 y aumentando de 2 en 2.
CREATE SEQUENCE Seq_IdAutor_NC
    START WITH 300
    INCREMENT BY 2
    NO CYCLE;
GO

-- Crear tabla 'Autores_Test' para almacenar informacion sobre los autores.
CREATE TABLE Autores_Test (
    idAutor INT PRIMARY KEY,
    nombreAutor VARCHAR(45) NOT NULL,
    apellidoAutor VARCHAR(45) NOT NULL
);
GO

-- Insertar en 'Autores_Test' usando la secuencia para el ID del autor.
INSERT INTO Autores_Test (idAutor, nombreAutor, apellidoAutor)
VALUES (NEXT VALUE FOR Seq_IdAutor_NC, 'Ana', 'Martínez');
GO

-- Consultas de prueba para verificar la insercion de datos en cada tabla.
SELECT * FROM Prestamos_Test;
GO
SELECT * FROM Autores_Test;
GO