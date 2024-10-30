USE Biblioteca;
GO

-- Inserci�n en la tabla departamentos
INSERT INTO departamentos (idDepartamento, departamento, pais) VALUES
	('AH', 'Ahuachap�n', 'El Salvador'),
	('CA', 'Caba�as', 'El Salvador'),
	('CH', 'Chalatenango', 'El Salvador'),
	('CU', 'Cuscatl�n', 'El Salvador'),
	('LL', 'La Libertad', 'El Salvador'),
	('LP', 'La Paz', 'El Salvador'),
	('LU', 'La Uni�n', 'El Salvador'),
	('MO', 'Moraz�n', 'El Salvador'),
	('SA', 'Santa Ana', 'El Salvador'),
	('SM', 'San Miguel', 'El Salvador'),
	('SS', 'San Salvador', 'El Salvador'),
	('SV', 'San Vicente', 'El Salvador'),
	('SO', 'Sonsonate', 'El Salvador'),
	('US', 'Usulut�n', 'El Salvador');
GO

-- Inserci�n en la tabla municipios
INSERT INTO municipios (idMunicipio, municipio, idDepartamento) VALUES
	('AHN', 'Ahuachap�n Norte', 'AH'),
	('AHC', 'Ahuachap�n Centro', 'AH'),
	('AHS', 'Ahuachap�n Sur', 'AH'),
	('CAE', 'Caba�as Este', 'CA'),
	('CAO', 'Caba�as Oeste', 'CA'),
	('CHN', 'Chalatenango Norte', 'CH'),
	('CHC', 'Chalatenango Centro', 'CH'),
	('CHS', 'Chalatenango Sur', 'CH'),
	('CUN', 'Cuscatl�n Norte', 'CU'),
	('CUS', 'Cuscatl�n Sur', 'CU'),
	('LLN', 'La Libertad Norte', 'LL'),
	('LLC', 'La Libertad Centro', 'LL'),
	('LLO', 'La Libertad Oeste', 'LL'),
	('LLE', 'La Libertad Este', 'LL'),
	('LLS', 'La Libertad Sur', 'LL'),
	('LLT', 'La Libertad Costa', 'LL'),
	('LPO', 'La Paz Oeste', 'LP'),
	('LPC', 'La Paz Centro', 'LP'),
	('LPE', 'La Paz Este', 'LP'),
	('LUN', 'La Uni�n Norte', 'LU'),
	('LUS', 'La Uni�n Sur', 'LU'),
	('MON', 'Moraz�n Norte', 'MO'),
	('MOS', 'Moraz�n Sur', 'MO'),
	('SAN', 'Santa Ana Norte', 'SA'),
	('SAC', 'Santa Ana Centro', 'SA'),
	('SAE', 'Santa Ana Este', 'SA'),
	('SAO', 'Santa Ana Oeste', 'SA'),
	('SMN', 'San Miguel Norte', 'SM'),
	('SMC', 'San Miguel Centro', 'SM'),
	('SMO', 'San Miguel Oeste', 'SM'),
	('SSN', 'San Salvador Norte', 'SS'),
	('SSO', 'San Salvador Oeste', 'SS'),
	('SSE', 'San Salvador Este', 'SS'),
	('SSC', 'San Salvador Centro', 'SS'),
	('SSS', 'San Salvador Sur', 'SS'),
	('SVN', 'San Vicente Norte', 'SV'),
	('SVS', 'San Vicente Sur', 'SV'),
	('SON', 'Sonsonate Norte', 'SO'),
	('SOC', 'Sonsonate Centro', 'SO'),
	('SOE', 'Sonsonate Este', 'SO'),
	('SOO', 'Sonsonate Oeste', 'SO'),
	('USN', 'Usulut�n Norte', 'US'),
	('USE', 'Usulut�n Este', 'US'),
	('USO', 'Usulut�n Oeste', 'US');
GO

