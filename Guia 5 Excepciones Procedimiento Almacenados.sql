-- Excepciones con Procedimientos Almacenados
-- Excepción 1: Procedimiento Almacenado para Insertar Autores con Validación de Duplicidad
-- Este procedimiento lanzará una excepción si se intenta insertar un autor con el mismo nombre y apellido.

CREATE OR ALTER PROCEDURE spInsertarAutor
    @nombreAutor VARCHAR(45),
    @apellidoAutor VARCHAR(45)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM autores WHERE nombreAutor = @nombreAutor AND apellidoAutor = @apellidoAutor)
    BEGIN
        RAISERROR('El autor ya existe en la base de datos.', 16, 1);
        RETURN;
    END
	DECLARE @newId INT;

	SELECT @newId = ISNULL(MAX(idAutor), 0) + 1 FROM autores;

    INSERT INTO autores (idAutor, nombreAutor, apellidoAutor)
    VALUES (@newId, @nombreAutor, @apellidoAutor);
END
GO

-- COMPROBACION

-- Primer intento: insertar un autor nuevo (debería funcionar)
EXEC spInsertarAutor 'Paulo', 'Cohelo';
select * from autores;
GO
-- Segundo intento: intentar insertar el mismo autor (debería fallar)
EXEC spInsertarAutor 'Paulo', 'Cohelo';
GO

-- Excepción 2: Trigger para Evitar Empleados Menores de Edad
-- Este trigger evita la inserción de empleados con una fecha de nacimiento que indique que tienen menos de 18 años.

CREATE OR ALTER TRIGGER trgValidarEdadEmpleado
ON empleados
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE DATEDIFF(YEAR, fechanacEmpleado, GETDATE()) < 18
    )
    BEGIN
        RAISERROR('El empleado debe tener al menos 18 años.', 16, 1);
        ROLLBACK;
    END
END
GO

-- COMPROBACION
-- Insertar un empleado menor de edad (debería fallar)
INSERT INTO empleados (idEmpleado, nombresEmpleados, apellidoEmpleados, duiEmpleado, isssEmpleado, fechanacEmpleado, telefonoEmpleado, correoEmpleado, idCargo, idDireccion)
VALUES (6, 'Juan', 'Pérez', '09912378-7', '099123823', '2010-05-01', '7755-1423', 'juan.perez@email.com', 3, 3);
GO
-- Insertar un empleado mayor de edad (debería funcionar)
INSERT INTO empleados (idEmpleado, nombresEmpleados, apellidoEmpleados, duiEmpleado, isssEmpleado, fechanacEmpleado, telefonoEmpleado, correoEmpleado, idCargo, idDireccion)
VALUES (7, 'Maria', 'Gomez', '08876543-2', '088765432', '1995-08-15', '7744-2211', 'maria.gomez@email.com', 4, 2);
GO
SELECT * FROM empleados;
GO

-- Excepción 3: Procedimiento para Insertar Cargos con Validación de Nombre Único
-- Este procedimiento verifica que el nombre del cargo sea único antes de insertarlo.

CREATE OR ALTER PROCEDURE spInsertarCargo
    @cargo VARCHAR(25)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM cargos WHERE cargo = @cargo)
    BEGIN
        RAISERROR('El cargo ya existe.', 16, 1);
        RETURN;
    END

	DECLARE @newId INT;

	SELECT @newId = ISNULL(MAX(idCargo), 0) + 1 FROM cargos;

    INSERT INTO cargos (idCargo, cargo)
    VALUES (@newId, @cargo);
END
GO

-- COMPROBACION

-- Insertar un cargo nuevo (debería funcionar)
EXEC spInsertarCargo 'Administrador';
GO
select * from cargos;
GO
-- Intentar insertar el mismo cargo de nuevo (debería fallar)
EXEC spInsertarCargo 'Administrador';
GO
