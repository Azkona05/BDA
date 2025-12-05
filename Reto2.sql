/*DROP DATABASE RETO2;*/
/*CREATE DATABASE RETO2;*/
USE RETO2;

/*CREACION DE TABLAS*/

/*CREATE TABLE EMPLEADO(
COD_E INT PRIMARY KEY,
TIPO VARCHAR(20),
NOMBRE VARCHAR(20));

CREATE TABLE ACTIVIDAD(
COD_A INT PRIMARY KEY,
TIPO VARCHAR(20),
NOMBRE VARCHAR(20));

CREATE TABLE PARTICIPANTE(
DNI CHAR(9) PRIMARY KEY,
NOMBRE VARCHAR(20),
APELLIDO VARCHAR(20),
EMAIL VARCHAR(20));

CREATE TABLE PARTICIPA(
DNI CHAR(9),
COD_A INT,
FECHA DATE,
PRIMARY KEY(DNI, COD_A),
FOREIGN KEY (COD_A) REFERENCES ACTIVIDAD(COD_A),
FOREIGN KEY (DNI) REFERENCES PARTICIPANTE(DNI));

CREATE TABLE TRABAJA(
COD_E INT,
COD_A INT,
FECHA DATE,
SUELDO FLOAT,
FOREIGN KEY (COD_E) REFERENCES EMPLEADO(COD_E),
FOREIGN KEY (COD_A) REFERENCES ACTIVIDAD(COD_A));*/

/*INSERCION DE DATOS*/

/*INSERT INTO EMPLEADO VALUES
(111, 'SEGURIDAD', 'JUAN'),
(222, 'LIMPIEZA', 'FRANCISCO'),
(333, 'TECNICO', 'RAUL'),
(444, 'EXPERTO', 'FEDERICA'),
(555, 'JUEZ', 'MARIA MAGDALENA');

INSERT INTO ACTIVIDAD VALUES 
(123, 'TALLER', 'DISEÑA UNA BD'),
(124, 'CONFERENCIA', 'IA HOY EN DIA'),
(125, 'COMPETICION', 'VALORANT'),
(126, 'TALLER', 'MONTA UN ORDENADOR'),
(127, 'COMPETICION', 'LEAGUE OF LEGENDS');

ALTER TABLE PARTICIPANTE MODIFY EMAIL VARCHAR(50);

INSERT INTO PARTICIPANTE VALUES
('11111111A', 'JAIME', 'JIMENEZ', 'JAIMEJIMENEZ@GMAIL.COM'),
('22222222B', 'GONZALO', 'GONZALEZ', 'GONZALOGONZALEZ@GMAIL.COM'),
('33333333C', 'RODRIGO', 'RODRIGUEZ', 'RODRIGORODRIGUEZ@GMAIL.COM'),
('44444444D', 'MARIA', 'LOPEZ', 'MARIALOPEZ@GMAIL.COM'),
('55555555F', 'FERNANDO', 'FERNANDEZ', 'FERNANDOFERNANDEZ@GMAIL.COM');

INSERT INTO PARTICIPA VALUES
('33333333C', 124, "2003-06-29"),
('22222222B', 125, "2005-06-30"),
('44444444D', 123, "2001-06-28"),
('55555555F', 126, "2004-06-30"),
('11111111A', 127, "2002-06-29");

INSERT INTO TRABAJA VALUES
(111, 125, "2003-06-29", 1599.99),
(444, 124, "2005-06-30", 1200.01),
(555, 126, "2001-06-28", 2000.10),
(222, 123, "2004-06-30", 2500.60),
(333, 127, "2002-06-29", 2450.04);*/

