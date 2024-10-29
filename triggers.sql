-- Ejercicio 3
ALTER TABLE lectores
ADD fechaNacLector DATE;
GO

CREATE OR ALTER TRIGGER trgValidarEdadCliente
ON lectores
INSTEAD OF INSERT
AS
BEGIN
    -- Insertar en la tabla solo si el cliente tiene m�s de 18 a�os
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE DATEDIFF(YEAR, FechaNacimiento, GETDATE()) < 18
    )
    BEGIN
        -- Si es menor de 18, evitar la inserci�n y lanzar un mensaje de error
        RAISERROR('El lector debe tener m�s de 18 a�os.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- Si tiene m�s de 18, permitir la inserci�n
    INSERT INTO lectores (idLector, nombreLector, apellidoLector, duiLector, telefonoLector, idDireccion, FechaNacimiento)
    SELECT idLector, nombreLector, apellidoLector, duiLector, telefonoLector, idDireccion, FechaNacimiento
    FROM inserted;
END;
GO
--- comprobacion de que funcione el trigger 

-- Intento de insertar un lector menor de 18 a�os
INSERT INTO lectores (idLector, nombreLector, apellidoLector, duiLector, telefonoLector, idDireccion, FechaNacimiento)
VALUES (2001, 'George', 'Terantino', '02225678-9', '4485-6789', 2, '2010-01-01'); -- Fecha de nacimiento indica menos de 18 a�os
select * from lectores;

-- Intento de insertar un lector mayor de 18 a�os
INSERT INTO lectores (idLector, nombreLector, apellidoLector, duiLector, telefonoLector, idDireccion, FechaNacimiento)
VALUES (2002, 'Marvin', 'Halpert', '23456789-0', '2509-1234', 3, '1995-04-20'); -- Fecha de nacimiento indica m�s de 18 a�os

select * from lectores;

-- Ejercicio 4

CREATE TRIGGER prevent_delete_assigned_books
ON libros
INSTEAD OF DELETE
AS
BEGIN
    -- Verifica si el libro que se intenta eliminar est� en la tabla prestamoLibro
    IF EXISTS (SELECT 1 FROM prestamoLibro WHERE ISBN IN (SELECT ISBN FROM deleted))
    BEGIN
        -- Si el libro est� asignado, lanza un mensaje de error y no realiza la eliminaci�n
        RAISERROR ('No se puede eliminar el libro porque est� asignado a un cliente.', 16, 1);
    END
    ELSE
    BEGIN
        -- Si no est� asignado, permite la eliminaci�n
        DELETE FROM libros WHERE ISBN IN (SELECT ISBN FROM deleted);
    END
END;

-- Inserta un libro de prueba
INSERT INTO libros (ISBN, libro, estado, fechaPublicacion, idEditorial, idCategoria, idCondicionLibro)
VALUES ('1234567890123', 'Libro de Prueba', 'Disponible', '2023-01-01', 1, 1, 1);

-- Inserta una asignaci�n en la tabla `prestamoLibro` que lo vincule a un pr�stamo
INSERT INTO prestamoLibro (idPrestamoLibro, ISBN, idPrestamo)
VALUES (1, '1234567890123', 1);


-- Intenta eliminar el libro asignado
DELETE FROM libros WHERE ISBN = '1234567890123';

-- Inserta otro libro sin asignarlo a `prestamoLibro`
INSERT INTO libros (ISBN, libro, estado, fechaPublicacion, idEditorial, idCategoria, idCondicionLibro)
VALUES ('9876543210987', 'Libro No Asignado', 'Disponible', '2023-01-01', 1, 1, 1);

-- Intenta eliminar el libro no asignado (deber�a eliminarse sin problemas)
DELETE FROM libros WHERE ISBN = '9876543210987';

-- Verifica que el segundo libro fue eliminado con �xito.

SELECT * FROM libros;
SELECT * FROM libros WHERE ISBN = '1234567890123';

