-- Trigger 3: Actualizar Stock Después de una Préstamo/Reserva
CREATE TRIGGER trg_UpdateStock
ON prestamos
AFTER INSERT
AS
BEGIN
    DECLARE @idLibro INT, @cantidadPrestada INT;
    SELECT @idLibro = idLibro, @cantidadPrestada = cantidad FROM inserted;

    UPDATE libros
    SET stock = stock - @cantidadPrestada,
        fecha_actualizacion = GETDATE()
    WHERE idLibro = @idLibro;
END;
GO

-- Trigger 4: Registrar Cambios en Información del Cliente/Paciente
CREATE TRIGGER trg_AuditClientInfo_Update
ON lectores
AFTER UPDATE
AS
BEGIN
    DECLARE @idLector INT, @nombreAnterior NVARCHAR(50), @direccionAnterior NVARCHAR(100), @telefonoAnterior NVARCHAR(15);
    
    -- Obtener valores antiguos (antes de la actualización)
    SELECT @idLector = idLector, @nombreAnterior = nombres, @direccionAnterior = direccion, @telefonoAnterior = telefono
    FROM deleted;

    INSERT INTO auditoria_clientes (idLector, nombre_anterior, direccion_anterior, telefono_anterior, fecha_cambio)
    VALUES (@idLector, @nombreAnterior, @direccionAnterior, @telefonoAnterior, GETDATE());
END;
GO

-- Trigger 5: Actualizar el Total de una Factura Después de Insertar Detalles
CREATE TRIGGER trg_UpdateTotal_AfterDetailInsert
ON detalle_factura
AFTER INSERT
AS
BEGIN
    DECLARE @idFactura INT;
    SELECT @idFactura = idFactura FROM inserted;

    -- Actualizar el total de la factura
    UPDATE facturas
    SET total = (SELECT SUM(precio * cantidad) FROM detalle_factura WHERE idFactura = @idFactura)
    WHERE idFactura = @idFactura;
END;
GO
