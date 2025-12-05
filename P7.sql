/*CREATE DATABASE CT;*/
USE CT;
 
/*CREATE TABLE CIUDAD(
COD_CI INT PRIMARY KEY,
NOM_CI VARCHAR(15));

CREATE TABLE PRODUCTORA(
COD_P INT PRIMARY KEY,
NOM_P VARCHAR(20),
COD_CI INT,
FOREIGN KEY (COD_CI) REFERENCES CIUDAD (COD_CI));

CREATE TABLE CONCURSO(
COD_C INT PRIMARY KEY,
NOM_C VARCHAR (20),
COD_P INT,
FOREIGN KEY (COD_P) REFERENCES PRODUCTORA (COD_P));

CREATE TABLE EMISION(
COD_C INT,
FECHA DATE,
SARE INT CHECK(SARE>0),
PRIMARY KEY (COD_C, FECHA));

CREATE TABLE CASTING(
COD_CASTING INT PRIMARY KEY, 
FECHA DATE,
LUGAR VARCHAR (20),
COD_C INT,
FOREIGN KEY (COD_C) REFERENCES CONCURSO(COD_C));

CREATE TABLE CONCURSANTE(
DNI INT PRIMARY KEY, 
NOMBRE VARCHAR(20),
FECHA_NAC DATE);

CREATE TABLE PRESENTAN(
COD_CASTING INT, 
DNI INT, 
PUNTOS INT DEFAULT 0,
PRIMARY KEY (COD_CASTING, DNI),
FOREIGN KEY (COD_CASTING) REFERENCES CASTING(COD_CASTING),
FOREIGN KEY (DNI) REFERENCES CONCURSANTE(DNI));*/

/*ALTER TABLE PRODUCTORA MODIFY NOM_P VARCHAR (50);
ALTER TABLE CASTING MODIFY LUGAR VARCHAR (100);
ALTER TABLE EMISION MODIFY SARE FLOAT;

INSERT INTO CIUDAD VALUES (01, "MADRID"),(02, "BARCELONA");
INSERT INTO PRODUCTORA VALUES (111, "LA FABRICA DE LA TELE", 01), (222, "GLOBOMEDIA", 02);
INSERT INTO CONCURSO VALUES (11, "¿QUE APOSTAMOS?", 111), (22, "AHORA CAIGO", 222);
INSERT INTO EMISION VALUES (11, "2011-11-07", 60), (11, "2011-11-06", 70.5), (22, "2011-11-07", 30), (22, "2011-11-06", 20.6);
INSERT INTO CASTING VALUES (44, "2011-05-01", "PALACIO DE LOS DEPORTES DE MADRID", 11), (55, "2011-05-01", "TEATRO ARRIAGA BILBAO", 22);
INSERT INTO CONCURSANTE VALUES (11111111, "ANA", "1988-06-12"), (22222222, "MARISA", "1988-07-13"), (33333333, "EMILIO", "1988-08-14"), (44444444, "MAURICIO", "1988-09-15");
INSERT INTO PRESENTAN VALUES (44, 11111111, 4), (44, 22222222, 7), (44, 33333333, 9), (44, 44444444, 8), (55, 11111111, -1), (55, 33333333, 3);*/

