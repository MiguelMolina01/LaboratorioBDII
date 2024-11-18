-- Excepción 4: Trigger para Validar Valor de Mora en la Tabla moras
-- Este trigger lanza una excepción si el valor de moraDia es menor que cero.

CREATE TRIGGER trgValidarMoraPositiva
ON moras
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE moraDia < 0
    )
    BEGIN
        RAISERROR('El valor de mora por día debe ser positivo.', 16, 1);
        ROLLBACK;
    END
END
GO

-- COMPROBACION

-- Intentar insertar una mora con valor negativo (debería fallar)
INSERT INTO moras (idMora, cantidadDias, moraDia, cantidadMora, idPrestamo)
VALUES (8, 5, -1.50, -7.50, 6);
GO
select * from moras;
GO

-- Excepción 5: Procedimiento para Insertar Editoriales con Validación de Nombre Único
-- Este procedimiento almacenado lanzará una excepción si se intenta insertar una editorial ya existente.

CREATE PROCEDURE spInsertarEditorial
    @editorial VARCHAR(45)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM editoriales WHERE editorial = @editorial)
    BEGIN
        RAISERROR('La editorial ya existe.', 16, 1);
        RETURN;
    END

	DECLARE @newId INT;

	SELECT @newId = ISNULL(MAX(idEditorial), 0) + 1 FROM editoriales;

    INSERT INTO editoriales (idEditorial, editorial)
    VALUES (@newId, @editorial);
END
GO

-- COMPROBACION

-- Insertar una editorial nueva (debería funcionar)
EXEC spInsertarEditorial 'HarperCollins';
GO
select * from editoriales;
GO
-- Intentar insertar la misma editorial de nuevo (debería fallar)
EXEC spInsertarEditorial 'HarperCollins';
GO


-- Excepción 6: Trigger para Evitar Usuarios con el Mismo Nombre de Usuario
-- Este trigger evitará la creación de dos usuarios con el mismo nombre.

CREATE OR ALTER TRIGGER trgValidarUsuarioUnico
ON usuarios
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT usuario
        FROM usuarios
        GROUP BY usuario
        HAVING COUNT(*) > 1
    )
    BEGIN
        RAISERROR('El nombre de usuario ya existe.', 16, 1);
        ROLLBACK;
    END
END
GO

-- COMPROBACION

-- Primer intento: insertar un usuario (debería funcionar)
INSERT INTO usuarios (usuario, contrasenia, idRol, idEmpleado) 
VALUES ('Biblio_sumrandom', HASHBYTES('SHA2_256', 'contraseña01'), 2, 5);
GO
-- Segundo intento: insertar el mismo usuario (debería fallar)
INSERT INTO usuarios (usuario, contrasenia, idRol, idEmpleado) 
VALUES ('Biblio_sumrandom', HASHBYTES('SHA2_256', 'contraseña02'), 2, 7);
GO

select * from usuarios;
GO