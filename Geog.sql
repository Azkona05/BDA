-- DROP DATABASE Geografia;
-- CREATE DATABASE Geografia;
-- USE Geografia;

-- -- Tabla Comunidades
-- CREATE TABLE Comunidades (
--     id_comunidad INT PRIMARY KEY,
--     nombre VARCHAR(100),
--     id_capital INT
-- );

-- -- Tabla Provincias
-- CREATE TABLE Provincias (
--     n_provincia INT PRIMARY KEY,
--     nombre VARCHAR(100),
--     superficie FLOAT,
--     id_capital INT,
--     id_comunidad INT,
--     FOREIGN KEY (id_comunidad) REFERENCES Comunidades(id_comunidad)
-- );

-- -- Tabla Localidades
-- CREATE TABLE Localidades (
--     id_localidad INT PRIMARY KEY,
--     nombre VARCHAR(100),
--     poblacion INT,
--     n_provincia INT,
--     FOREIGN KEY (n_provincia) REFERENCES Provincias(n_provincia)
-- );

-- -- Inserciones en Comunidades
-- INSERT INTO Comunidades (id_comunidad, nombre, id_capital) VALUES 
-- (1, 'Andalucía', 101),
-- (2, 'Cataluña', 201);

-- -- Inserciones en Provincias
-- INSERT INTO Provincias (n_provincia, nombre, superficie, id_capital, id_comunidad) VALUES 
-- (101, 'Sevilla', 14000.50, 1001, 1),
-- (102, 'Málaga', 7308.00, 1002, 1),
-- (201, 'Barcelona', 7700.00, 2001, 2);

-- -- Inserciones en Localidades
-- INSERT INTO Localidades (id_localidad, nombre, poblacion, n_provincia) VALUES 
-- (1001, 'Sevilla', 690000, 101),
-- (1002, 'Málaga', 570000, 102),
-- (2001, 'Barcelona', 1600000, 201);

DELIMITER //
CREATE PROCEDURE MostrarComunidad(nCom varchar (100))
BEGIN
	DECLARE NP INT;
    DECLARE NL INT;
    
    SELECT COUNT(*) INTO NP FROM 

END //