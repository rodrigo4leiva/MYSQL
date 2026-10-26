-- ESTE ES UN COMENTARIO

-- 1. Crear una base de datos
-- SQL Server: SCHEMA -> DATABASE
CREATE SCHEMA prueba;

-- 2. Indicar a SQL la base de datos que vamos a usar

USE prueba;

-- 3. Crear una tabla en la base de datos
CREATE TABLE empleados (
	id_empleado TINYINT PRIMARY KEY,
    nombre VARCHAR(10) NOT NULL,
    puesto VARCHAR(50) NOT NULL,
    salario DECIMAL(7,2) NOT NULL,
    sexo CHAR (1) NOT NULL
);

-- 3. Eliminar tabla

DROP TABLE empleados;

-- 4. Agregar columna

ALTER TABLE empleados
ADD COLUMN edad INT;

-- 5. Eliminar columna

ALTER TABLE empleados
DROP COLUMN puesto;

-- 6. Modificar columna

ALTER TABLE empleados
MODIFY COLUMN salario DECIMAL(6,2);

-- 7. Renombrar columna

ALTER TABLE empleados
RENAME COLUMN salario TO sueldo;


-- 8. Declaración de variables en MySQL DECLARE solo se usa dentro de un Stored Procedure

SET @salario_base = 1000.00;
 
-- 9. Seleccionar salario base

SELECT @salario_base;

-- 10. Inserción de datos

ALTER TABLE empleados
ADD COLUMN puesto VARCHAR(50);


INSERT INTO empleados(id_empleado, nombre, sueldo, sexo, edad,puesto)
VALUES 
(1, 'Betty', 4500.00, 'F', 33, 'Coordinadora de Logística'),
(2, 'Michelle', 4200.00, 'F', 40, 'Coordinadora de Soporte'),
(3, 'Melissa', 3000.00, 'F', 28, 'Analista de Soporte'),
(4, 'Sheyla', 7000.00, 'F', 40, 'Jefe de Operaciones'),
(5, 'Jeniffer', 5000.00, 'F', 50, 'Coordinadora de Logística')

-- 2. Seleccionar datos

SELECT * FROM empleados;

-- 3. Eliminación de datos

DELETE FROM empleados
WHERE id_empleado=5;

-- 4. Seleccionar datos

SELECT * FROM empleados;

-- 5. Seleccionar datos

SELECT * FROM empleados
WHERE id_empleado IN (3,4);

-- 6. Actualizar datos

UPDATE empleados
SET puesto = 'Analista', sueldo = 3500
WHERE id_empleado = 2;

-- 7. Seleccionar datos

SELECT * FROM empleados;

-- 8. nomenclatura

SELECT nombre, edad FROM empleados;

SELECT 
	edad,
    id_empleado,
    sexo
FROM empleados;

-- SELECT * EXCEPT(puesto) FROM empleados;  ---> BigQuery / Redshift
-- 8. Uso de alias (renombrar columnas en consultas)

SELECT
	*, id_empleado AS id
FROM empleados;

-- otra forma

SELECT
	id_empleado AS id,
    empleados.*
FROM empleados;

SELECT
	id_empleado AS id,
    nombre AS name,
    sueldo AS payment,
    sexo AS gender,
    edad AS age,
    puesto AS position
FROM empleados;

-- otra forma

SELECT prueba.empleados.nombre FROM prueba.empleados;
-- otra forma

SELECT
	e.id_empleado AS id,
    e.*
FROM empleados AS e;

-- Filtrar datos

SELECT * FROM empleados
WHERE edad > 32;

SELECT * FROM empleados
WHERE id_empleado IS NOT NULL;

SELECT * FROM empleados
WHERE edad > 32 AND sueldo < 4000;

SELECT * FROM empleados
WHERE edad BETWEEN 32 AND 35;

SELECT * FROM empleados
WHERE puesto != 'Analista';

-- % wildcard, indica la posición del texto a buscar
SELECT * FROM empleados
WHERE nombre LIKE '%a';

SELECT * FROM empleados
WHERE nombre LIKE '%s%';

SELECT * FROM empleados
WHERE nombre IN ('Betty', 'Sheyla');

SELECT * FROM empleados
WHERE nombre NOT IN ('Betty', 'Sheyla');



-- 10. Ordenar datos de manera ascendente o descendente

SELECT * FROM empleados
ORDER BY sueldo DESC;

SELECT * FROM empleados
ORDER BY edad ASC;

SELECT * FROM empleados
ORDER BY sexo, edad DESC;

-- 11. Límite de registros / límite de consultas

SELECT * FROM empleados
LIMIT 2;
