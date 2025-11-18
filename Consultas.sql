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

---------------------------------------------------------------
-- FUNCIONES Y AGREGACIONES
---------------------------------------------------------------


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


---------------------------------------------------------------
-- JOINS Y SUBCONSULTAS
---------------------------------------------------------------

-- Lista todas las inscripciones mostrando nombre del estudiante y nombre del curso.
SELECT 
    e.nombre AS estudiante,
    e.apellido,
    c.nombre AS curso,
    i.nota,
    i.estado
FROM inscripciones i
INNER JOIN estudiantes e ON i.estudiante_id = e.id
INNER JOIN cursos c ON i.curso_id = c.id
ORDER BY e.apellido, c.nombre;


-- Encuentra estudiantes que NO están inscritos en ningún curso.
SELECT 
    e.id,
    e.nombre,
    e.apellido,
    e.email
FROM estudiantes e
LEFT JOIN inscripciones i ON e.id = i.estudiante_id
WHERE i.id IS NULL AND e.activo = TRUE;


-- Muestra cada estudiante con la cantidad de cursos y su promedio de notas.
SELECT 
    e.nombre,
    e.apellido,
    COUNT(i.id) AS total_cursos,
    COUNT(i.nota) AS cursos_con_nota,
    AVG(i.nota) AS promedio_notas,
    ROUND(AVG(i.nota), 2) AS promedio_redondeado
FROM estudiantes e
LEFT JOIN inscripciones i ON e.id = i.estudiante_id
WHERE e.activo = TRUE
GROUP BY e.id, e.nombre, e.apellido
ORDER BY promedio_notas DESC;


-- Encuentra estudiantes con promedio mayor al promedio general.
SELECT 
    nombre,
    apellido,
    promedio,
    (SELECT AVG(promedio) FROM estudiantes WHERE activo = TRUE) AS promedio_general,
    promedio - (SELECT AVG(promedio) FROM estudiantes WHERE activo = TRUE) AS diferencia
FROM estudiantes
WHERE activo = TRUE
  AND promedio > (SELECT AVG(promedio) FROM estudiantes WHERE activo = TRUE)
ORDER BY promedio DESC;


-- Encuentra estudiantes inscritos en cursos del departamento de Informática.
SELECT DISTINCT
    e.nombre,
    e.apellido,
    e.email
FROM estudiantes e
WHERE e.id IN (
    SELECT i.estudiante_id
    FROM inscripciones i
    INNER JOIN cursos c ON i.curso_id = c.id
    WHERE c.departamento = 'Informática'
)
ORDER BY e.apellido;


-- Lista cursos que tienen al menos una inscripción.
SELECT 
    c.nombre,
    c.codigo,
    c.departamento
FROM cursos c
WHERE EXISTS (
    SELECT 1
    FROM inscripciones i
    WHERE i.curso_id = c.id
)
ORDER BY c.nombre;


-- Encuentra cursos SIN ninguna inscripción.
SELECT 
    c.nombre,
    c.codigo,
    c.departamento,
    c.cupo_maximo
FROM cursos c
WHERE NOT EXISTS (
    SELECT 1
    FROM inscripciones i
    WHERE i.curso_id = c.id
)
ORDER BY c.departamento, c.nombre;


-- Muestra los 3 mejores estudiantes de cada curso (que tenga notas).
SELECT 
    c.nombre AS curso,
    e.nombre AS estudiante,
    e.apellido,
    i.nota
FROM inscripciones i
INNER JOIN estudiantes e ON i.estudiante_id = e.id
INNER JOIN cursos c ON i.curso_id = c.id
WHERE i.nota IS NOT NULL
  AND i.nota >= (
    SELECT MIN(nota)
    FROM (
        SELECT nota
        FROM inscripciones i2
        WHERE i2.curso_id = i.curso_id AND i2.nota IS NOT NULL
        ORDER BY nota DESC
        LIMIT 3
    ) AS top3
  )
ORDER BY c.nombre, i.nota DESC;


-- Alternativa mas simple
SELECT 
    c.nombre AS curso,
    e.nombre AS estudiante,
    i.nota,
    (SELECT COUNT(*) 
     FROM inscripciones i2 
     WHERE i2.curso_id = i.curso_id 
       AND i2.nota > i.nota) + 1 AS ranking
FROM inscripciones i
INNER JOIN estudiantes e ON i.estudiante_id = e.id
INNER JOIN cursos c ON i.curso_id = c.id
WHERE i.nota IS NOT NULL
HAVING ranking <= 3
ORDER BY c.nombre, ranking;


-- Lista profesores con sus cursos y cantidad de estudiantes inscritos.
SELECT 
    p.nombre AS profesor,
    p.apellido,
    p.especialidad,
    c.nombre AS curso,
    cp.anio,
    cp.semestre,
    COUNT(i.id) AS total_inscritos
FROM profesores p
INNER JOIN curso_profesor cp ON p.id = cp.profesor_id
INNER JOIN cursos c ON cp.curso_id = c.id
LEFT JOIN inscripciones i ON c.id = i.curso_id
GROUP BY p.id, p.nombre, p.apellido, p.especialidad, c.nombre, cp.anio, cp.semestre
ORDER BY p.apellido, total_inscritos DESC;


-- Muestra los préstamos con multa y calcula cuántos días de retraso tuvo cada uno.
SELECT 
    e.nombre AS estudiante,
    l.titulo AS libro,
    p.fecha_prestamo,
    p.fecha_devolucion_esperada,
    p.fecha_devolucion_real,
    DATEDIFF(p.fecha_devolucion_real, p.fecha_devolucion_esperada) AS dias_retraso,
    p.multa
FROM prestamos p
INNER JOIN estudiantes e ON p.estudiante_id = e.id
INNER JOIN libros l ON p.libro_id = l.id
WHERE p.multa > 0
ORDER BY p.multa DESC;


-- Lista cursos con su precio y la diferencia respecto al precio promedio
SELECT 
    nombre,
    codigo,
    precio,
    (SELECT AVG(precio) FROM cursos) AS precio_promedio,
    precio - (SELECT AVG(precio) FROM cursos) AS diferencia,
    CASE 
        WHEN precio > (SELECT AVG(precio) FROM cursos) THEN 'Más caro'
        WHEN precio < (SELECT AVG(precio) FROM cursos) THEN 'Más barato'
        ELSE 'Promedio'
    END AS clasificacion
FROM cursos
ORDER BY diferencia DESC;