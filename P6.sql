/*CREATE DATABASE ESTUDIO_ARQUITECTURA;*/
USE ESTUDIO_ARQUITECTURA;

/*CREATE TABLE ARQUITECTO(
DNI INT PRIMARY KEY,
NOMBRE VARCHAR (20),
DIR VARCHAR (10),
CIUDAD VARCHAR (20),
TELEFONO INT);

CREATE TABLE EDIFICIO(
COD_E INT PRIMARY KEY,
NOM_E VARCHAR(20),
DIR_E VARCHAR (10),
NUM_P INT DEFAULT (1),
FECHA_C DATE);

CREATE TABLE DISEÑA(
DNI INT,
COD_E INT,
TIEMPO INT,
SALARIO INT CHECK (SALARIO > 9000),
PRIMARY KEY (DNI, COD_E),
FOREIGN KEY (DNI) REFERENCES ARQUITECTO (DNI),
FOREIGN KEY (COD_E) REFERENCES EDIFICIO (COD_E));

CREATE TABLE UNIVERSIDAD(
COD_U INT PRIMARY KEY,
NOM_U VARCHAR (20));

CREATE TABLE ASIGNATURA(
COD_A INT PRIMARY KEY,
NOM_A VARCHAR (20),
SEMESTRE INT DEFAULT 1,
CREDITOS INT DEFAULT 6);

DROP TABLE ESTUDIA;
CREATE TABLE ESTUDIA(
COD_U INT,
COD_A INT,
DNI INT,
NOTA INT DEFAULT 0,
FECHA DATE,
PRIMARY KEY (COD_A, DNI, COD_U),
FOREIGN KEY (COD_A) REFERENCES ASIGNATURA (COD_A),
FOREIGN KEY (DNI) REFERENCES ARQUITECTO (DNI),
FOREIGN KEY (COD_U) REFERENCES UNIVERSIDAD (COD_U));*/

/*ALTER TABLE ARQUITECTO MODIFY DIR VARCHAR(100);*/
/*ALTER TABLE EDIFICIO MODIFY DIR_E VARCHAR(100);

/*INSERT INTO ARQUITECTO VALUES (12345678, "MIKEL", "C/AVE DEL PARAISO 5", "MADRID", 944444444), 
							  (87654321, "NAIARA", "C/LA BONDAD 6 ", "BARAKALDO", 945555555),
                              (13572468, "MARTA", "C/LA MERCED 26 ", "BILBAO", 946666666),
                              (12312312, "NAIARA", "C/GRAN VIA 30 ", "BILBAO", 947777777);
INSERT INTO EDIFICIO VALUES (1111, "IBERDROLA", "C/SARRIKOBASO 46", 56, "2010-04-10"),
							(2222, "BBVA", "C/GRAN VIA 1", 30, "1987-02-04"),
                            (3333, "ALHONDIGA", "C/IPARAGUIRRE 30", 7, "2009-01-03"),
                            (4444, "LABORAL", "C/TELLETXE 30", 7, "1999-07-09");
INSERT INTO DISEÑA VALUES (12345678, 1111, 2, 20000), 
						  (12345678, 2222, 4, 10000), 
                          (13572468, 3333, 10, 17000), 
                          (87654321, 4444, 3, 30000),
                          (12312312, 3333, 1, 15000);
INSERT INTO UNIVERSIDAD VALUES (01, "DEUSTO"),
							   (02, "UPV"),
                               (03, "COMPUTENSE");
ALTER TABLE ASIGNATURA MODIFY CREDITOS FLOAT;
INSERT INTO ASIGNATURA VALUES (111, "DIBUJO TECNICO", 1, 6), 
							  (112, "ALGEBRA", 1, 4.5), 
                              (113, "LOGICA", 1, 9);
INSERT INTO ESTUDIA VALUES (01, 111, 12345678, 5, "2000-01-12"), 
						   (01, 112, 12345678, 7, "2000-01-12"), 
                           (02, 111, 87654321, 6, "2001-01-12"), 
                           (02, 112, 87654321, 3, "2001-01-12"), 
                           (03, 112, 87654321, 6, "2002-01-12"), 
                           (03, 111, 12312312, 8, "2001-01-12"), 
                           (03, 112, 12312312, 9, "2001-01-12"), 
                           (03, 113, 12312312, 8, "2001-01-12"), 
                           (03, 111, 13572468, 5, "2001-01-12");*/
                           
/*a)	Obtén los nombres de todos los arquitectos que suspendieron alguna asignatura.*/
SELECT A.NOM_A FROM ARQUITECTO A, ESTUDIA E WHERE A.DNI=E.DNI AND E.NOTA>5;
/*b)	Obtén la media de las notas de cada arquitecto.*/
SELECT AVG(NOTAS) FROM ESTUDIA E, ARQUITECTO A WHERE A.DNI = E.DNI;
/*c)	Crea la vista V4 con los campos nombre de la asignatura, dni del estudiante, la nota y la fecha.*/
CREATE VIEW V4 AS SELECT NOM_A, DNI, NOTA, FECHA FROM ESTUDIA;
/*d)	Obtén la raíz cuadrada de la nota del arquitecto 12345678 en la asignatura álgebra.*/
SELECT SQRT(E.NOTA) FROM ESTUDIA E, ARQUITECTO A, ASIGNATURA ASIG WHERE ASIG.COD_A = E.COD_A AND A.DNI = E.DNI AND A.DNI = 12345678 AND NOM_A = "ALGEBRA";
/*e)	Modifica el semestre de la asignatura dibujo técnico a 2.*/
UPDATE ASIGNATURA SET  SEMESTRE = 2 WHERE NOM_A = "DIBUJO TECNICO";
/*f)	Suprimir la fila con los siguientes datos: cod_u 03, cod_a 111 y dni 13572468.*/
DELETE FROM ESTUDIA WHERE COD_U = 03 AND COD_A = 111 AND DNI = 13572468;
/*g)	Modifica el campo nombre del estudiante a alfanumérico 40.*/
ALTER TABLE ARQUITECTO MODIFY NOMBRE VARCHAR(20);
/*h)	Crea un índice I4 sobre el campo nom_a de la tabla asignaturas.*/
CREATE INDEX I4 ON ASIGNATURA (NOM_A);
/*i)	Obtén los datos de la asignatura con más créditos.*/
SELECT *FROM ASIGNATURA WHERE CREDITOS = (SELECT MAX(CREDITOS) FROM ASIGNATURA);
/*j)	Obtén los dni de los arquitectos de Deusto o UPV.*/
SELECT A.DNI FROM ARQUITECTO A, UNIVERSIDAD U, ESTUDIA E WHERE U.NOM_U = ("DEUSTO","UPV");
/*k)	Crea un índice I5 sobre el campo nom_u de la tabla universidad.*/
CREATE INDEX I5 ON UNIVERSIDAD (NOM_U);
/*l)	Obtén los nombres de las asignturas que tengan alguna A.*/
SELECT NOM_A FROM ASIGNATURA WHERE NOM_A LIKE "%A%";
/*m)	Borra el índice I4.*/
DROP INDEX I4 ON ASIGNATURA;
/*n)	Obtén la media de las notas de cada asignatura.*/
SELECT AVG(NOTAS) FROM ESTUDIA;
/*o)	Crea una sentencia con group by.*/
SELECT COD_A FROM ESTUDIA GROUP BY DNI;
