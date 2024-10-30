CREATE TRIGGER trgVerificarDisponibilidadLibro
ON prestamoLibro
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @ISBN CHAR(13);
    DECLARE @idPrestamo INT;

    SELECT @ISBN = ISBN, @idPrestamo = idPrestamo FROM inserted;

    -- Verificar si el libro ya está en préstamo
    IF EXISTS (SELECT 1 FROM prestamoLibro WHERE ISBN = @ISBN)
    BEGIN
        PRINT'Ese libro ya está en préstamo.';
        RETURN;
    END
    ELSE
    BEGIN
        -- Si el libro está disponible, permite el préstamo
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
    -- Verificamos si se está intentando actualizar un préstamo que ya tiene fecha de devolución
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN prestamos p ON i.idPrestamo = p.idPrestamo
        WHERE p.fechaDevolucion IS NOT NULL
    )
    BEGIN
        -- Si se intenta cambiar un préstamo que ya tiene fecha de devolución, se lanza un error
        PRINT'No se puede actualizar un préstamo que ya ha sido completado o cerrado.';
        RETURN;
    END

    -- Si no se encuentra ningún préstamo con fecha de devolución, se realiza la actualización normalmente
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
-- Intenta actualizar un préstamo que ya tiene fecha de devolución (debería fallar)
UPDATE prestamos
SET fechaPrestamo = '2024-10-18'
WHERE idPrestamo = 3; 

