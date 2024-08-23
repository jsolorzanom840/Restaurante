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

// Procesar datos del formulario de inicio de sesión
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre_usuario = $_POST["username"];
    $contraseña = $_POST["password"];

    // Preparar y ejecutar la consulta SQL de autenticación
    $sql = "SELECT * FROM Usuarios WHERE nombre_usuario = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $nombre_usuario);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        if (password_verify($contraseña, $row["contraseña"])) {
            // Inicio de sesión exitoso, redirigir al usuario a la página de inicio
            header("Location: index.html");
            exit();
        } else {
            // Contraseña incorrecta
            echo "Nombre de usuario o contraseña incorrectos.";
        }
    } else {
        // Usuario no encontrado
        echo "Nombre de usuario o contraseña incorrectos.";
    }

    $stmt->close();
}

$conn->close();
?>