-- Inserci�n en la tabla distritos
INSERT INTO distritos (idDistrito, distrito, idMunicipio) VALUES
	-- Ahuachapan
	('AHN01', 'Atiquizaya', 'AHN'),
	('AHN02', 'El Refugio', 'AHN'),
	('AHN03', 'San Lorenzo', 'AHN'),
	('AHN04', 'Tur�n', 'AHN'),
	('AHC01', 'Ahuachap�n', 'AHC'),
	('AHC02', 'Apaneca', 'AHC'),
	('AHC03', 'Concepci�n de Ataco', 'AHC'),
	('AHC04', 'Tacuba', 'AHC'),
	('AHS01', 'Guaymango', 'AHS'),
	('AHS02', 'Jujutla', 'AHS'),
	('AHS03', 'San Francisco Men�ndez', 'AHS'),
	('AHS04', 'San Pedro Puxtla', 'AHS'),
-- Caba�as
	('CAE01', 'Sensuntepeque', 'CAE'),
	('CAE02', 'Victoria', 'CAE'),
	('CAE03', 'Dolores', 'CAE'),
	('CAE04', 'Guacotecti', 'CAE'),
	('CAE05', 'San Isidro', 'CAE'),
	('CAO01', 'Ilobasco', 'CAO'),
	('CAO02', 'Tejutepeque', 'CAO'),
	('CAO03', 'Jutiapa', 'CAO'),
	('CAO04', 'Cinquera', 'CAO'),
-- Chalatenango
	('CHN01', 'La Palma', 'CHN'),
	('CHN02', 'Cital�', 'CHN'),
	('CHN03', 'San Ignacio', 'CHN'),
	('CHC01', 'Nueva Concepci�n', 'CHC'),
	('CHC02', 'Tejutla', 'CHC'),
	('CHC03', 'La Reina', 'CHC'),
	('CHC04', 'Agua Caliente', 'CHC'),
	('CHC05', 'Dulce Nombre de Mar�a', 'CHC'),
	('CHC06', 'El Para�so', 'CHC'),
	('CHC07', 'San Fernando', 'CHC'),
	('CHC08', 'San Francisco Moraz�n', 'CHC'),
	('CHC09', 'San Rafael', 'CHC'),
	('CHC10', 'Santa Rita', 'CHC'),
	('CHS01', 'Chalatenango', 'CHS'),
	('CHS02', 'Arcatao', 'CHS'),
	('CHS03', 'Azacualpa', 'CHS'),
	('CHS04', 'Comalapa', 'CHS'),
	('CHS05', 'Concepci�n Quezaltepeque', 'CHS'),
	('CHS06', 'El Carrizal', 'CHS'),
	('CHS07', 'La Laguna', 'CHS'),
	('CHS08', 'Las Vueltas', 'CHS'),
	('CHS09', 'Nombre de Jes�s', 'CHS'),
	('CHS10', 'Nueva Trinidad', 'CHS'),
	('CHS11', 'Ojos de Agua', 'CHS'),
	('CHS12', 'Potonico', 'CHS'),
	('CHS13', 'San Antonio de La Cruz', 'CHS'),
	('CHS14', 'San Antonio Los Ranchos', 'CHS'),
	('CHS15', 'San Francisco Lempa', 'CHS'),
	('CHS16', 'San Isidro Labrador', 'CHS'),
	('CHS17', 'San Jos� Cancasque', 'CHS'),
	('CHS18', 'San Miguel de Mercedes', 'CHS'),
	('CHS19', 'San Jos� Las Flores', 'CHS'),
	('CHS20', 'San Luis del Carmen', 'CHS'),
