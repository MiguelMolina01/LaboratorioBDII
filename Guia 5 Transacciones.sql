--Transacción 1: Registrar un préstamo nuevo
BEGIN TRANSACTION;

BEGIN TRY
  
    DECLARE @idHistorial INT;
    DECLARE @idPrestamo INT;
    DECLARE @fechaPrestamo DATE = GETDATE();
    DECLARE @fechaDevolucion DATE = DATEADD(DAY, 15, GETDATE()); 
    DECLARE @idEmpleado INT = 1; 
    DECLARE @idLector INT = 2; 
    DECLARE @ISBN CHAR(13) = '1234567890123'; 

    -- Obtener el próximo idHistorial
    SELECT @idHistorial = ISNULL(MAX(idHistorial), 0) + 1 FROM historialPrestamos;

    -- Insertar en historialPrestamos
    INSERT INTO historialPrestamos (idHistorial, fechaEntregado, fechaRecibido)
    VALUES (@idHistorial, @fechaPrestamo, '1900-01-01'); 

    -- Obtener el próximo idPrestamo
    SELECT @idPrestamo = ISNULL(MAX(idPrestamo), 0) + 1 FROM prestamos;

    -- Insertar en prestamos
    INSERT INTO prestamos (idPrestamo, fechaPrestamo, fechaDevolucion, idHistorial, idEmpleado, idLector)
    VALUES (@idPrestamo, @fechaPrestamo, @fechaDevolucion, @idHistorial, @idEmpleado, @idLector);

    -- Insertar el libro en prestamoLibro
    INSERT INTO prestamoLibro (idPrestamoLibro, ISBN, idPrestamo)
    VALUES ((SELECT ISNULL(MAX(idPrestamoLibro), 0) + 1 FROM prestamoLibro), @ISBN, @idPrestamo);

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;

-- Verificar si se insertó un nuevo préstamo
SELECT * FROM prestamos WHERE idPrestamo = (SELECT MAX(idPrestamo) FROM prestamos);

-- Verificar el registro en historialPrestamos
SELECT * FROM historialPrestamos WHERE idHistorial = (SELECT MAX(idHistorial) FROM historialPrestamos);

-- Verificar si el libro ha sido asociado al préstamo
SELECT * FROM prestamoLibro WHERE idPrestamo = (SELECT MAX(idPrestamo) FROM prestamos);

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

--Transacción 2: Registrar un empleado nuevo

BEGIN TRANSACTION;

BEGIN TRY
 
    DECLARE @idEmpleado INT;
    DECLARE @nombresEmpleados VARCHAR(100) = 'Juan';
    DECLARE @apellidoEmpleados VARCHAR(100) = 'Pérez';
    DECLARE @duiEmpleado CHAR(10) = '1234567890';
    DECLARE @isssEmpleado CHAR(9) = '123456789';
    DECLARE @fechanacEmpleado DATE = '1990-05-15';
    DECLARE @telefonoEmpleado VARCHAR(15) = '123456789';
    DECLARE @correoEmpleado VARCHAR(100) = 'juan.perez@empresa.com';
    DECLARE @idCargo INT = 1; 
    DECLARE @idDireccion INT = 10;  

    -- Obtener el siguiente idEmpleado disponible
    SELECT @idEmpleado = ISNULL(MAX(idEmpleado), 0) + 1 FROM empleados;

    -- Insertar registro en empleados
    INSERT INTO empleados (idEmpleado, nombresEmpleados, apellidoEmpleados, duiEmpleado, isssEmpleado, fechanacEmpleado, telefonoEmpleado, correoEmpleado, idCargo, idDireccion)
    VALUES (@idEmpleado, @nombresEmpleados, @apellidoEmpleados, @duiEmpleado, @isssEmpleado, @fechanacEmpleado, @telefonoEmpleado, @correoEmpleado, @idCargo, @idDireccion);

    -- Confirmar la transacción
    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    -- Revertir la transacción en caso de error
    ROLLBACK TRANSACTION;
    THROW;  
END CATCH;

SELECT * FROM empleados WHERE duiEmpleado = '1234567890';
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

-- Transacción 3: Registrar una mora
BEGIN TRANSACTION;

BEGIN TRY
   
    DECLARE @idMora INT;
    DECLARE @idPrestamo INT = 1; 
    DECLARE @dias INT = 5;
    DECLARE @moraDia DECIMAL(10, 2) = 0.50;

    -- Calcular el próximo idMora
    SELECT @idMora = ISNULL(MAX(idMora), 0) + 1 FROM moras;

    -- Insertar mora
    INSERT INTO moras (idMora, cantidadDias, moraDia, cantidadMora, idPrestamo)
    VALUES (@idMora, @dias, @moraDia, @dias * @moraDia, @idPrestamo);

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
 
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;

-- Verificar si la mora fue registrada correctamente
SELECT * FROM moras WHERE idMora = (SELECT MAX(idMora) FROM moras);


----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

--Transacción 4: Registrar un nuevo libro y asociarlo con autores

BEGIN TRANSACTION;

BEGIN TRY
  
    DECLARE @ISBN CHAR(13) = '9781234567897';
    DECLARE @titulo VARCHAR(100) = 'Nuevo Libro';
    DECLARE @estado VARCHAR(45) = 'Disponible';
    DECLARE @fechaPublicacion DATE = '2024-01-01';
    DECLARE @idEditorial INT = 1; -- Suponiendo una editorial existente
    DECLARE @idCategoria INT = 1; -- Suponiendo una categoría existente
    DECLARE @idCondicion INT = 1; -- Suponiendo una condición existente
    DECLARE @idAutor INT = 1; -- Suponiendo un autor existente

    -- Insertar libro
    INSERT INTO libros (ISBN, libro, estado, fechaPublicacion, idEditorial, idCategoria, idCondicionLibro)
    VALUES (@ISBN, @titulo, @estado, @fechaPublicacion, @idEditorial, @idCategoria, @idCondicion);

    -- Asociar el autor al libro
    INSERT INTO autoresLibros (idAutoresLibro, idAutor, ISBN)
    VALUES ((SELECT ISNULL(MAX(idAutoresLibro), 0) + 1 FROM autoresLibros), @idAutor, @ISBN);

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
  
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;

-- Verificar que el libro se ha insertado correctamente
SELECT * FROM libros WHERE ISBN = '9781234567897';

-- Verificar que el autor está asociado con el libro
SELECT * FROM autoresLibros WHERE ISBN = '9781234567897';
