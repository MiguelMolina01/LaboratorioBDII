CREATE OR ALTER VIEW dbo.LibrosPorCategoria AS
SELECT 
	   l.ISBN,
	   l.libro,
	   c.categoria1 AS Categoria,
	   cl.condicion AS Condicion

FROM libros l
INNER JOIN categoriaLibros c ON l.idCategoria = c.idCategoria
LEFT JOIN condicionLibros cl ON l.idCondicionLibro = cl.idCondicionLibro;
GO
SELECT * FROM LibrosPorCategoria;
GO

--***********************************************************************
CREATE OR ALTER VIEW dbo.LectoresConDireccion AS
SELECT 
    l.idLector,
    l.nombreLector AS Nombre,
    l.apellidoLector AS Apellido,
    l.duiLector AS DUI,
    l.telefonoLector AS Telefono,
    d.linea1 AS Direccion,
    d.codigoPostal AS CodigoPostal

FROM lectores l
LEFT JOIN direcciones d ON l.idDireccion = d.idDireccion;
GO
SELECT * FROM LectoresConDireccion;
GO

--***********************************************************************
CREATE OR ALTER VIEW dbo.PrestamosConEmpleadoYLector AS
SELECT 
    p.idPrestamo,
    p.fechaPrestamo AS FechaPrestamo,
    p.fechaDevolucion AS FechaDevolucion,
    e.nombresEmpleados AS EmpleadoNombre,
    e.apellidoEmpleados AS EmpleadoApellido,
    l.nombreLector AS LectorNombre,
    l.apellidoLector AS LectorApellido

FROM prestamos p
INNER JOIN empleados e ON p.idEmpleado = e.idEmpleado
INNER JOIN lectores l ON p.idLector = l.idLector;
GO
SELECT * FROM PrestamosConEmpleadoYLector;
GO

--***********************************************************************
CREATE OR ALTER VIEW dbo.DireccionesConMunicipiosYDepartamentos AS
SELECT 
    d.idDireccion,
    d.linea1 AS Direccion,
    m.municipio AS Municipio,
    dep.departamento AS Departamento,
	d.codigoPostal AS CodigoPostal

FROM direcciones d
LEFT JOIN distritos dis ON d.idDistrito = dis.idDistrito
LEFT JOIN municipios m ON dis.idMunicipio = m.idMunicipio
LEFT JOIN departamentos dep ON m.idDepartamento = dep.idDepartamento;
GO
SELECT * FROM DireccionesConMunicipiosYDepartamentos;
GO

--***********************************************************************
CREATE OR ALTER VIEW dbo.EmpleadosConRolesYUsuarios AS
SELECT 
    e.idEmpleado,
    e.nombresEmpleados AS Nombres,
    e.apellidoEmpleados AS Apellidos,
    u.usuario AS Usuario,
    r.rol AS Rol
FROM empleados e
INNER JOIN usuarios u ON e.idEmpleado = u.idEmpleado
INNER JOIN roles r ON u.idRol = r.idRol;
GO
SELECT * FROM EmpleadosConRolesYUsuarios;