-- Cuscatl�n
	('CUN01', 'Suchitoto', 'CUN'),
	('CUN02', 'San Jos� Guayabal', 'CUN'),
	('CUN03', 'Oratorio de Concepci�n', 'CUN'),
	('CUN04', 'San Bartolom� Perulap�a', 'CUN'),
	('CUN05', 'San Pedro Perulap�n', 'CUN'),
	('CUS01', 'Cojutepeque', 'CUS'),
	('CUS02', 'San Rafael Cedros', 'CUS'),
	('CUS03', 'Candelaria', 'CUS'),
	('CUS04', 'Monte San Juan', 'CUS'),
	('CUS05', 'El Carmen', 'CUS'),
	('CUS06', 'San Cristobal', 'CUS'),
	('CUS07', 'Santa Cruz Michapa', 'CUS'),
	('CUS08', 'San Ram�n', 'CUS'),
	('CUS09', 'El Rosario', 'CUS'),
	('CUS10', 'Santa Cruz Analquito', 'CUS'),
	('CUS11', 'Tenancingo', 'CUS'),
-- La Libertad
	('LLN01', 'Quezaltepeque', 'LLN'),
	('LLN02', 'San Mat�as', 'LLN'),
	('LLN03', 'San Pablo Tacachico', 'LLN'),
	('LLC01', 'San Juan Opico', 'LLC'),
	('LLC02', 'Ciudad Arce', 'LLC'),
	('LLO01', 'Col�n', 'LLO'),
	('LLO02', 'Jayaque', 'LLO'),
	('LLO03', 'Sacacoyo', 'LLO'),
	('LLO04', 'Tepecoyo', 'LLO'),
	('LLO05', 'Talnique', 'LLO'),
	('LLE01', 'Antiguo Cuscatl�n', 'LLE'),
	('LLE02', 'Huiz�car', 'LLE'),
	('LLE03', 'Nuevo Cuscatl�n', 'LLE'),
	('LLE04', 'San Jos� Villanueva', 'LLE'),
	('LLE05', 'Zaragoza', 'LLE'),
	('LLS01', 'Comasagua', 'LLS'),
	('LLS02', 'Santa Tecla', 'LLS'),
	('LLT01', 'Chiltiup�n', 'LLT'),
	('LLT02', 'Jicalapa', 'LLT'),
	('LLT03', 'La Libertad', 'LLT'),
	('LLT04', 'Tamanique', 'LLT'),
	('LLT05', 'Teotepeque', 'LLT'),
-- La Paz
	('LPO01', 'Cuyultitan', 'LPO'),
	('LPO02', 'Olocuilta', 'LPO'),
	('LPO03', 'San Juan Talpa', 'LPO'),
	('LPO04', 'San Luis Talpa', 'LPO'),
	('LPO05', 'San Pedro Masahuat', 'LPO'),
	('LPO06', 'Tapalhuaca', 'LPO'),
	('LPO07', 'San Francisco Chinameca', 'LPO'),
	('LPC01', 'El Rosario', 'LPC'),
	('LPC02', 'Jerusal�n', 'LPC'),
	('LPC03', 'Mercedes La Ceiba', 'LPC'),
	('LPC04', 'Para�so de Osorio', 'LPC'),
	('LPC05', 'San Antonio Masahuat', 'LPC'),
	('LPC06', 'San Emigdio', 'LPC'),
	('LPC07', 'San Juan Tepezontes', 'LPC'),
	('LPC08', 'San Lu�s La Herradura', 'LPC'),
	('LPC09', 'San Miguel Tepezontes', 'LPC'),
	('LPC10', 'San Pedro Nonualco', 'LPC'),
	('LPC11', 'Santa Mar�a Ostuma', 'LPC'),
	('LPC12', 'Santiago Nonualco', 'LPC'),
	('LPE01', 'San Juan Nonualco', 'LPE'),
	('LPE02', 'San Rafael Obrajuelo', 'LPE'),
	('LPE03', 'Zacatecoluca', 'LPE'),
