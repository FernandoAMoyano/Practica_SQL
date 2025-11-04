-- ============================================
-- 2. INSERCIÓN DE DATOS DE PRUEBA (DML)
-- ============================================

-- Insertar estudiantes
INSERT INTO estudiantes (nombre, apellido, email, edad, promedio, fecha_ingreso, activo) VALUES
('Fernando', 'Moyano', 'fernando.moyano@universidad.edu', 25, 8.50, '2022-03-01', TRUE),
('Ana', 'García', 'ana.garcia@universidad.edu', 22, 9.20, '2023-02-15', TRUE),
('Carlos', 'Pérez', 'carlos.perez@universidad.edu', 24, 7.50, '2022-08-20', TRUE),
('María', 'López', 'maria.lopez@universidad.edu', 23, 8.80, '2022-03-01', TRUE),
('Juan', 'Díaz', 'juan.diaz@universidad.edu', 26, 7.20, '2021-09-10', TRUE),
('Laura', 'Martínez', 'laura.martinez@universidad.edu', 21, 9.50, '2023-08-15', TRUE),
('Pedro', 'Rodríguez', 'pedro.rodriguez@universidad.edu', 27, 6.80, '2021-03-01', FALSE),
('Sofía', 'Fernández', 'sofia.fernandez@universidad.edu', 22, 8.90, '2023-02-15', TRUE),
('Diego', 'González', 'diego.gonzalez@universidad.edu', 25, 7.90, '2022-08-20', TRUE),
('Valentina', 'Sánchez', 'valentina.sanchez@universidad.edu', 20, 9.10, '2024-02-20', TRUE),
('Lucas', 'Romero', 'lucas.romero@universidad.edu', 24, 6.50, '2022-03-01', TRUE),
('Camila', 'Torres', 'camila.torres@universidad.edu', 23, 8.30, '2022-08-20', TRUE),
('Mateo', 'Flores', 'mateo.flores@universidad.edu', 28, 5.80, '2020-09-10', FALSE),
('Isabella', 'Ramírez', 'isabella.ramirez@universidad.edu', 21, 9.70, '2023-08-15', TRUE),
('Sebastián', 'Castro', 'sebastian.castro@universidad.edu', 26, 7.60, '2021-09-10', TRUE);

-- Insertar profesores
INSERT INTO profesores (nombre, apellido, especialidad, email, salario, fecha_contratacion) VALUES
('Roberto', 'García', 'Bases de Datos', 'roberto.garcia@universidad.edu', 4500.00, '2015-03-01'),
('Patricia', 'López', 'Programación', 'patricia.lopez@universidad.edu', 4800.00, '2014-09-01'),
('Miguel', 'Fernández', 'Algoritmos', 'miguel.fernandez@universidad.edu', 5000.00, '2012-02-15'),
('Carmen', 'Martínez', 'Redes', 'carmen.martinez@universidad.edu', 4300.00, '2016-08-20'),
('Jorge', 'Sánchez', 'Inteligencia Artificial', 'jorge.sanchez@universidad.edu', 5500.00, '2013-01-10'),
('Elena', 'Romero', 'Matemáticas', 'elena.romero@universidad.edu', 4200.00, '2017-03-15'),
('Alberto', 'Torres', 'Física', 'alberto.torres@universidad.edu', 4400.00, '2015-09-01'),
('Lucía', 'Flores', 'Sistemas Operativos', 'lucia.flores@universidad.edu', 4700.00, '2014-02-20');

-- Insertar cursos
INSERT INTO cursos (nombre, codigo, creditos, departamento, cupo_maximo, precio) VALUES
('Bases de Datos I', 'BD101', 6, 'Informática', 35, 800.00),
('Programación I', 'PROG101', 8, 'Informática', 40, 850.00),
('Programación II', 'PROG102', 8, 'Informática', 35, 850.00),
('Algoritmos y Estructuras de Datos', 'ALG101', 6, 'Informática', 30, 780.00),
('Redes de Computadoras', 'RED101', 6, 'Informática', 30, 820.00),
('Inteligencia Artificial', 'IA101', 6, 'Informática', 25, 920.00),
('Cálculo I', 'MAT101', 6, 'Matemáticas', 40, 650.00),
('Álgebra Lineal', 'MAT102', 6, 'Matemáticas', 35, 650.00),
('Física I', 'FIS101', 8, 'Física', 30, 700.00),
('Sistemas Operativos', 'SO101', 6, 'Informática', 30, 800.00),
('Arquitectura de Computadoras', 'ARQ101', 6, 'Informática', 25, 780.00),
('Ingeniería de Software', 'IS101', 6, 'Informática', 30, 850.00);

