-- LUCIO L. LANDERO
-- INSTEAD TRIGGERS, Ejercicio 5.

-- agregaremos un campo "precio" y "fechaActualizacion" en tabla libros
ALTER TABLE libros 
ADD precio DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    fechaActualizacion DATE NOT NULL DEFAULT GETDATE();
GO

-- creacion del instead trigger
CREATE OR ALTER TRIGGER trgPrevenirActualizacionPreciosAntiguos
ON libros
INSTEAD OF UPDATE
AS
BEGIN
    -- Previene la actualizacion si el libro tiene mas de 30 dias desde la ultima actualizacion de precio
    IF EXISTS (
        SELECT 1 
        FROM inserted i
        JOIN libros l ON i.ISBN = l.ISBN
        WHERE DATEDIFF(DAY, l.fechaActualizacion, GETDATE()) > 30
          AND i.precio <> l.precio -- Esto verifica si el precio esta siendo modificado
    )
    BEGIN
        -- Esto evitara la actualizacion y lanza un error
        RAISERROR('No se puede actualizar el precio de un libro con mas de 30 días desde su ultima actualizacion.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
    
    -- Si no se cumple la condicion anterior, se permitira la actualizacion
    UPDATE libros
    SET precio = i.precio,
        fechaActualizacion = GETDATE()
    FROM inserted i
    WHERE libros.ISBN = i.ISBN;
END;
GO

-- AFTER TRIGGER, Ejercicio 1.

-- creamos una nueva tabla llamada historialPrecios
CREATE TABLE historialPrecios (
    idHistorialPrecio INT PRIMARY KEY IDENTITY(1,1),
    ISBN CHAR(13) NOT NULL,
    precioAnterior DECIMAL(10, 2) NOT NULL,
    precioNuevo DECIMAL(10, 2) NOT NULL,
    fechaCambio DATE NOT NULL,
    FOREIGN KEY (ISBN) REFERENCES libros(ISBN)
);
GO

-- creacion del after trigger para el ejercicio 1
CREATE OR ALTER TRIGGER trgRegistrarHistorialPrecios
ON libros
AFTER UPDATE
AS
BEGIN
    -- Insertar en historialPrecios solo si el precio ha cambiado
    INSERT INTO historialPrecios (ISBN, precioAnterior, precioNuevo, fechaCambio)
    SELECT d.ISBN, d.precio, i.precio, GETDATE()
    FROM inserted i
    JOIN deleted d ON i.ISBN = d.ISBN
    WHERE i.precio <> d.precio; -- Verificar si hay cambio en el precio
END;
GO

-- AFTER TRIGGER, Ejercicio 2.

-- modificaremos la tabla lectores agregando un campo "fechaUltimaVisita".
ALTER TABLE lectores
ADD FechaUltimaVisita DATE;

CREATE OR ALTER TRIGGER trgUpdateFechaUltimaVisita
ON prestamos
AFTER UPDATE
AS
BEGIN
    -- Solo se actualizara cuando el campo "fechaDevolucion" sea modificado
    IF UPDATE(fechaDevolucion)
    BEGIN
        UPDATE lectores
        SET FechaUltimaVisita = GETDATE()
        FROM lectores
        INNER JOIN inserted i ON lectores.idLector = i.idLector;
    END
END;