CREATE TRIGGER trgVerificarDisponibilidadLibro
ON prestamoLibro
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @ISBN CHAR(13);
    DECLARE @idPrestamo INT;

    SELECT @ISBN = ISBN, @idPrestamo = idPrestamo FROM inserted;

    -- Verificar si el libro ya est� en pr�stamo
    IF EXISTS (SELECT 1 FROM prestamoLibro WHERE ISBN = @ISBN)
    BEGIN
        PRINT'Ese libro ya est� en pr�stamo.';
        RETURN;
    END
    ELSE
    BEGIN
        -- Si el libro est� disponible, permite el pr�stamo
        INSERT INTO prestamoLibro (ISBN, idPrestamo)
        VALUES (@ISBN, @idPrestamo);
    END
END;
GO

--Prestamo de un libro No Disponible
INSERT INTO prestamoLibro (idPrestamoLibro, ISBN, idPrestamo) VALUES
	(1,'9788439732471', 1)
GO

--
CREATE TRIGGER trgPrevenirUpdatePrestamo
ON prestamos
INSTEAD OF UPDATE
AS
BEGIN
    -- Verificamos si se est� intentando actualizar un pr�stamo que ya tiene fecha de devoluci�n
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN prestamos p ON i.idPrestamo = p.idPrestamo
        WHERE p.fechaDevolucion IS NOT NULL
    )
    BEGIN
        -- Si se intenta cambiar un pr�stamo que ya tiene fecha de devoluci�n, se lanza un error
        PRINT'No se puede actualizar un pr�stamo que ya ha sido completado o cerrado.';
        RETURN;
    END

    -- Si no se encuentra ning�n pr�stamo con fecha de devoluci�n, se realiza la actualizaci�n normalmente
    UPDATE p
    SET 
        p.fechaPrestamo = i.fechaPrestamo,
        p.fechaDevolucion = i.fechaDevolucion,
        p.idHistorial = i.idHistorial,
        p.idEmpleado = i.idEmpleado,
        p.idLector = i.idLector
    FROM prestamos p
    INNER JOIN inserted i ON p.idPrestamo = i.idPrestamo;
END;
GO
-- Intenta actualizar un pr�stamo que ya tiene fecha de devoluci�n (deber�a fallar)
UPDATE prestamos
SET fechaPrestamo = '2024-10-18'
WHERE idPrestamo = 3; 