-- Insertar inscripciones
INSERT INTO inscripciones (estudiante_id, curso_id, fecha_inscripcion, nota, estado) VALUES
-- Fernando Moyano
(1, 1, '2024-03-01', 8.5, 'Aprobado'),
(1, 2, '2024-03-01', 9.0, 'Aprobado'),
(1, 4, '2024-08-15', 8.0, 'Cursando'),
(1, 5, '2024-08-15', NULL, 'Cursando'),
-- Ana García
(2, 1, '2024-03-01', 9.5, 'Aprobado'),
(2, 2, '2024-03-01', 9.2, 'Aprobado'),
(2, 3, '2024-08-15', 9.8, 'Cursando'),
(2, 6, '2024-08-15', NULL, 'Cursando'),
-- Carlos Pérez
(3, 1, '2024-03-01', 7.0, 'Aprobado'),
(3, 2, '2024-03-01', 7.5, 'Aprobado'),
(3, 7, '2024-08-15', 6.8, 'Cursando'),
-- María López
(4, 2, '2024-03-01', 9.0, 'Aprobado'),
(4, 4, '2024-03-01', 8.5, 'Aprobado'),
(4, 3, '2024-08-15', NULL, 'Cursando'),
(4, 6, '2024-08-15', NULL, 'Cursando'),
-- Juan Díaz
(5, 1, '2023-09-10', 6.5, 'Aprobado'),
(5, 7, '2023-09-10', 7.0, 'Aprobado'),
(5, 2, '2024-03-01', 7.5, 'Aprobado'),
-- Laura Martínez
(6, 1, '2024-03-01', 9.8, 'Aprobado'),
(6, 2, '2024-03-01', 9.5, 'Aprobado'),
(6, 3, '2024-08-15', 9.7, 'Cursando'),
(6, 4, '2024-08-15', NULL, 'Cursando'),
(6, 6, '2024-08-15', NULL, 'Cursando'),
-- Pedro Rodríguez (inactivo)
(7, 1, '2023-03-01', 5.5, 'Reprobado'),
(7, 2, '2023-03-01', 4.8, 'Reprobado'),
-- Sofía Fernández
(8, 1, '2024-03-01', 9.0, 'Aprobado'),
(8, 2, '2024-03-01', 8.8, 'Aprobado'),
(8, 5, '2024-08-15', NULL, 'Cursando'),
-- Diego González
(9, 2, '2024-03-01', 7.8, 'Aprobado'),
(9, 4, '2024-03-01', 8.2, 'Aprobado'),
(9, 3, '2024-08-15', NULL, 'Cursando'),
-- Valentina Sánchez
(10, 1, '2024-03-01', 9.3, 'Aprobado'),
(10, 7, '2024-03-01', 9.0, 'Aprobado'),
(10, 2, '2024-08-15', NULL, 'Cursando'),
-- Lucas Romero
(11, 1, '2024-03-01', 6.0, 'Aprobado'),
(11, 7, '2024-03-01', 6.8, 'Aprobado'),
-- Camila Torres
(12, 2, '2024-03-01', 8.5, 'Aprobado'),
(12, 4, '2024-03-01', 8.0, 'Aprobado'),
(12, 10, '2024-08-15', NULL, 'Cursando'),
-- Mateo Flores (inactivo)
(13, 1, '2022-09-10', 5.0, 'Reprobado'),
(13, 7, '2022-09-10', 6.0, 'Abandonado'),
-- Isabella Ramírez
(14, 1, '2024-03-01', 10.0, 'Aprobado'),
(14, 2, '2024-03-01', 9.8, 'Aprobado'),
(14, 3, '2024-08-15', NULL, 'Cursando'),
(14, 4, '2024-08-15', NULL, 'Cursando'),
-- Sebastián Castro
(15, 5, '2024-03-01', 7.5, 'Aprobado'),
(15, 10, '2024-03-01', 7.8, 'Aprobado'),
(15, 11, '2024-08-15', NULL, 'Cursando');

-- Insertar relaciones curso-profesor
INSERT INTO curso_profesor (curso_id, profesor_id, anio, semestre) VALUES
(1, 1, 2024, '1'),  -- BD I - Roberto García
(2, 2, 2024, '1'),  -- Prog I - Patricia López
(3, 2, 2024, '2'),  -- Prog II - Patricia López
(4, 3, 2024, '1'),  -- Algoritmos - Miguel Fernández
(5, 4, 2024, '2'),  -- Redes - Carmen Martínez
(6, 5, 2024, '2'),  -- IA - Jorge Sánchez
(7, 6, 2024, '1'),  -- Cálculo - Elena Romero
(8, 6, 2024, '2'),  -- Álgebra - Elena Romero
(9, 7, 2024, '1'),  -- Física - Alberto Torres
(10, 8, 2024, '1'), -- SO - Lucía Flores
(11, 1, 2024, '2'), -- Arquitectura - Roberto García
(12, 2, 2024, '2'); -- Ing. Software - Patricia López

