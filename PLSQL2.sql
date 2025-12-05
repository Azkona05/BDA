-- DROP DATABASE EMPRESA;

-- CREATE DATABASE EMPRESA;
USE EMPRESA;

-- CREATE TABLE DEPART (
-- DEPT_NO INT PRIMARY KEY,
-- DEPT_NOM VARCHAR (20),
-- LOC VARCHAR (20));

-- CREATE TABLE EMPLE (
-- EMP_NUM INT PRIMARY KEY,
-- APELLIDO VARCHAR (20),
-- OFICIO VARCHAR (20),
-- DIR INT,
-- FECHA_ALTA DATE,
-- COMISION FLOAT,
-- DEPT_NO INT,
-- FOREIGN KEY (DEPT_NO) REFERENCES DEPART (DEPT_NO),
-- FOREIGN KEY (DIR) REFERENCES EMPLE (EMP_NUM));


/*1)	Escriba una función llamada NumSubordinados que reciba el número de un empleado de la tabla Emple y que devuelva el número de 
		subordinados que tiene ese empleado, o lo que es lo mismo, el número de empleados de los cuales es director o jefe directo. 
        Recuerde que el atributo dir de la tabla Emple indica el número del empleado director o jefe directo. Escriba un ejemplo de 
        llamada a la función. */
		-- DELIMITER //
-- 			CREATE FUNCTION NumSub(num INT) RETURNS INT
-- 				READS SQL DATA
-- 					BEGIN
-- 						DECLARE numS INT;
-- 						SELECT COUNT(*) INTO numS FROM Emple WHERE dir = num;
-- 						RETURN num_sub;
-- 					END ;
-- SELECT NumSub(1);
-- SELECT *FROM DEPART;
-- SELECT *FROM EMPLE;

/*2)	Cree una función llamada SalarioJefe que reciba el apellido de un empleado y que devuelva un número real que tome el valor del 
		salario del empleado dividido entre el número de empleados subordinados que tenga. En caso de que el empleado no tenga 
        subordinados, la función deberá devolver el valor -1.*/
-- DELIMITER //
-- CREATE FUNCTION SalarioJefe(emp_apellido VARCHAR(50)) RETURNS FLOAT
-- READS SQL DATA
-- BEGIN
--     DECLARE salario FLOAT;
--     DECLARE num INT;
--     DECLARE Nsub INT;
--     DECLARE RESUL FLOAT;
--     
--     SELECT emp_no, salario INTO num, salario FROM Emple WHERE apellido = emp_apellido;
--     select count(*) into Nsub from emple where dir=num;
--     
--     IF num = 0 THEN
--         RETURN -1;
--     ELSE
--         RETURN RESUL = salario / Nsub;
--     END IF;
-- END //
-- DELIMITER ;
-- /*3)	Cree un procedimiento llamado AñadirDepar que reciba el nombre de un departamento y su localidad. Se debe insertar ese 
-- 		departamento en la tabla Depart asignándole como número el que resulte de sumar 10 al número más alto de los departamentos 
--         de la empresa. Al final muestre un mensaje con el texto: “Se ha creado un nuevo departamento con el nº xxx”.*/
-- DELIMITER //
-- CREATE PROCEDURE AñadirDepar(IN nombre VARCHAR(50), IN localidad VARCHAR(50))
-- BEGIN
--     DECLARE num INT;
--     SELECT MAX(dept_no) + 10 INTO num FROM Depart;
--     INSERT INTO Depart (dept_no, dept_nom, loc) VALUES (num, nombre, localidad);
--     SELECT CONCAT('Se ha creado un nuevo departamento con el nº ', num);
-- END //
-- DELIMITER ;
/*4)	Cree un procedimiento llamado ModificarSalario que reciba el número de un empleado y un número entero. El procedimiento debe 
		modificar el salario del empleado con el nº recibido como primer parámetro según el porcentaje pasado como segundo parámetro 
        y mostrar el salario del empleado antes y después de la modificación.*/