-- La Uni�n
	('LUN01', 'Anamor�s', 'LUN'),
	('LUN02', 'Bolivar', 'LUN'),
	('LUN03', 'Concepci�n de Oriente', 'LUN'),
	('LUN04', 'El Sauce', 'LUN'),
	('LUN05', 'Lislique', 'LUN'),
	('LUN06', 'Nueva Esparta', 'LUN'),
	('LUN07', 'Pasaquina', 'LUN'),
	('LUN08', 'Polor�s', 'LUN'),
	('LUN09', 'San Jos� La Fuente', 'LUN'),
	('LUN10', 'Santa Rosa de Lima', 'LUN'),
	('LUS01', 'Conchagua', 'LUS'),
	('LUS02', 'El Carmen', 'LUS'),
	('LUS03', 'Intipuc�', 'LUS'),
	('LUS04', 'La Uni�n', 'LUS'),
	('LUS05', 'Meanguera del Golfo', 'LUS'),
	('LUS06', 'San Alejo', 'LUS'),
	('LUS07', 'Yayantique', 'LUS'),
	('LUS08', 'Yucuaiqu�n', 'LUS'),
-- Moraz�n
	('MON01', 'Arambala', 'MON'),
	('MON02', 'Cacaopera', 'MON'),
	('MON03', 'Corinto', 'MON'),
	('MON04', 'El Rosario', 'MON'),
	('MON05', 'Joateca', 'MON'),
	('MON06', 'Jocoaitique', 'MON'),
	('MON07', 'Meanguera', 'MON'),
	('MON08', 'Perqu�n', 'MON'),
	('MON09', 'San Fernando', 'MON'),
	('MON10', 'San Isidro', 'MON'),
	('MON11', 'Torola', 'MON'),
	('MOS01', 'Chilanga', 'MOS'),
	('MOS02', 'Delicias de Concepci�n', 'MOS'),
	('MOS03', 'El Divisadero', 'MOS'),
	('MOS04', 'Gualococti', 'MOS'),
	('MOS05', 'Guatajiagua', 'MOS'),
	('MOS06', 'Jocoro', 'MOS'),
	('MOS07', 'Lolotiquillo', 'MOS'),
	('MOS08', 'Osicala', 'MOS'),
	('MOS09', 'San Carlos', 'MOS'),
	('MOS10', 'San Francisco Gotera', 'MOS'),
	('MOS11', 'San Sim�n', 'MOS'),
	('MOS12', 'Sensembra', 'MOS'),
	('MOS13', 'Sociedad', 'MOS'),
	('MOS14', 'Yamabal', 'MOS'),
	('MOS15', 'Yoloaiqu�n', 'MOS'),
-- Santa Ana
	('SAN01', 'Masahuat', 'SAN'),
	('SAN02', 'Metap�n', 'SAN'),
	('SAN03', 'Santa Rosa Guachipil�n', 'SAN'),
	('SAN04', 'Texistepeque', 'SAN'),
	('SAC01', 'Santa Ana', 'SAC'),
	('SAE01', 'Coatepeque', 'SAE'),
	('SAE02', 'El Congo', 'SAE'),
	('SAO01', 'Candelaria de la Frontera', 'SAO'),
	('SAO02', 'Chalchuapa', 'SAO'),
	('SAO03', 'El Porvenir', 'SAO'),
	('SAO04', 'San Antonio Pajonal', 'SAO'),
	('SAO05', 'San Sebasti�n Salitrillo', 'SAO'),
	('SAO06', 'Santiago de La Frontera', 'SAO'),
-- San Miguel
	('SMN01', 'Ciudad Barrios', 'SMN'),
	('SMN02', 'Sesori', 'SMN'),
	('SMN03', 'Nuevo Ed�n de San Juan', 'SMN'),
	('SMN04', 'San Gerardo', 'SMN'),
	('SMN05', 'San Luis de La Reina', 'SMN'),
	('SMN06', 'Carolina', 'SMN'),
	('SMN07', 'San Antonio del Mosco', 'SMN'),
	('SMN08', 'Chapeltique', 'SMN'),
	('SMC01', 'San Miguel', 'SMC'),
	('SMC02', 'Comacar�n', 'SMC'),
	('SMC03', 'Uluazapa', 'SMC'),
	('SMC04', 'Moncagua', 'SMC'),
	('SMC05', 'Quelepa', 'SMC'),
	('SMC06', 'Chirilagua', 'SMC'),
	('SMO01', 'Chinameca', 'SMO'),
	('SMO02', 'Nueva Guadalupe', 'SMO'),
	('SMO03', 'Lolotique', 'SMO'),
	('SMO04', 'San Jorge', 'SMO'),
	('SMO05', 'San Rafael Oriente', 'SMO'),
	('SMO06', 'El Tr�nsito', 'SMO'),
