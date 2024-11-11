-- Lucio L. Landero

-- vista que muestra detalles de un prestamo de un libro.
CREATE OR ALTER VIEW dbo.DetallePrestamos AS
SELECT p.idPrestamo, p.fechaPrestamo, p.fechaDevolucion, l.libro AS TituloLibro, le.nombreLector AS NombreLector
FROM prestamos p
INNER JOIN prestamoLibro pl ON p.idPrestamo = pl.idPrestamo
INNER JOIN libros l ON pl.ISBN = l.ISBN
INNER JOIN lectores le ON p.idLector = le.idLector;
go
SELECT * FROM DetallePrestamos;
go

-- vista que muestra libros por categoria
CREATE OR ALTER VIEW dbo.LibrosPorCategoria AS
SELECT l.ISBN, l.libro, c.categoria1 AS Categoria, e.editorial AS Editorial, cl.condicion AS Condicion
FROM libros l
INNER JOIN categoriaLibros c ON l.idCategoria = c.idCategoria
LEFT JOIN editoriales e ON l.idEditorial = e.idEditorial
LEFT JOIN condicionLibros cl ON l.idCondicionLibro = cl.idCondicionLibro;
GO
SELECT * FROM LibrosPorCategoria;
GO

-- vista que muestra el historial de los prestamos hecho por un empleado a un lector
CREATE OR ALTER VIEW dbo.HistorialPrestamosEmpleadosLectores AS
SELECT 
    p.idPrestamo,
    p.fechaPrestamo,
    p.fechaDevolucion,
    e.nombresEmpleados AS NombreEmpleado,
    e.apellidoEmpleados AS ApellidoEmpleado,
    le.nombreLector AS NombreLector,
    le.apellidoLector AS ApellidoLector,
    l.libro AS TituloLibro,
    l.ISBN,
    l.fechaPublicacion AS FechaPublicacionLibro,
    hp.fechaEntregado AS FechaEntregado,
    hp.fechaRecibido AS FechaRecibido
FROM prestamos p
INNER JOIN empleados e ON p.idEmpleado = e.idEmpleado
INNER JOIN lectores le ON p.idLector = le.idLector
INNER JOIN prestamoLibro pl ON p.idPrestamo = pl.idPrestamo
INNER JOIN libros l ON pl.ISBN = l.ISBN
LEFT JOIN historialPrestamos hp ON p.idHistorial = hp.idHistorial;
GO
SELECT * FROM HistorialPrestamosEmpleadosLectores;
GO

-- vista que muestra el libro fecha de pulicacion del libro editorial y nombres del autor del libro
CREATE OR ALTER VIEW dbo.LibrosAutoresEditoriales AS
SELECT 
    l.ISBN,
    l.libro AS TituloLibro,
    l.fechaPublicacion AS FechaPublicacion,
    l.estado AS EstadoLibro,
    e.editorial AS Editorial,
    a.nombreAutor AS NombreAutor,
    a.apellidoAutor AS ApellidoAutor
FROM libros l
INNER JOIN editoriales e ON l.idEditorial = e.idEditorial
INNER JOIN autoresLibros al ON l.ISBN = al.ISBN
INNER JOIN autores a ON al.idAutor = a.idAutor;
GO

SELECT * FROM LibrosAutoresEditoriales
GO
