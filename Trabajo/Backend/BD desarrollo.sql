<!-- INTEGRANTES: FABIAN ANDRES ARIAS SANTIAGO, STEFANNY XIOMARA FAJARDO, HENRY DAVID SUAREZ SERRANO, Solanggie Moreno Santos-->



CREATE TABLE Requerimientos (
    id_requerimiento INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    id_area INT,
    id_tipo INT,
    descripcion TEXT NOT NULL,
    archivo_nombre VARCHAR(255),
    fecha_envio DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_area) REFERENCES AreasBienestar(id_area),
    FOREIGN KEY (id_tipo) REFERENCES TiposRequerimiento(id_tipo)
    Tipo_cita ENUM('Salud fisica y mental', 'Desarrollo personal y profesional', 'Apoyo academico', 
    'Integracion y vida social','Inclusion y diversidad', 'seguridad y bienestar') DEFAULT 'Salud fisica y mental'
);

CREATE TABLE Bienestar (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    nivel_estres INT,
    estado_animo VARCHAR(255),
    calidad_sueno VARCHAR(255),
    habitos_ejercicio VARCHAR(255),
    dieta_preferencias VARCHAR(255),
    antecedentes_salud_mental VARCHAR(255),
    antecedentes_salud_fisica VARCHAR(255),
    habitos_consumo_sustancias VARCHAR(255),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id)
);

CREATE TABLE Configuracion_Privacidad (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    contrasena VARCHAR(255),
    consentimiento_datos BOOLEAN,
    configuracion_privacidad VARCHAR(255),
    registro_actividad TEXT,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id)
);
