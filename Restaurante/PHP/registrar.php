<?php
// Datos de conexión a la base de datos
$servername = "localhost";
$username = "root";
$password = "Diciembre123!!";
$dbname = "restaurantefinal";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Procesar datos del formulario de registro
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre_usuario = $_POST["nombre_usuario"];
    $contraseña = $_POST["contraseña"];
    $rol = "cliente"; // Puedes asignar un rol predeterminado

    // Preparar y ejecutar la consulta SQL de inserción
    $sql = "INSERT INTO Usuarios (nombre_usuario, contraseña, rol)
        VALUES ('$nombre_usuario', '$contraseña', '$rol')";
    if ($conn->query($sql) === TRUE) {
        exit();
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

// Cerrar conexión
$conn->close();
?>