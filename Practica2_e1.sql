/*USE HOSPITALCRUCES;*/
/*1. Obtener el número total de especialidades.*/
/*SELECT COUNT(*)FROM ESPECIALIDAD; */
/*2. Obtener el número total de médicos.*/
/*SELECT COUNT(*)FROM MEDICO;*/
/*3. Obtener la media de edad de los médicos.*/
/*SELECT AVG(EDAD) FROM MEDICO;*/
/*4. Obtener la suma de las edades de los médicos.*/
/*SELECT SUM(EDAD) FROM MEDICO;*/
/*5. Obtener la edad del médico menor de todos.*/
/*SELECT MIN(EDAD) FROM MEDICO;*/
/*6. Obtener el número total de ciudades.*/
/*SELECT COUNT(*) FROM CIUDAD;*/
/*7. Obtener la raíz cuadrada del salario del médico con dni 222*/
/*SELECT SQRT(SALARIO) FROM MEDICO WHERE DNI_M = 222;*/
/*8. Obtener el salario más alto de los médicos.*/
/*SELECT MAX(SALARIO) FROM MEDICO;*/
/*9. Obtener el dni y el nombre de los médicos con salario mayor a 3000 en orden
descendente de edad.*/
/*SELECT (DNI_M, NOM_M) FROM MEDICO WHERE (SALARIO>3000) ORDER BY EDAD DESC;*/
/*10. Obtener el número total de hospitales.*/
/*SELECT COUNT(*) FROM HOSPITAL;*/
/*11. Obtener la edad del médico mayor de todos.*/
/*SELECT MAX(EDAD) FROM MEDICO;*/
/*12. Obtener el dni y el nombre de los médicos mayores de 30 años ordenados por salario*/
/*SELECT (DNI_M, NOM_M) FROM MEDICO WHERE EDAD>30 ORDER BY SALARIO;*/
/*16. Borra todas las tablas.*/ 
/*DROP TABLE MEDICO, HOSPITAL, ESPECIALIDAD, CIUDAD;*/
