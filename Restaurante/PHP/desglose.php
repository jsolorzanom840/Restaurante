<?php
$servername = "localhost";
$username = "root";
$password = "Diciembre123!!";
$dbname = "restaurantefinal";   

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}   

if ($_SERVER["REQUEST_METHOD"] == "GET") {
    if (true) {
        $stmt = $conn->query("SELECT * FROM platillos");
        $platillos = $stmt->fetch_all(MYSQLI_ASSOC);
        // Convertir a JSON
        //$jsonPlatillos = json_encode($platillos);
        echo json_encode($platillos);

    } else {
        console.log("fallo");
        $stmt = $pdo->query("SELECT * FROM platillos");
        $platillos = $stmt->fetchAll(PDO::FETCH_ASSOC);

        echo json_encode($platillos);
    }
}
// Cerrar la conexión
$conn->close();
?>