-- San Salvador
	('SSN01', 'Aguilares', 'SSN'),
	('SSN02', 'El Paisnal', 'SSN'),
	('SSN03', 'Guazapa', 'SSN'),
	('SSO01', 'Apopa', 'SSO'),
	('SSO02', 'Nejapa', 'SSO'),
	('SSE01', 'Ilopango', 'SSE'),
	('SSE02', 'San Mart�n', 'SSE'),
	('SSE03', 'Soyapango', 'SSE'),
	('SSE04', 'Tonacatepeque', 'SSE'),
	('SSC01', 'Ayutuxtepeque', 'SSC'),
	('SSC02', 'Mejicanos', 'SSC'),
	('SSC03', 'San Salvador', 'SSC'),
	('SSC04', 'Cuscatancingo', 'SSC'),
	('SSC05', 'Ciudad Delgado', 'SSC'),
	('SSS01', 'Panchimalco', 'SSS'),
	('SSS02', 'Rosario de Mora', 'SSS'),
	('SSS03', 'San Marcos', 'SSS'),
	('SSS04', 'Santo Tom�s', 'SSS'),
	('SSS05', 'Santiago Texacuangos', 'SSS'),
-- San Vicente
	('SVN01', 'Apastepeque', 'SVN'),
	('SVN02', 'Santa Clara', 'SVN'),
	('SVN03', 'San Ildefonso', 'SVN'),
	('SVN04', 'San Esteban Catarina', 'SVN'),
	('SVN05', 'San Sebasti�n', 'SVN'),
	('SVN06', 'San Lorenzo', 'SVN'),
	('SVN07', 'Santo Domingo', 'SVN'),
	('SVS01', 'San Vicente', 'SVS'),
	('SVS02', 'Guadalupe', 'SVS'),
	('SVS03', 'Verapaz', 'SVS'),
	('SVS04', 'Tepetit�n', 'SVS'),
	('SVS05', 'Tecoluca', 'SVS'),
	('SVS06', 'San Cayetano Istepeque', 'SVS'),
-- Sonsonate
	('SON01', 'Juay�a', 'SON'),
	('SON02', 'Nahuizalco', 'SON'),
	('SON03', 'Salcoatit�n', 'SON'),
	('SON04', 'Santa Catarina Masahuat', 'SON'),
	('SOC01', 'Sonsonate', 'SOC'),
	('SOC02', 'Sonzacate', 'SOC'),
	('SOC03', 'Nahulingo', 'SOC'),
	('SOC04', 'San Antonio del Monte', 'SOC'),
	('SOC05', 'Santo Domingo de Guzm�n', 'SOC'),
	('SOE01', 'Izalco', 'SOE'),
	('SOE02', 'Armenia', 'SOE'),
	('SOE03', 'Caluco', 'SOE'),
	('SOE04', 'San Juli�n', 'SOE'),
	('SOE05', 'Cuisnahuat', 'SOE'),
	('SOE06', 'Santa Isabel Ishuat�n', 'SOE'),
	('SOO01', 'Acajutla', 'SOO'),
-- Usulut�n
	('USN01', 'Santiago de Mar�a', 'USN'),
	('USN02', 'Alegr�a', 'USN'),
	('USN03', 'Berl�n', 'USN'),
	('USN04', 'Mercedes Uma�a', 'USN'),
	('USN05', 'Jucuapa', 'USN'),
	('USN06', 'El triunfo', 'USN'),
	('USN07', 'Estanzuelas', 'USN'),
	('USN08', 'San Buenaventura', 'USN'),
	('USN09', 'Nueva Granada', 'USN'),
	('USE01', 'Usulut�n', 'USE'),
	('USE02', 'Jucuar�n', 'USE'),
	('USE03', 'San Dionisio', 'USE'),
	('USE04', 'Concepci�n Batres', 'USE'),
	('USE05', 'Santa Mar�a', 'USE'),
	('USE06', 'Ozatl�n', 'USE'),
	('USE07', 'Tecap�n', 'USE'),
	('USE08', 'Santa Elena', 'USE'),
	('USE09', 'California', 'USE'),
	('USE10', 'Ereguayqu�n', 'USE'),
	('USO01', 'Jiquilisco', 'USO'),
	('USO02', 'Puerto El Triunfo', 'USO'),
	('USO03', 'San Agust�n', 'USO'),
	('USO04', 'San Francisco Javier', 'USO');
