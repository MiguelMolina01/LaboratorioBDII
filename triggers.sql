-- Ejercicio 3
ALTER TABLE lectores
ADD fechaNacLector DATE;
GO

CREATE OR ALTER TRIGGER trgValidarEdadCliente
ON lectores
INSTEAD OF INSERT
AS
BEGIN
    -- Insertar en la tabla solo si el cliente tiene más de 18 años
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE DATEDIFF(YEAR, FechaNacimiento, GETDATE()) < 18
    )
    BEGIN
        -- Si es menor de 18, evitar la inserción y lanzar un mensaje de error
        RAISERROR('El lector debe tener más de 18 años.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- Si tiene más de 18, permitir la inserción
    INSERT INTO lectores (idLector, nombreLector, apellidoLector, duiLector, telefonoLector, idDireccion, FechaNacimiento)
    SELECT idLector, nombreLector, apellidoLector, duiLector, telefonoLector, idDireccion, FechaNacimiento
    FROM inserted;
END;
GO
--- comprobacion de que funcione el trigger 

-- Intento de insertar un lector menor de 18 años
INSERT INTO lectores (idLector, nombreLector, apellidoLector, duiLector, telefonoLector, idDireccion, FechaNacimiento)
VALUES (2001, 'George', 'Terantino', '02225678-9', '4485-6789', 2, '2010-01-01'); -- Fecha de nacimiento indica menos de 18 años
select * from lectores;

-- Intento de insertar un lector mayor de 18 años
INSERT INTO lectores (idLector, nombreLector, apellidoLector, duiLector, telefonoLector, idDireccion, FechaNacimiento)
VALUES (2002, 'Marvin', 'Halpert', '23456789-0', '2509-1234', 3, '1995-04-20'); -- Fecha de nacimiento indica más de 18 años

select * from lectores;

-- Ejercicio 4

CREATE TRIGGER trgPrevenirEliminacionLibrosAsignados
ON libros
INSTEAD OF DELETE
AS
BEGIN
    -- Verifica si el libro que se intenta eliminar está en la tabla prestamoLibro
    IF EXISTS (SELECT 1 FROM prestamoLibro WHERE ISBN IN (SELECT ISBN FROM deleted))
    BEGIN
        -- Si el libro está asignado, lanza un mensaje de error y no realiza la eliminación
        RAISERROR ('No se puede eliminar el libro porque está asignado a un cliente.', 16, 1);
    END
    ELSE
    BEGIN
        -- Si no está asignado, permite la eliminación
        DELETE FROM libros WHERE ISBN IN (SELECT ISBN FROM deleted);
    END
END;

-- Inserta un libro de prueba
INSERT INTO libros (ISBN, libro, estado, fechaPublicacion, idEditorial, idCategoria, idCondicionLibro)
VALUES ('1234567890123', 'Libro de Prueba', 'Disponible', '2023-01-01', 1, 1, 1);

-- Inserta una asignación en la tabla `prestamoLibro` que lo vincule a un préstamo
INSERT INTO prestamoLibro (idPrestamoLibro, ISBN, idPrestamo)
VALUES (1, '1234567890123', 1);


-- Intenta eliminar el libro asignado
DELETE FROM libros WHERE ISBN = '1234567890123';

-- Inserta otro libro sin asignarlo a `prestamoLibro`
INSERT INTO libros (ISBN, libro, estado, fechaPublicacion, idEditorial, idCategoria, idCondicionLibro)
VALUES ('9876543210987', 'Libro No Asignado', 'Disponible', '2023-01-01', 1, 1, 1);

-- Intenta eliminar el libro no asignado (debería eliminarse sin problemas)
DELETE FROM libros WHERE ISBN = '9876543210987';

-- Verifica que el segundo libro fue eliminado con éxito.

SELECT * FROM libros;
SELECT * FROM libros WHERE ISBN = '1234567890123';

