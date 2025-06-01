-- Crear la base de datos (opcional)
CREATE DATABASE IF NOT EXISTS bienestar_universitario;
USE bienestar_universitario;

-- Tabla de usuarios
CREATE TABLE usuarios (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(255) NOT NULL,
    correo_electronico VARCHAR(255) NOT NULL UNIQUE
);

-- Tabla de áreas de bienestar
CREATE TABLE areas_bienestar (
    id_area INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_area VARCHAR(255) NOT NULL
);

-- Tabla de tipos de requerimiento
CREATE TABLE tipos_requerimiento (
    id_tipo INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_tipo VARCHAR(255) NOT NULL
);

-- Tabla de requerimientos
CREATE TABLE requerimientos (
    id_requerimiento INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT UNSIGNED NOT NULL,
    id_area INT UNSIGNED NOT NULL,
    id_tipo INT UNSIGNED NOT NULL,
    descripcion TEXT NOT NULL,
    archivo_nombre VARCHAR(255) NOT NULL,
    fecha_envio DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    tipo_cita ENUM('Medica', 'Odontologia', 'Psicologia', 'Cultura', 'Deporte', 'Espiritualidad') 
        NOT NULL DEFAULT 'Medica',
    
    -- Llaves foráneas
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
    FOREIGN KEY (id_area) REFERENCES areas_bienestar(id_area),
    FOREIGN KEY (id_tipo) REFERENCES tipos_requerimiento(id_tipo)
);
