-- LUCIO L. LANDERO
-- Comprobacion de los triggers creados para guia #2 lab. base de datos 2.

--  Prueba del Trigger trgPrevenirActualizacionPreciosAntiguos
-- Insercion de un libro con una fecha de actualizacion antigua
INSERT INTO libros (ISBN, libro, estado, fechaPublicacion, idEditorial, idCategoria, idCondicionLibro, precio, fechaActualizacion)
VALUES ('1234567890123', 'Libro de Prueba', 'Disponible', '2023-01-01', 1, 1, 1, 20.00, DATEADD(DAY, -31, GETDATE()));
GO
select * from libros;
GO
-- Actualizacion del precio del libro (deberia fallar por el trigger)
UPDATE libros
SET precio = 25.00
WHERE ISBN = '1234567890123';
GO

-- Insercion libro con una fecha de actualizacion reciente (deberia permitir la actualizacion)
INSERT INTO libros (ISBN, libro, estado, fechaPublicacion, idEditorial, idCategoria, idCondicionLibro, precio, fechaActualizacion)
VALUES ('9876543210987', 'Libro de Prueba 2', 'Disponible', '2023-01-01', 1, 1, 1, 15.00, GETDATE());
GO
select * from libros;
GO

UPDATE libros
SET precio = 17.00
WHERE ISBN = '9876543210987';
Go
select * from libros;

-------------------------------------------------------------------------------------------------
--  Prueba del Trigger trgRegistrarHistorialPrecios

-- Actualizacion precio del libro para activar el trigger de historial de precios
UPDATE libros
SET precio = 22.00
WHERE ISBN = '9876543210987';
GO
select * from libros;

-- Verificacion  cambio fue registrado en la tabla historialPrecios
SELECT * FROM historialPrecios
WHERE ISBN = '9876543210987';
GO

-----------------------------------------------------------------------------------------
-- Prueba del Trigger trgUpdateFechaUltimaVisita

-- Insercion de un lector de prueba
INSERT INTO lectores (idLector, nombreLector, apellidoLector, duiLector, telefonoLector, idDireccion)
VALUES (117, 'John', 'Doe', '09123499-8', '5211-4555', 2);
select * from lectores;

-- Insercion de un prestamo de prueba
INSERT INTO prestamos (idPrestamo, fechaPrestamo, fechaDevolucion, idHistorial, idEmpleado, idLector)
VALUES (12, '2024-10-20', '2024-10-25', 8, 3, 117);
select * from prestamos;

-- el libro/prestamo se entrego un dia antes
UPDATE prestamos
SET fechaDevolucion = '2024-10-24'
WHERE idPrestamo = 12;
select * from prestamos;

-- verificacion de que el trigger funciono cuando de modifico la fechaDevolucion
SELECT idLector, nombreLector, apellidoLector, FechaUltimaVisita
FROM lectores
WHERE idLector = 117;

