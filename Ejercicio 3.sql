--Función con Valores de Tabla para Listar los Productos por Categoría
CREATE FUNCTION ListarProductosPorCategoria(@idCategoria INT)
RETURNS TABLE
AS
RETURN
(
    SELECT l.libro AS NombreProducto, l.estado AS Descripcion
    FROM libros l
    INNER JOIN categoriaLibros c ON l.idCategoria = c.idCategoria
    WHERE l.idCategoria = @idCategoria
);

SELECT * FROM ListarProductosPorCategoria(4);