/*CONSULTAS*

/*AN*/
/*El nombre del empleado que ha trabajado en la actividad 125*/
/*SELECT E.NOMBRE FROM EMPLEADO E, TRABAJA T, ACTIVIDAD A WHERE E.COD_E = T.COD_E AND T.COD_A = A.COD_A AND A.COD_A = 125;*/
/*SELECT E.NOMBRE FROM EMPLEADO E JOIN TRABAJA T ON E.COD_E = T.COD_E JOIN ACTIVIDAD A ON T.COD_A = A.COD_A WHERE A.COD_A = 125;*/
/*SELECT NOMBRE FROM EMPLEADO WHERE COD_E =(SELECT COD_E FROM TRABAJA WHERE COD_A = (SELECT COD_A FROM ACTIVIDAD WHERE COD_A = 125));*/
/*Promedio del salario de la actividad 123*/
/*SELECT AVG(SUELDO) FROM TRABAJA WHERE COD_A=123;*/
/*El apellido del participante que participó en la actividad el día 30/06/2003*/
/*SELECT P.APELLIDO FROM PARTICIPANTE P, PARTICIPA PAR WHERE P.DNI = PAR.DNI AND PAR.FECHA = "2003-06-29";*/
/*SELECT APELLIDO FROM PARTICIPANTE WHERE DNI = (SELECT DNI FROM PARTICIPA WHERE FECHA = "2003-06-29");*/
/*SELECT P.APELLIDO FROM PARTICIPANTE P JOIN PARTICIPA PAR ON P.DNI = PAR.DNI WHERE PAR.FECHA = "2003-06-29";*/
/*El nombre de los empleados de seguridad que hayan trabajado en la actividad 122.*/
/*SELECT E.NOMBRE FROM EMPLEADO E, TRABAJA T, ACTIVIDAD A WHERE E.COD_E = T.COD_E AND T.COD_A = A.COD_A AND A.COD_A = 125 AND E.TIPO ="SEGURIDAD";*/
/*El nombre del empleado que trabajó en la misma actividad que participó el participante con el apellido Lopez.*/
/*SELECT E.NOMBRE FROM EMPLEADO E JOIN TRABAJA T ON E.COD_E = T.COD_E 
								JOIN ACTIVIDAD A ON A.COD_A = T.COD_A
                                JOIN PARTICIPA P ON A.COD_A = P.COD_A
                                JOIN PARTICIPANTE PAR ON P.DNI = PAR.DNI WHERE PAR.APELLIDO = "LOPEZ";*/
/*Obten el nombre del empleado con codigo 555.*/
/*SELECT NOMBRE FROM EMPLEADO WHERE COD_E = 555;*/
/*Obtén por nombre el sueldo total que ha obtenido cada empleado.*/
/*SELECT NOMBRE FROM EMPLEADO E WHERE COD_E IN (SELECT COD_E, SUM(SUELDO) FROM TRABAJA  GROUP BY COD_E);*/
/*Obtén los datos del empleado con salario más alto.*/
/*SELECT * FROM EMPLEADO WHERE COD_E = (SELECT COD_E FROM TRABAJA WHERE SUELDO = (SELECT MAX(SUELDO) FROM TRABAJA));*/
/*Selecciona los nombres de los empleados de Valorant o League of legends.*/
/*SELECT E.NOMBRE FROM EMPLEADO E, ACTIVIDAD A, TRABAJA T WHERE E.COD_E = T.COD_E AND A.COD_A = T.COD_A AND A.NOMBRE = "VALORANT" OR A.NOMBRE = "LEAGUE OF LEGENDS";*/
/*Obtén los nombres y el tipo de todos los empleados.*/ 
/*SELECT NOMBRE, TIPO FROM EMPLEADO;*/
/*ANDER*/

/*Obtén los nombres de las actividades que tengan en su nombre una B.*/
/*Obtén cuantas actividades hay en la base de datos.*/
/*Obtén el código de los empleados que tienen un salario entre 1450 y 2250 euros.*/
/*Obtén el código del empleado cuyo salario total haya sido mayor que 2000.*/
/*Obtén el dni de los participantes que participen en la competición con nombre League of legends.*/
/*Obtén el nombre de los empleados ordenados por salario.*/
/*Obtén la media de salarios de los empleados.*/
/*Obtén el número total de actividades.*/
/*Obtén el email y el código de la empleada cuyo nombre es Maria Magdalena.*/
/*Obten el codigo del empleado que vaya a hacer una conferencia en la que participe Rodrigo.*/

/*MIKEL*/

/*Obtén cuál es el salario máximo y el salario mínimo.*/
/*Obtén el tipo de empleado agrupado por salario en orden descendente.*/
/*Obtén el número total de participantes de todas las actividades.*/
/*Obtén el salario medio de los empleados de seguridad.*/
/*Obtén el dni de un participante que participe en la actividad monta un ordenador.*/

/*EKAIN*/

/*Obtén el nombre de los empleados agrupados por tipo.*/
/*Obtén la cantidad de empleados que tiene cada tipo.*/
/*Selecciona el tipo de empleado que trabaja en la actividad tipo taller.*/
/*Selecciona todos los datos de los empleados.*/
/*Selecciona todos los datos de todos los participantes.*/