-- DELIMITER //
-- CREATE PROCEDURE ModificarSalario(IN emp_num INT, IN porcentaje INT)
-- BEGIN
--     DECLARE sal1 FLOAT;
--     SELECT salario INTO sal1 FROM Emple WHERE emp_no = emp_num;
--     UPDATE Emple SET salario = salario * (1 + porcentaje / 100) WHERE emp_no = emp_num;
--     SELECT sal1 AS 'Salario Anterior', salario AS 'Salario Nuevo' FROM Emple WHERE emp_no = emp_num;
-- END //
-- DELIMITER ;
/*5)	Cree un procedimiento llamado AsignarComision que reciba un número de empleado y compruebe su salario en la tabla Emple de la 
		base de datos Empresa. Si el salario del empleado es menor que 1000 €, se le debe asignar una comisión que será el 5% del 
        salario; en caso de que su salario sea superior o igual a 1000 €, pero inferior a 2000 €, se le deberá asignar una comisión 
        igual al 2,5% del salario; en caso de que cobre 2000 € o más, se le pondrá a 0 € la comisión. Muestre un mensaje  como el 
        siguiente: “Al empleado nº XXXX se le ha asignado una comisión de YY.YY €”. */
-- DELIMITER //
-- CREATE PROCEDURE AsignarComision(IN emp_no INT)
-- BEGIN
--     DECLARE emp_salario FLOAT;
--     DECLARE nueva_comision FLOAT;
--     
--     SELECT salario INTO emp_salario FROM Emple WHERE emp_num = emp_no;
--     
--     IF emp_salario < 1000 THEN
--         SET nueva_comision = emp_salario * 0.05;
--     ELSEIF emp_salario < 2000 THEN
--         SET nueva_comision = emp_salario * 0.025;
--     ELSE
--         SET nueva_comision = 0;
--     END IF;
--     
--     UPDATE Emple SET comision = nueva_comision WHERE emp_num = emp_no;
--     SELECT CONCAT('Al empleado nº ', emp_num, ' se le ha asignado una comisión de ', nueva_comision, ' €');
-- END //
-- DELIMITER ;

/*6)	Cree una función llamada PorcenSalarial que reciba el número de un empleado y nos devuelva un número real que indique el 
		porcentaje que supone el salario del empleado en relación con la suma salarial de todos los empleados de su departamento.*/
-- DELIMITER //
-- CREATE FUNCTION PorcenSalarial(emp_num INT) RETURNS FLOAT
-- DETERMINISTIC
-- BEGIN
--     DECLARE emp_salario FLOAT;
--     DECLARE total_salario FLOAT;
--     DECLARE emp_depart INT;
--     
--     SELECT salario, dept_no INTO emp_salario, emp_depart FROM Emple WHERE emp_no = emp_num;
--     SELECT SUM(salario) INTO total_salario FROM Emple WHERE dept_no = emp_depart;
--     
--     RETURN (emp_salario / total_salario) * 100;
-- END //
-- DELIMITER ;
/*7)	Cree un procedimiento llamado ModificarSalariosDepar que reciba el número de un departamento y un número real. El procedimiento, 
		en primer lugar, obtendrá el número de empleados que trabajan en el departamento cuyo número se ha recibido como primer 
        parámetro. En caso de que no trabaje ningún empleado en dicho departamento, se mostrará el mensaje “En el dpto. nº xxx no 
        trabaja ningún empleado”. En caso contrario, se deberá modificar el salario de los empleados del departamento cuyo número 
        se ha pasado como primer parámetro en base al porcentaje recibido como segundo parámetro, después de lo cual se mostrará el 
        mensaje “Se ha modificado el salario de todos los empleados del dpto. nº xx en un yyy,yy%”.*/
-- DELIMITER //
-- CREATE PROCEDURE ModificarSalariosDepar(IN dept_num INT, IN porcentaje FLOAT)
-- BEGIN
--     DECLARE num_empleados INT;
--     
--     SELECT COUNT(*) INTO num_empleados FROM Emple WHERE dept_no = dept_num;
--     
--     IF num_empleados = 0 THEN
--         SELECT CONCAT('En el dpto. nº ', dept_num, ' no trabaja ningún empleado');
--     ELSE
--         UPDATE Emple SET salario = salario * (1 + porcentaje / 100) WHERE dept_no = dept_num;
--         SELECT CONCAT('Se ha modificado el salario de todos los empleados del dpto. nº ', dept_num, ' en un ', porcentaje, '%');
--     END IF;
-- END //
-- DELIMITER ;