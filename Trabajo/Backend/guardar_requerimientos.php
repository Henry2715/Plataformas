<?php
// Conexión a la base de datos
$conn = new mysqli("localhost", "root", "", "bienestar_universitario");
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Recibir datos del formulario
$nombre_completo = $_POST['nombre_completo'];
$numero_identificacion = $_POST['numero_identificacion']; // Solo para formar un correo dummy
$descripcion = $_POST['descripcion'];
$tipo_cita = $_POST['area_bienestar']; // Esta también es la categoría ENUM de la cita
$tipo_requerimiento = $_POST['tipo_requerimiento'];

// Procesar archivo subido
$archivo_nombre = $_FILES['archivo']['name'];
$ruta_temporal = $_FILES['archivo']['tmp_name'];
$directorioDestino = "archivos/";
if (!file_exists($directorioDestino)) {
    mkdir($directorioDestino, 0777, true);
}
move_uploaded_file($ruta_temporal, $directorioDestino . $archivo_nombre);

// Insertar usuario (si no existe)
$sql_usuario = "INSERT INTO usuarios (nombre_completo, correo_electronico)
    VALUES (?, ?) ON DUPLICATE KEY UPDATE id=LAST_INSERT_ID(id)";
$stmt_usuario = $conn->prepare($sql_usuario);
$correo_dummy = $numero_identificacion . "@example.com"; // Crear un correo ficticio
$stmt_usuario->bind_param("ss", $nombre_completo, $correo_dummy);
$stmt_usuario->execute();
$id_usuario = $conn->insert_id;
$stmt_usuario->close();

// Obtener ID del área
$sql_area = "SELECT id_area FROM areas_bienestar WHERE nombre_area = ?";
$stmt_area = $conn->prepare($sql_area);
$stmt_area->bind_param("s", $tipo_cita);
$stmt_area->execute();
$stmt_area->bind_result($id_area);
$stmt_area->fetch();
$stmt_area->close();

// Obtener ID del tipo de requerimiento
$sql_tipo = "SELECT id_tipo FROM tipos_requerimiento WHERE nombre_tipo = ?";
$stmt_tipo = $conn->prepare($sql_tipo);
$stmt_tipo->bind_param("s", $tipo_requerimiento);
$stmt_tipo->execute();
$stmt_tipo->bind_result($id_tipo);
$stmt_tipo->fetch();
$stmt_tipo->close();

// Insertar requerimiento
$sql_requerimiento = "INSERT INTO requerimientos (
    id_usuario, id_area, id_tipo, descripcion, archivo_nombre, tipo_cita
) VALUES (?, ?, ?, ?, ?, ?)";
$stmt_req = $conn->prepare($sql_requerimiento);
$stmt_req->bind_param("iiisss", $id_usuario, $id_area, $id_tipo, $descripcion, $archivo_nombre, $tipo_cita);
$stmt_req->execute();
$stmt_req->close();

$conn->close();

// Confirmar al usuario
echo "<script>alert('Requerimiento enviado exitosamente'); window.location.href = 'index.html';</script>";
?>