go

-- Inserci�n en la tabla direcciones
INSERT INTO direcciones (linea1, linea2, idDistrito, codigoPostal) VALUES
	('Col Madera, Calle 1, #1N', 'Frente al parque', 'SON02', '02311'),  -- 1					
	('Barrio El Caldero, Av 2, #2I', 'Frente al amate', 'SOE01', '02306'), -- 2
	('Res El Cangrejo, Av 3, #3A', 'Frente a la playa', 'SOO01', '02302'), -- 3
	('Barrio El Centro, Av 4, #4S', 'Frente a catedral', 'SOC01', '02301'), -- 4
	('Col La Frontera, Calle 5, #5G', 'Km 10', 'AHS03', '02113'), -- 5
	('Res Buenavista, Calle 6, #6A', 'Contiguo a Alcaldia', 'SAC01', '02201'), -- 6
	('Res Altavista, Av 7, #7S', 'Contiguo al ISSS', 'SSC03', '01101'), -- 7
	('Col Las Margaritas, Pje 20, #2-4', 'Junto a ANDA', 'AHS01', '02114'),-- 8
	('Urb Las Magnolias, Pol 21, #2-6', 'Casa de esquina', 'LLO01', '01115'),-- 9
	('Caserio Florencia, 3era Calle, #5', 'Casa rosada', 'SON01', '02305');-- 10
GO


-- Inserci�n en la tabla cargos
INSERT INTO cargos (idCargo, cargo) VALUES
	(1, 'SysAdmin'),
	(2, 'Bibliotecario'),
	(3, 'RRHH'),
	(4, 'Ordenanza');
GO


-- Inserci�n en la tabla empleados
INSERT INTO empleados (idEmpleado, nombresEmpleados, apellidoEmpleados, duiEmpleado, isssEmpleado, fechanacEmpleado, telefonoEmpleado, correoEmpleado, idCargo, idDireccion) VALUES
	(1, 'Juan Carlos', 'Rodas Gonzalez', '04523695-5', '906325698', '1995-01-01', '6532-4526', 'juan@hotmail.com', 1, 6),
	(2, 'Diego Franciso', 'Sanchez Castro', '04321098-7', '963852741', '1990-02-02', '7895-5698', 'diego@gmail.com', 2, 2),
	(3, 'Raul Edgardo', 'Del Valle Garcia', '03210987-4', '321654987', '1980-03-03', '6598-2548', 'raul@outlook.com', 3, 3),
	(4, 'Mary Carmen', 'Perez de Hernandez', '06789012-1', '951753258', '1985-04-04', '7965-2526', 'may@yahoo.com', 2, 4),
	(5, 'Kevin Angel', 'Luke de Quevedo', '06776012-5', '871563254', '1986-03-07', '7645-2526', 'kaq@yahoo.com', 4, 5);
GO


-- Inserci�n en la tabla lectores
INSERT INTO lectores (idLector, nombreLector, apellidoLector, duiLector, telefonoLector, idDireccion) VALUES
	(1, 'Diego Alejandro', 'Herrera Moreno', '04529395-6', '7632-4526', 7),
	(2, 'Laura Camila', 'Castro Escobar', '04529895-2', '6872-4526', 8),
	(3, 'Jose Maria', 'Ram�rez Tovar', '07823695-7', '5532-8926', 9),
	(4, 'Gabriel Antonio', 'Garc�a Beltr�n', '04783695-1', '7532-6526', 10),
	(5, 'Garc�a Beltr�n', 'Romero Jim�nez', '06523695-5', '7532-9826', 6);
