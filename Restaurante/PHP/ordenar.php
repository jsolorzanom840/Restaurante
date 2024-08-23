<?php
// Conexión a la base de datos
$servername = "localhost";
$username = "root";
$password = "Diciembre123!!";
$dbname = "restaurantefinal";
                    
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Procesar el formulario de ordenar
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre = $_POST["nombre"];
    $descripcion = $_POST["descripcion"];
    $Mesa = $_POST["Mesa"];
    $id_usuarios = $_POST["id_usuarios"];

    // Insertar la orden en la tabla de platillos
    $sql = "INSERT INTO platillos (nombre, descripcion, Mesa, id_usuarios) VALUES ('$nombre', '$descripcion', '$Mesa' , '$id_usuarios')";
    if ($conn->query($sql) === TRUE) {
        echo "Orden enviada correctamente.";
    } else {
        echo "Error al enviar la orden: " . $conn->error;
    }
}

// Cerrar la conexión
$conn->close();
?>