/*1.	Obtén el nombre de las productoras y los nombres de las ciudades en las que están.*/
SELECT P.NOM_P, C.NOM_CI FROM CIUDAD C, PRODUCTORA P WHERE P.NOM_P = C.COD_CI AND C.COD_CI = 
(SELECT COD_CI FROM CIUDAD WHERE COD_CI = NOM_CI);
/*2.	Obtén los puntos totales que ha obtenido cada concursante en los distintos castings.*/ 
SELECT NOM , SUM(PRESENTAN.PUNTOS)FROM PRESENTAN GROUP BY DNI;
/*3.	Obtén el lugar donde se van a realizar los castings del concurso ¿Qué apostamos?*/
SELECT CASTING.LUGAR FROM CASTING JOIN CONCURSO ON CASTING.COD_C = CONCURSO.COD_C WHERE CONCURSO.NOM_C = '¿Qué apostamos?';
SELECT LUGAR FROM CASTING WHERE COD_C = (SELECT COD_C FROM CONCURSO WHERE NOM_C = '¿Qué apostamos?');
/*4.	Obtén el nombre de los concursantes que tengan una R en su nombre.*/
SELECT NOM FROM CONCURSANTE WHERE NOM LIKE '%R%';
/*5.	Obtén el código ASCII de la primera letra de la productora de Madrid.*/
SELECT ASCII(LEFT(NOM_P, 1)) AS ASCII_RESULTADO FROM PRODUCTORA WHERE COD_CI IN 
(SELECT COD_CI FROM CIUDAD WHERE NOM_CI = "MADRID"); 
/*6.	Obtén el nombre de la productora con código 111 en mayúsculas.*/
SELECT UPPER(NOM_P) FROM PRODUCTORA WHERE COD_P = 111;
/*7.	Crea el índice IPUNTOS sobre el campo puntos de la tabla presentan.*/
CREATE INDEX IPUNTOS ON PRESENTAN (PUNTOS);
/*a.	¿Puede el usuario acceder directamente a este índice?*/
/*No*/
/*b.	¿Cuándo sería conveniente crearlo?*/
/*Cuando se utilice repetidamente.*/
/*8.	Obtén los nombres de los concursantes que han obtenido en algún concurso entre 5 y 8 puntos.*/
SELECT DISTINCT CONCURSANTE.NOMBRE FROM CONCURSANTE 
JOIN PRESENTAN ON CONCURSANTE.DNI = PRESENTAN.DNI WHERE PRESENTAN.PUNTOS BETWEEN 5 AND 8;
/*9.	Actualiza el nombre del concursante con código 33333333 a EMILIO JOSE.*/
UPDATE CONCURSANTE SET NOM = "EMILIO JOSE" WHERE DNI = 33333333;
/*10.	Modifica el campo nombre de ciudad a alfanumérico 40.*/
ALTER TABLE CIUDAD MODIFY NOM_CI VARCHAR (40);
/*11.	Crea la vista V_CASTING en la que se mostrarán la fecha y el lugar del casting.*/
CREATE VIEW V_CASTING AS SELECT FECHA AND LUGAR FROM CASTING;
/*12.	Obtén el signo de los puntos que ha obtenido el concursante con dni 11111111 en el casting del teatro Arriaga.*/
SELECT SIGN(PUNTOS) FROM PRESENTAN JOIN CASTING ON PRESENTAN.COD_CASTING = CASTING.COD_CASTING WHERE PRESENTAN.DNI = 11111111 AND CASTING.LUGAR = 'Teatro Arriaga Bilbao';
/*13.	Obtén la fecha de nacimiento de los concursantes con nombre Marisa o Juan de dos formas diferentes.*/
SELECT FECHA_NAC FROM CONCURSANTE WHERE NOMBRE IN ('MARISA', 'JUAN');
SELECT FECHA_NAC FROM CONCURSANTE WHERE NOMBRE = 'MARISA' OR NOMBRE = 'JUAN';
/*14.	Obtén cuantos concursantes hay en la base de datos.*/
SELECT COUNT(*)FROM CONCURSANTE;
/*15.	Obtén el nombre del concursante con dni 33333333.*/
SELECT NOM FROM CONCURSANTE WHERE DNI = 33333333;
/*16.	Crea la vista V_PRODUCTORA en la que se mostrarán el nombre y la ciudad de la productora.*/
CREATE VIEW V_PRODUCTORA AS SELECT NOM_P AND NOM_C FROM PRODUCTORA, CIUDAD;
/*17.	Obtén cual es el mayor número de puntos que ha obtenido un concursante.*/
SELECT MAX(PUNTOS)FROM PRESENTAN;
/*18.	Crea el índice ILUGAR sobre el campo lugar.*/
CREATE INDEX ILUGAR ON CASTING (LUGAR);
/*19.	Obtén el nombre de los concursos con share entre 30 y 40 de dos formas diferentes.*/
SELECT CONCURSO.NOM_C FROM CONCURSO JOIN EMISION ON CONCURSO.COD_C = EMISION.COD_C WHERE EMISION.SARE BETWEEN 30 AND 40;
/*20.	Obtén la subcadena de caracteres del nombre del concurso 11 desde el 2 carácter. */
SELECT SUBSTRING(NOM_C, 2)FROM CONCURSO WHERE COD_C = 11;
/*21.	Obtén el lugar donde se va a realizar el casting con código 55 en mayúsculas.*/
SELECT UPPER(LUGAR)FROM CASTING WHERE COD_CASTING = 55;
/*22.	Crea la vista V_CONSURSANTE con el nombre del concursante, el código del concurso y los puntos que ha obtenido. Modifica el nombre del campo nombre por nombre_concursante.*/
CREATE VIEW V_CONCURSANTE (NOMBRE_CONCURSANTE, COD_C, PUNTOS) AS SELECT CO.NOM, C.COD_C, P.PUNTOS FROM CONCURSANTE CO JOIN PRESENTAN P ON CO.DNI = P.DNI JOIN CASTING CA ON P.COS_CASTING JOIN CONCURSO C ON CA.COD_C = C.COD_C;
/*23.	Visualiza la fecha de nacimiento de Mauricio y añádele 2 meses.*/
SELECT DATE_ADD(FECHA_NAC, INTERVAL 2 MONTH) FROM CONCURSANTE WHERE NOMBRE = 'MAURICIO';
/*24.	Obtén todos los datos del concursante que ha obtenido menos puntos en un casting.*/
SELECT *FROM CONCURSANTE, PRESENTAN  WHERE CONCURSANTE.DNI = PRESENTAN.DNI AND PRESENTAN.PUNTOS = (SELECT MIN(PUNTOS) FROM PRESENTAN);
/*25.	Obtén el signo de los puntos que ha obtenido el concursante con dni 22222222 en el palacio de los deportes de Madrid.*/
SELECT SIGN(PUNTOS)FROM PRESENTAN JOIN CASTING ON PRESENTAN.COD_CASTING = CASTING.COD_CASTING WHERE PRESENTAN.DNI = 22222222 AND CASTING.LUGAR = 'Palacio de los deportes de Madrid';
/*26.	Borra la vista V_PRODUCTORA.*/
DROP VIEW V_PRODUCTORA;
/*27.	Obtén el código de las productoras que contengan una A en su nombre.*/
SELECT COD_P FROM PRODUCTORA WHERE NOM_P LIKE '%A%';
/*28.	Obtén el valor entero inmediatamente superior o igual al share del concurso ahora caigo del día 06/11/2011*/
SELECT CEIL(SARE)FROM EMISION WHERE COD_C = (SELECT COD_C FROM CONCURSO WHERE NOM_C = 'Ahora caigo')AND FECHA = '2011-11-06';
/*29.	Borra el índice ILUGAR.*/
DROP INDEX ILUGAR ON CASTING;
/*30.	Obtén el nombre de la ciudad de la productora del concurso ‘¿Qué apostamos?*/
SELECT CIUDAD.NOM_Ci FROM CIUDAD JOIN PRODUCTORA ON CIUDAD.COD_Ci = PRODUCTORA.COD_Ci JOIN CONCURSO ON PRODUCTORA.COD_P = CONCURSO.COD_P WHERE CONCURSO.NOM_C = '¿Qué apostamos?';
/*31.	Obtén la longitud del nombre de las productoras de Barcelona.*/
SELECT LENGTH(PRODUCTORA.NOM_P)FROM PRODUCTORA JOIN CIUDAD ON PRODUCTORA.COD_Ci = CIUDAD.COD_Ci WHERE CIUDAD.NOM_Ci = 'BARCELONA';
/*32.	Modifica el nombre del concurso ‘Ahora caigo’  por el de ‘Todos jugamos’.*/
UPDATE CONCURSO SET NOM_C = "TODOS JUGAMOS" WHERE NOM_C = "AHORA CAIGO";
/*33.	Obtén los nombres de las ciudades sin repetición.*/
SELECT DISTINCT NOM_Ci FROM CIUDAD;
/*34.	Obtén los nombres de los concursos que tuvieron más de 30 de share el día 06/11/2011.*/
SELECT CONCURSO.NOM_C FROM CONCURSO JOIN EMISION ON CONCURSO.COD_C = EMISION.COD_C WHERE EMISION.FECHA = '2011-11-06' AND EMISION.SARE > 30;
SELECT NOM_C FROM CONCURSO WHERE COD_C IN (SELECT COD_C FROM EMISION WHERE FECHA = '2011-11-06' AND SARE > 30);
/*35.	Obtén el nombre del concurso que ha obtenido un mayor sare.*/
SELECT CONCURSO.NOM_C FROM CONCURSO JOIN EMISION ON CONCURSO.COD_C = EMISION.COD_C WHERE EMISION.SARE = (SELECT MAX(SARE) FROM EMISION); 
/*36.	Obtén el valor entero inmediatamente inferior o igual al share del concurso ‘Ahora caigo’ el día 06/11/2011.*/
SELECT FLOOR(SARE)FROM EMISION WHERE COD_C = (SELECT COD_C FROM CONCURSO WHERE NOM_C = 'Ahora caigo') AND FECHA = '2011-11-06';
/*37.	Borrar el índice IPUNTOS*/
DROP INDEX IPUNTOS ON PRESENTAN;
/*38.	Modifica los nombres de los concursantes para que queden almacenados en minúsculas.*/
UPDATE CONCURSANTE SET NOM = LOWER(NOM);
/*39.	Borra la vista V_CONSURSANTE.*/
DROP VIEW V_CONCURSANTE;
/*40.	Borra de la tabla participa al concursante con dni 33333333 que participó en el casting del Teatro Arriaga Bilbao.*/
DELETE FROM PRESENTAN WHERE DNI = 33333333 AND COD_CASTING = (SELECT COD_CASTING FROM CASTING WHERE LUGAR = "TEATRO ARRIAGA BILBAO");
/*41.	Obtén la media de todos los puntos que ha obtenido cada concursante.*/
SELECT DNI, AVG(PUNTOS) FROM PRESENTAN GROUP BY DNI;
/*42.	Borra la tabla ciudad.*/
DROP TABLE CIUDAD;
/*43.	Hay un error en los datos de los puntos de los concursantes. Actualiza los puntos del concursante 11111111 en el casting 55, súmale 5 puntos..*/
UPDATE PRESENTAN SET PUNTOS = PUNTOS + 5 WHERE DNI = 11111111 AND COD_CASTING = 55;
/*44.	Borra todas las tablas.*/
DROP TABLE PRESENTAN, CONCURSANTE, CASTING, EMISION, CONCURSO, PRODUCTORA, CIUDAD;
