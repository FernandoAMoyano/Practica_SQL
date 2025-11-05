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