GO


-- Inserci�n en la tabla historialPrestamos
INSERT INTO historialPrestamos (idHistorial, fechaEntregado, fechaRecibido) VALUES
	(1, '2024-01-12', '2024-02-12'),
	(2, '2024-01-23', '2024-02-10'),
	(3, '2024-02-04', '2024-02-20'),
	(4, '2024-03-10', '2024-03-21'),
	(5, '2024-03-15', '2024-04-01');
GO


-- Inserci�n en la tabla prestamos
INSERT INTO prestamos (idPrestamo, fechaPrestamo, fechaDevolucion, idHistorial, idEmpleado, idLector) VALUES
	(1, '2024-01-12', '2024-02-14', 1, 2, 1),
	(2, '2024-01-23', '2024-02-10', 2, 4, 2),
	(3, '2024-02-04', '2024-02-25', 3, 2, 3),
	(4, '2024-03-10', '2024-03-25', 4, 2, 4),
	(5, '2024-03-15', '2024-04-01', 5, 4, 5);
GO


-- Inserci�n en la tabla moras
INSERT INTO moras (idMora, cantidadDias, moraDia, cantidadMora, idPrestamo) VALUES
	(1, 2, 1.00, 2.00, 1),
	(2, 0, 1.00, 0.00, 2),
	(3, 5, 1.00, 5.00, 3),
	(4, 3, 1.00, 3.00, 4),
	(5, 0, 1.00, 0.00, 5);
GO


-- Inserci�n en la tabla autores
INSERT INTO autores (idAutor, nombreAutor, apellidoAutor) VALUES
	(1, 'Gabriel', 'Garc�a M�rquez'),
	(2, 'Antoine', 'de Saint-Exup�ry'),
	(3, 'Yuval Noah', 'Harari'),
	(4, 'Isabel', 'Allende'), 
	(5, 'Mario', 'Vargas Llosa');
GO


-- Inserci�n en la tabla categoriaLibros
INSERT INTO categoriaLibros (idCategoria, categoria1, categoria2) VALUES
	(1, 'Literatura', 'Novela'),
	(2, 'Infantil', 'Cl�sicos'),
	(3, 'Realismo', 'M�gico'),
	(4, 'Historia', 'Sociedad'),
	(5, 'Ciencia', 'Ficci�n');
GO


-- Inserci�n en la tabla editoriales
INSERT INTO editoriales (idEditorial, editorial) VALUES
	(1, 'Alfaguara'),
	(2, 'Salamandra'),
	(3, 'Penguin Random House'),
	(4, 'Debate'),
	(5, 'Debolsillo');
GO


-- Inserci�n en la tabla condicionLibros
INSERT INTO condicionLibros (idCondicionLibro, condicion) VALUES
	(1, 'Nuevo'),
	(2, 'Excelente'),
	(3, 'Bueno'),
	(4, 'Aceptable'),
	(5, 'Deteriorado');
GO


-- Inserci�n en la tabla libros
INSERT INTO libros (ISBN, libro, estado, fechaPublicacion, idEditorial, idCategoria, idCondicionLibro) VALUES
	('9788439732471', 'Cien a�os de soledad', 'Disponible', '2017-04-06', 3, 3, 1),
	('9780156013925', 'El Principito', 'Disponible', '2001-09-04', 3, 2, 2),
	('9788499926223', 'Sapiens: A Brief History of Humankind', 'Disponible', '2016-09-27', 4, 4, 2),
	('9788499926711', 'Homo Deus: A Brief History of Tomorrow', 'Disponible', '2017-01-31', 4, 4, 3),
	('9781644732717', '21 lecciones para el siglo XXI', 'Disponible', '2020-07-21', 5, 4, 4);
GO


