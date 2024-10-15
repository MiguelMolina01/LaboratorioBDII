-- Desarollo ejercicio 4
-- Funcion que va a ListarPrestamosPorLector
CREATE FUNCTION ListarPrestamosPorLector (@idLector INT)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        p.idPrestamo,
        p.fechaPrestamo,
        p.fechaDevolucion,
        h.fechaEntregado,
        h.fechaRecibido
    FROM prestamos p
    INNER JOIN historialPrestamos h ON p.idHistorial = h.idHistorial
    WHERE p.idLector = @idLector
);
-- llamada de la funcion
select * from ListarPrestamosPorLector(4);
--------------------------------------------------------------------------------------
-- creacion de una procedimiento alamcenado

CREATE OR ALTER PROCEDURE sp_CRUD_Lectores
    @accion VARCHAR(10),
    @idLector INT = NULL,
    @nombreLector VARCHAR(45) = NULL,
    @apellidoLector VARCHAR(45) = NULL,
    @duiLector CHAR(10) = NULL,
    @telefonoLector VARCHAR(15) = NULL,
    @idDireccion INT = NULL  -- Cambié el valor predeterminado a NULL para que no sea obligatorio en todas las acciones.
AS
BEGIN
    SET NOCOUNT ON;

    IF @accion = 'SELECT'
    BEGIN
        SELECT * 
        FROM lectores 
        WHERE (@nombreLector IS NOT NULL AND nombreLector LIKE '%' + @nombreLector + '%')
        OR (@apellidoLector IS NOT NULL AND apellidoLector LIKE '%' + @apellidoLector + '%');
    END
    ELSE IF @accion = 'INSERT'
    BEGIN
        INSERT INTO lectores (idLector, nombreLector, apellidoLector, duiLector, telefonoLector, idDireccion)
        VALUES (@idLector, @nombreLector, @apellidoLector, @duiLector, @telefonoLector, @idDireccion);
    END
    ELSE IF @accion = 'UPDATE'
    BEGIN
        UPDATE lectores 
        SET nombreLector = @nombreLector,
            apellidoLector = @apellidoLector,
            duiLector = @duiLector,
            telefonoLector = @telefonoLector,
            idDireccion = @idDireccion
        WHERE idLector = @idLector;
    END
    ELSE IF @accion = 'DELETE'
    BEGIN
        DELETE FROM lectores 
        WHERE idLector = @idLector;
    END
END;

---------------------------------
-- SELECT
EXEC sp_CRUD_Lectores 'SELECT', @nombreLector = 'Gabriel';
-- or select con apellido
EXEC sp_CRUD_Lectores 'SELECT', @apellidoLector = 'Pérez';

-- INSERT
EXEC sp_CRUD_Lectores 'INSERT', @idLector = 1003, @nombreLector = 'John Doe', @apellidoLector = 'Smith ChupaChupz', @duiLector = '033456485', @telefonoLector = '22139900', @idDireccion = 5;

-- UPDATE
EXEC sp_CRUD_Lectores 'UPDATE', @idLector = 1003, @nombreLector = 'Jan Carlo', @apellidoLector = 'Pérez Martinez', @duiLector = '000897621', @telefonoLector = '99001000', @idDireccion = 4;

-- DELETE
EXEC sp_CRUD_Lectores 'DELETE', @idLector = 1003;