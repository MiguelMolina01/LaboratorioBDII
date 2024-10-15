--GUIA 1
--Ejercicio 1: Función Escalar para Calcular la Edad de un Empleado

create function fn_CalcularEdad (@fechaNacimiento DATE)
returns INT
as
begin
    return DATEDIFF(YEAR, @fechaNacimiento, GETDATE()) - 
           case 
               when MONTH(@fechaNacimiento) > MONTH(GETDATE()) OR 
                    (MONTH(@fechaNacimiento) = MONTH(GETDATE()) AND DAY(@fechaNacimiento) > DAY(GETDATE())) 
               then 1 
               else 0 
           end;
end;
go

-- Ejemplo de uso:
SELECT dbo.fn_CalcularEdad('1990-02-02') AS Edad;