-- Insertar bibliotecas
INSERT INTO bibliotecas (nombre, direccion, capacidad, horario_apertura, horario_cierre) VALUES
('Biblioteca Central', 'Av. Principal 1234', 500, '08:00:00', '22:00:00'),
('Biblioteca de Informática', 'Edificio B, 2do piso', 150, '09:00:00', '20:00:00'),
('Biblioteca de Ciencias', 'Edificio C, 1er piso', 200, '08:30:00', '21:00:00');

-- Insertar libros
INSERT INTO libros (titulo, autor, isbn, año_publicacion, editorial, categoria, biblioteca_id, disponible) VALUES
('Fundamentos de Bases de Datos', 'Elmasri & Navathe', '978-0133970777', 2015, 'Pearson', 'Informática', 2, TRUE),
('SQL: The Complete Reference', 'James Groff', '978-0071592550', 2010, 'McGraw-Hill', 'Informática', 2, TRUE),
('Clean Code', 'Robert C. Martin', '978-0132350884', 2008, 'Prentice Hall', 'Informática', 2, FALSE),
('Introduction to Algorithms', 'Cormen et al.', '978-0262033848', 2009, 'MIT Press', 'Informática', 2, TRUE),
('Java: How to Program', 'Paul Deitel', '978-0134743356', 2017, 'Pearson', 'Informática', 2, TRUE),
('Design Patterns', 'Gang of Four', '978-0201633610', 1994, 'Addison-Wesley', 'Informática', 2, FALSE),
('The Pragmatic Programmer', 'Hunt & Thomas', '978-0135957059', 2019, 'Addison-Wesley', 'Informática', 2, TRUE),
('Cálculo de una Variable', 'James Stewart', '978-6074817188', 2012, 'Cengage Learning', 'Matemáticas', 1, TRUE),
('Álgebra Lineal', 'Stanley Grossman', '978-0073532349', 2012, 'McGraw-Hill', 'Matemáticas', 1, TRUE),
('Física para Ciencias e Ingeniería', 'Serway & Jewett', '978-6075195087', 2014, 'Cengage Learning', 'Física', 3, TRUE),
('Redes de Computadoras', 'Andrew Tanenbaum', '978-6073217743', 2012, 'Pearson', 'Informática', 2, TRUE),
('Inteligencia Artificial: Un Enfoque Moderno', 'Russell & Norvig', '978-6073221320', 2010, 'Pearson', 'Informática', 2, FALSE),
('Operating Systems Concepts', 'Silberschatz', '978-1118063330', 2012, 'Wiley', 'Informática', 2, TRUE),
('Computer Organization and Design', 'Patterson & Hennessy', '978-0124077263', 2013, 'Morgan Kaufmann', 'Informática', 2, TRUE);

-- Insertar préstamos
INSERT INTO prestamos (estudiante_id, libro_id, fecha_prestamo, fecha_devolucion_esperada, fecha_devolucion_real, multa) VALUES
(1, 1, '2024-09-01', '2024-09-15', '2024-09-14', 0.00),
(1, 4, '2024-10-01', '2024-10-15', NULL, 0.00),  -- Aún no devuelto
(2, 3, '2024-09-15', '2024-09-29', '2024-10-05', 60.00),  -- Devuelto tarde
(2, 2, '2024-10-10', '2024-10-24', NULL, 0.00),  -- Aún no devuelto
(3, 5, '2024-09-20', '2024-10-04', '2024-10-03', 0.00),
(4, 1, '2024-09-10', '2024-09-24', '2024-09-22', 0.00),
(4, 6, '2024-10-05', '2024-10-19', NULL, 0.00),
(6, 7, '2024-09-25', '2024-10-09', '2024-10-08', 0.00),
(6, 12, '2024-10-15', '2024-10-29', NULL, 0.00),
(8, 11, '2024-09-18', '2024-10-02', '2024-09-30', 0.00),
(10, 8, '2024-10-01', '2024-10-15', NULL, 0.00),
(14, 9, '2024-09-22', '2024-10-06', '2024-10-12', 60.00);  -- Devuelto tarde