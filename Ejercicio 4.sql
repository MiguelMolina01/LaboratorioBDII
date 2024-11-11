CREATE VIEW vista_empleados_cargos_especificos AS
SELECT e.idEmpleado, e.nombresEmpleados, c.cargo, dep.pais
FROM empleados e
INNER JOIN cargos c ON e.idCargo = c.idCargo
INNER JOIN direcciones d ON e.idDireccion = d.idDireccion
INNER JOIN distritos dt ON d.idDistrito = dt.idDistrito
INNER JOIN municipios m ON dt.idMunicipio = m.idMunicipio
INNER JOIN departamentos dep ON m.idDepartamento = dep.idDepartamento
WHERE c.cargo IN ('Gerente', 'Supervisor');

SELECT * FROM vista_empleados_cargos_especificos;

CREATE VIEW vista_cantidad_empleados_por_cargo AS
SELECT c.cargo, COUNT(e.idEmpleado) AS cantidad_empleados
FROM cargos c
LEFT JOIN empleados e ON c.idCargo = e.idCargo
GROUP BY c.cargo;

SELECT * FROM vista_cantidad_empleados_por_cargo;

CREATE VIEW vista_cargos_empleados AS
SELECT c.idCargo, c.cargo, e.nombresEmpleados
FROM cargos c
LEFT JOIN empleados e ON c.idCargo = e.idCargo;

SELECT * FROM vista_cargos_empleados;

CREATE VIEW vista_empleados_municipios_especificos AS
SELECT e.idEmpleado, e.nombresEmpleados, m.municipio
FROM empleados e
LEFT JOIN direcciones d ON e.idDireccion = d.idDireccion
LEFT JOIN distritos dt ON d.idDistrito = dt.idDistrito
LEFT JOIN municipios m ON dt.idMunicipio = m.idMunicipio
WHERE m.municipio IN ('San Salvador', 'Santa Ana');

SELECT * FROM vista_empleados_municipios_especificos;
