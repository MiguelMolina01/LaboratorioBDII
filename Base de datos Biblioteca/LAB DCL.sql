-- Crear roles en SQL Server
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'SysAdmin')
    CREATE ROLE SysAdmin;
GO

IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'Bibliotecario')
    CREATE ROLE Bibliotecario;
GO

IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'RRHH')
    CREATE ROLE RRHH;
GO

-- Otorgar permisos al rol SysAdmin
GRANT CONTROL ON DATABASE::Biblioteca TO SysAdmin;
GO

-- Otorgar permisos al rol Bibliotecario
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.autoresLibros TO Bibliotecario;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.categoriaLibros TO Bibliotecario;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.condicionLibros TO Bibliotecario;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.historialPrestamos TO Bibliotecario;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.libros TO Bibliotecario;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.prestamos TO Bibliotecario;
GRANT SELECT ON dbo.lectores TO Bibliotecario; -- Solo lectura para ver los lectores
GO

-- Otorgar permisos al rol RRHH
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Empleados TO RRHH;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Direcciones TO RRHH;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Cargos TO RRHH;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Departamentos TO RRHH;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Municipios TO RRHH;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Distritos TO RRHH;
GO

-- Crear usuarios en SQL Server y asignar logins
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'admin_juancarlos')
    CREATE LOGIN admin_juancarlos WITH PASSWORD = '1234';
GO

IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'admin_juancarlos')
    CREATE USER admin_juancarlos FOR LOGIN admin_juancarlos;
GO

IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'Biblio_diegofrancisco')
    CREATE LOGIN Biblio_diegofrancisco WITH PASSWORD = '1234';
GO

IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'Biblio_diegofrancisco')
    CREATE USER Biblio_diegofrancisco FOR LOGIN Biblio_diegofrancisco;
GO

IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'Biblio_marycarmen')
    CREATE LOGIN Biblio_marycarmen WITH PASSWORD = '1234';
GO

IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'Biblio_marycarmen')
    CREATE USER Biblio_marycarmen FOR LOGIN Biblio_marycarmen;
GO

IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'rrhh_rauledgardo')
    CREATE LOGIN rrhh_rauledgardo WITH PASSWORD = '1234';
GO

IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'rrhh_rauledgardo')
    CREATE USER rrhh_rauledgardo FOR LOGIN rrhh_rauledgardo;
GO

-- Asignar roles a los usuarios
ALTER ROLE SysAdmin ADD MEMBER admin_juancarlos;
ALTER ROLE Bibliotecario ADD MEMBER Biblio_diegofrancisco;
ALTER ROLE Bibliotecario ADD MEMBER Biblio_marycarmen;
ALTER ROLE RRHH ADD MEMBER rrhh_rauledgardo;
GO

-- Consultar roles y usuarios en SQL Server
SELECT * FROM sys.database_principals;
GO

-- Consulta para obtener una lista de logins en la instancia de SQL Server
select name from sys.server_principals where type_desc = 'SQL_LOGIN';
go
-- Consulta para obtener una lista de usuarios en la instancia de SQL Server
select name from sys.database_principals where type_desc = 'SQL_USER';
go
-- Consulta para obtener una lista de roles en la instancia de SQL Server
select name from sys.database_principals where type_desc = 'DATABASE_ROLE';
go