USE biblioteca;
GO

-- Crear o alterar la función para convertir texto a minúsculas
CREATE OR ALTER FUNCTION dbo.textoMinuscula(@Texto NVARCHAR(500))
RETURNS NVARCHAR(500)
AS
BEGIN
    RETURN LOWER(@Texto);
END;
GO


-- Consultar los libros y sus estados en minúsculas
SELECT 
    dbo.textoMinuscula(l.libro) AS titulo_libro_minuscula,
    dbo.textoMinuscula(l.estado) AS estado_minuscula
FROM 
    dbo.libros l;

