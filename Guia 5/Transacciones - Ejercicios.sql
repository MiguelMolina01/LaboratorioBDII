-- ACTUALIZACIÓN DE LA INFORMACIÓN DE UN LECTOR Y SU DIRECCIÓN
BEGIN TRANSACTION; 
DECLARE @idLector INT = 1;
DECLARE @idDireccion INT;
SELECT @idDireccion = idDireccion FROM lectores WHERE idLector = @idLector;

BEGIN TRY
    UPDATE direcciones
    SET linea1 = 'Nueva Calle 789', linea2 = 'Apartamento 5C', codigoPostal = '987654'
    WHERE idDireccion = @idDireccion;

    UPDATE lectores
    SET nombreLector = 'Carlos', apellidoLector = 'Gómez', telefonoLector = '5678-1234'
    WHERE idLector = @idLector;

    COMMIT;
END TRY
BEGIN CATCH
    ROLLBACK;
    PRINT 'Error en la transacción. Se ha revertido la actualización del lector y su dirección.';
END CATCH;
GO


-- REGISTRO DE UN NUEVO AUTOR Y ASOCIACIÓN DE SUS LIBROS
BEGIN TRANSACTION;  -- Inicia una nueva transacción
DECLARE @idAutor INT;

INSERT INTO autores (nombreAutor, apellidoAutor)
VALUES ('Miguel', 'Cervantes');
SET @idAutor = SCOPE_IDENTITY();

BEGIN TRY
    INSERT INTO autoresLibros (idAutor, ISBN)
    VALUES (@idAutor, '1234567890123'),
           (@idAutor, '0987654321098');

    COMMIT;
END TRY
BEGIN CATCH
    ROLLBACK;
    PRINT 'Error en la transacción. Se ha revertido el registro del autor y la asociación de libros.';
END CATCH;
GO


-- REGISTRO DE UN NUEVO PRÉSTAMO DE LIBRO
BEGIN TRANSACTION; 
DECLARE @idHistorial INT, @idPrestamo INT;

INSERT INTO historialPrestamos (fechaEntregado, fechaRecibido)
VALUES (GETDATE(), NULL);
SET @idHistorial = SCOPE_IDENTITY();

BEGIN TRY
    INSERT INTO prestamos (fechaPrestamo, fechaDevolucion, idHistorial, idEmpleado, idLector)
    VALUES (GETDATE(), DATEADD(DAY, 14, GETDATE()), @idHistorial, 1, 1); -- Ajusta los IDs de empleado y lector
    SET @idPrestamo = SCOPE_IDENTITY();

    INSERT INTO prestamoLibro (ISBN, idPrestamo)
    VALUES ('1234567890123', @idPrestamo); 

    COMMIT; 
END TRY
BEGIN CATCH
    ROLLBACK;  
    PRINT 'Error en la transacción. Se ha revertido el registro del préstamo.';
END CATCH;
GO

-- ACTUALIZAR LA DEVOLUCIÓN DE UN LIBRO Y CALCULAR MORA
BEGIN TRANSACTION;
DECLARE @idPrestamo INT = 1, @fechaDevolucion DATE = GETDATE(), @fechaLimite DATE, @cantidadDiasMora INT;

SELECT @fechaLimite = fechaDevolucion FROM prestamos WHERE idPrestamo = @idPrestamo;
SET @cantidadDiasMora = DATEDIFF(DAY, @fechaLimite, @fechaDevolucion);

BEGIN TRY
    UPDATE historialPrestamos
    SET fechaRecibido = @fechaDevolucion
    WHERE idHistorial = (SELECT idHistorial FROM prestamos WHERE idPrestamo = @idPrestamo);

    IF @cantidadDiasMora > 0
    BEGIN
        INSERT INTO moras (cantidadDias, moraDia, cantidadMora, idPrestamo)
        VALUES (@cantidadDiasMora, 0.50, @cantidadDiasMora * 0.50, @idPrestamo); 
    END

    COMMIT; 
END TRY
BEGIN CATCH
    ROLLBACK; 
    PRINT 'Error en la transacción. Se ha revertido la actualización de la devolución.';
END CATCH;
GO

-- REGISTRO DE UN NUEVO LIBRO CON AUTOR Y CATEGORÍA
BEGIN TRANSACTION;
DECLARE @ISBN CHAR(13) = '0987654321098';

INSERT INTO libros (ISBN, libro, estado, fechaPublicacion, idEditorial, idCategoria, idCondicionLibro)
VALUES (@ISBN, 'El Quijote', 'Disponible', '1605-01-01', 1, 1, 1);

BEGIN TRY
    INSERT INTO autoresLibros (idAutor, ISBN)
    VALUES (1, @ISBN);

    COMMIT;
END TRY
BEGIN CATCH
    ROLLBACK;
    PRINT 'Error en la transacción. Se ha revertido el registro del libro y su autor.';
END CATCH;