-- Inserci�n en la tabla prestamoLibro
INSERT INTO prestamoLibro (idPrestamoLibro, ISBN, idPrestamo) VALUES
	(1, '9788439732471', 1),
	(2, '9780156013925', 2),
	(3, '9788499926223', 3),
	(4, '9788499926711', 4),
	(5, '9781644732717', 5);
GO


-- Inserci�n en la tabla autoresLibros
INSERT INTO autoresLibros (idAutoresLibro, idAutor, ISBN) VALUES
	(1, 1, '9788439732471'),
	(2, 2, '9780156013925'),
	(3, 3, '9788499926223'),
	(4, 3, '9788499926711'),
	(5, 3, '9781644732717');
GO


-- Inserci�n en la tabla roles
INSERT INTO roles (rol) VALUES
	('SysAdmin'),
	('Bibliotecario'),
	('RRHH');
GO


-- Inserci�n en la tabla usuarios
INSERT INTO usuarios (usuario, contrasenia, idRol, idEmpleado) VALUES
	('admin_juancarlos', 'root', 1, 1),
	('Biblio_diegofrancisco', 'diego1234', 2, 2),
	('Biblio_marycarmen', 'mary1234', 2, 4),
	('rrhh_rauledgardo', 'raul1234', 3, 3);
GO


-- Inserci�n en la tabla opciones
INSERT INTO opciones (opcion) VALUES
	('Gestionar cuentas'), -- 1
	('Gestionar departamentos'),  -- 2
	('Gestionar municipios'), -- 3
	('Gestionar distritos'), -- 4
	('Gestionar direcciones'), -- 5
	('Gestionar cargos'),-- 6
	('Gestionar empleados'), -- 7
	('Gestionar lectores'), -- 8
	('Gestionar historialPrestamo'), -- 9
	('Gestionar prestamos'), -- 10
	('Gestionar moras'), -- 11
	('Gestionar autores'), -- 12
	('Gestionar categoriaLibros'), -- 13
	('Gestionar editoriales'), -- 14
	('Gestionar condicionLibro'), -- 15
	('Gestionar libros'), -- 16
	('Gestionar prestamoLibros'), -- 17
	('Gestionar autoresLibros'), -- 18
	('Gestionar roles'), -- 19
	('Gestionar opciones'), -- 20
	('Gestionar asignacionRolesOpciones'), -- 21
	('Gestionar usuarios'); -- 22
GO


-- Inserci�n en la tabla asignacionRolesOpciones
INSERT INTO asignacionRolesOpciones (idRol, idOpcion) VALUES
	-- SysAdmin
	(1, 1), (1, 2), (1, 3), (1, 4), 
	(1, 5), (1, 6), (1, 7), (1, 8),
	(1, 9), (1, 10), (1, 11), (1, 12),
	(1, 13), (1, 14), (1, 15), (1, 16),
	(1, 17), (1, 18), (1, 19), (1, 20),
	(1, 21), (1, 22),
    
    -- Bibliotecario
	(2, 5), (2, 8), (2, 10), (2, 9), 
	(2, 11), (2, 16), (2, 12), (2, 13), 
	(2, 15), (2, 2), (2, 3), (2, 4), 
	(2, 17), (2, 18),

    -- RRHH
	(3, 7), (3, 5), (3, 6), 
	(3, 2), (3, 3), (3, 4);
GO


-- Consultas de verificaci�n
SELECT * FROM municipios;
SELECT * FROM departamentos;
SELECT * FROM distritos;
SELECT * FROM direcciones;
SELECT * FROM cargos;
SELECT * FROM empleados;
SELECT * FROM lectores;
SELECT * FROM historialPrestamos;
SELECT * FROM prestamos;
SELECT * FROM moras;
SELECT * FROM autores;
SELECT * FROM categoriaLibros;
SELECT * FROM editoriales;
SELECT * FROM condicionLibros;
SELECT * FROM libros;
SELECT * FROM prestamoLibro;
SELECT * FROM autoresLibros;
SELECT * FROM roles;
SELECT * FROM usuarios;
SELECT * FROM opciones;
SELECT * FROM asignacionRolesOpciones;
GO
