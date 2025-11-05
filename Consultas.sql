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