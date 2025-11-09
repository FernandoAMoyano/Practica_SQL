-- Lista todos los estudiantes que tienen 22 años.

SELECT nombre, apellido, edad, email
FROM estudiantes
WHERE edad = 22;

-- Muestra los cursos que tienen más de 6 créditos.

SELECT nombre, codigo, creditos
FROM cursos
WHERE creditos > 6
ORDER BY creditos DESC;

-- Encuentra todos los estudiantes cuyo nombre comienza con "M".

SELECT nombre, apellido, email
FROM estudiantes
WHERE nombre LIKE 'M%';

-- Lista los cursos de los departamentos "Informática" y "Matemáticas".

SELECT nombre, codigo, departamento, creditos
FROM cursos
WHERE departamento IN ('Informática', 'Matemáticas')
ORDER BY departamento, nombre;

-- Muestra los estudiantes con promedio entre 7.0 y 8.5.

SELECT nombre, apellido, promedio
FROM estudiantes
WHERE promedio BETWEEN 7.0 AND 8.5
ORDER BY promedio DESC;

-- Encuentra las inscripciones que aún no tienen nota asignada.

SELECT id, estudiante_id, curso_id, estado
FROM inscripciones
WHERE nota IS NULL;

-- Lista todos los profesores ordenados por salario de mayor a menor.

SELECT nombre, apellido, especialidad, salario
FROM profesores
ORDER BY salario DESC;

-- Muestra los 5 estudiantes con mejor promedio.

SELECT nombre, apellido, promedio
FROM estudiantes
WHERE activo = TRUE
ORDER BY promedio DESC
LIMIT 5;

-- ¿Cuántos estudiantes activos hay en total?

SELECT COUNT(*) AS total_estudiantes_activos
FROM estudiantes
WHERE activo = TRUE;

-- Calcula el promedio general de todos los estudiantes activos.

SELECT 
    AVG(promedio) AS promedio_general,
    ROUND(AVG(promedio), 2) AS promedio_redondeado
FROM estudiantes
WHERE activo = TRUE;

-- Encuentra el salario mínimo y máximo de los profesores.

SELECT 
    MIN(salario) AS salario_minimo,
    MAX(salario) AS salario_maximo,
    MAX(salario) - MIN(salario) AS diferencia
FROM profesores;

-- Cuenta cuántos estudiantes hay por edad.

SELECT 
    edad,
    COUNT(*) AS cantidad_estudiantes
FROM estudiantes
WHERE activo = TRUE
GROUP BY edad
ORDER BY edad;

-- Muestra por departamento: cantidad de cursos, créditos totales y precio promedio.

SELECT 
    departamento,
    COUNT(*) AS cantidad_cursos,
    SUM(creditos) AS creditos_totales,
    AVG(precio) AS precio_promedio,
    MIN(precio) AS precio_minimo,
    MAX(precio) AS precio_maximo
FROM cursos
GROUP BY departamento
ORDER BY cantidad_cursos DESC;

-- Muestra las edades que tienen más de 2 estudiantes.

SELECT 
    edad,
    COUNT(*) AS cantidad
FROM estudiantes
WHERE activo = TRUE
GROUP BY edad
HAVING COUNT(*) > 2
ORDER BY cantidad DESC;

-- Muestra nombre completo e email de estudiantes en un solo campo.

SELECT 
    CONCAT(nombre, ' ', apellido) AS nombre_completo,
    email,
    CONCAT(nombre, ' (', email, ')') AS info_completa
FROM estudiantes
WHERE activo = TRUE
ORDER BY apellido;

-- Muestra las fechas de ingreso en formato "DD/MM/YYYY".
SELECT 
    nombre,
    apellido,
    fecha_ingreso,
    DATE_FORMAT(fecha_ingreso, '%d/%m/%Y') AS fecha_formateada,
    DATE_FORMAT(fecha_ingreso, '%d de %M de %Y') AS fecha_texto
FROM estudiantes
ORDER BY fecha_ingreso DESC;

-- Calcula cuántos días han pasado desde el ingreso de cada estudiante.
SELECT 
    nombre,
    apellido,
    fecha_ingreso,
    DATEDIFF(CURDATE(), fecha_ingreso) AS dias_desde_ingreso,
    ROUND(DATEDIFF(CURDATE(), fecha_ingreso) / 365, 1) AS años_aproximados
FROM estudiantes
WHERE activo = TRUE
ORDER BY dias_desde_ingreso DESC;

-- Clasifica a los estudiantes según su promedio: Excelente (≥9), Bueno (7-8.9), Regular (6-6.9), Bajo (<6).
SELECT 
    nombre,
    apellido,
    promedio,
    CASE 
        WHEN promedio >= 9.0 THEN 'Excelente'
        WHEN promedio >= 7.0 THEN 'Bueno'
        WHEN promedio >= 6.0 THEN 'Regular'
        ELSE 'Bajo'
    END AS clasificacion
FROM estudiantes
WHERE activo = TRUE
ORDER BY promedio DESC;