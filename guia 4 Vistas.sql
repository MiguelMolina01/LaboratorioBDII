--Vista que muestra la información de los empleados y sus cargos
CREATE OR ALTER VIEW dbo.EmpleadosConCargos AS
SELECT 
    e.idEmpleado,
    e.nombresEmpleados AS NombreEmpleado,
    e.apellidoEmpleados AS ApellidoEmpleado,
    c.cargo AS Cargo
FROM 
    empleados e
INNER JOIN 
    cargos c ON e.idCargo = c.idCargo;
GO

SELECT * FROM EmpleadosConCargos;
GO

--Vista que muestra los libros junto con sus categorías y condiciones
CREATE OR ALTER VIEW dbo.LibrosConCategoriaYCondicion AS
SELECT 
    l.ISBN,
    l.libro AS TituloLibro,
    cl.categoria1 AS Categoria,
    co.condicion AS CondicionLibro
FROM 
    libros l
INNER JOIN 
    categoriaLibros cl ON l.idCategoria = cl.idCategoria
LEFT JOIN 
    condicionLibros co ON l.idCondicionLibro = co.idCondicionLibro;
GO

SELECT * FROM LibrosConCategoriaYCondicion;
GO

-- Vista que muestra el historial de préstamos junto con el lector y las fechas de entrega y recepción
CREATE OR ALTER VIEW dbo.HistorialPrestamosLectores AS
SELECT 
    p.idPrestamo,
    p.fechaPrestamo,
    p.fechaDevolucion,
    le.nombreLector AS NombreLector,
    le.apellidoLector AS ApellidoLector,
    hp.fechaEntregado AS FechaEntregado,
    hp.fechaRecibido AS FechaRecibido
FROM 
    prestamos p
INNER JOIN 
    lectores le ON p.idLector = le.idLector
LEFT JOIN 
    historialPrestamos hp ON p.idHistorial = hp.idHistorial;
GO

SELECT * FROM HistorialPrestamosLectores;
GO

--Vista que muestra el monto de mora por cada préstamo
CREATE OR ALTER VIEW dbo.MorasPorPrestamo AS
SELECT 
    m.idMora,
    p.idPrestamo,
    p.fechaPrestamo,
    m.cantidadDias AS DiasDeRetraso,
    m.moraDia AS MontoPorDia,
    m.cantidadMora AS MontoTotalMora
FROM 
    moras m
INNER JOIN 
    prestamos p ON m.idPrestamo = p.idPrestamo;
GO

SELECT * FROM MorasPorPrestamo;
GO
