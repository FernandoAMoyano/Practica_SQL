
-- ============================================
-- SCRIPT DE BASE DE DATOS PARA PRÁCTICA
-- Universidad - Sistema de Gestión Académica
-- ============================================

-- Eliminar base de datos si existe (para empezar limpio)
DROP DATABASE IF EXISTS universidad;

-- Crear base de datos
CREATE DATABASE universidad CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Usar la base de datos
USE universidad;

-- ============================================
-- 1. CREACIÓN DE TABLAS (DDL)
-- ============================================

-- Tabla: estudiantes
CREATE TABLE estudiantes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    edad INT CHECK (edad >= 16 AND edad <= 100),
    promedio DECIMAL(4,2) DEFAULT 0.00,
    fecha_ingreso DATE NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    CONSTRAINT chk_promedio CHECK (promedio >= 0 AND promedio <= 10)
);

-- Tabla: cursos
CREATE TABLE cursos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    creditos INT NOT NULL CHECK (creditos > 0),
    departamento VARCHAR(50),
    cupo_maximo INT DEFAULT 30,
    precio DECIMAL(10,2)
);

-- Tabla: profesores
CREATE TABLE profesores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100),
    email VARCHAR(150) UNIQUE,
    salario DECIMAL(10,2),
    fecha_contratacion DATE
);

-- Tabla: inscripciones (relación entre estudiantes y cursos)
CREATE TABLE inscripciones (
    id INT PRIMARY KEY AUTO_INCREMENT,
    estudiante_id INT NOT NULL,
    curso_id INT NOT NULL,
    fecha_inscripcion DATE NOT NULL,
    nota DECIMAL(4,2),
    estado ENUM('Cursando', 'Aprobado', 'Reprobado', 'Abandonado') DEFAULT 'Cursando',
    FOREIGN KEY (estudiante_id) REFERENCES estudiantes(id) ON DELETE CASCADE,
    FOREIGN KEY (curso_id) REFERENCES cursos(id) ON DELETE CASCADE,
    CONSTRAINT uk_estudiante_curso UNIQUE (estudiante_id, curso_id)
);

-- Tabla: curso_profesor (relación entre cursos y profesores)
CREATE TABLE curso_profesor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    curso_id INT NOT NULL,
    profesor_id INT NOT NULL,
    anio INT NOT NULL,
    semestre ENUM('1', '2') NOT NULL,
    FOREIGN KEY (curso_id) REFERENCES cursos(id) ON DELETE CASCADE,
    FOREIGN KEY (profesor_id) REFERENCES profesores(id) ON DELETE CASCADE
);

-- Tabla: bibliotecas
CREATE TABLE bibliotecas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200),
    capacidad INT,
    horario_apertura TIME,
    horario_cierre TIME
);

-- Tabla: libros
CREATE TABLE libros (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(200) NOT NULL,
    autor VARCHAR(150),
    isbn VARCHAR(20) UNIQUE,
    año_publicacion INT,
    editorial VARCHAR(100),
    categoria VARCHAR(50),
    biblioteca_id INT,
    disponible BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (biblioteca_id) REFERENCES bibliotecas(id) ON DELETE SET NULL
);

-- Tabla: prestamos
CREATE TABLE prestamos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    estudiante_id INT NOT NULL,
    libro_id INT NOT NULL,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion_esperada DATE NOT NULL,
    fecha_devolucion_real DATE,
    multa DECIMAL(8,2) DEFAULT 0.00,
    FOREIGN KEY (estudiante_id) REFERENCES estudiantes(id) ON DELETE CASCADE,
    FOREIGN KEY (libro_id) REFERENCES libros(id) ON DELETE CASCADE
);

