$(document).ready(function() {
    $('#loginForm').submit(function(event) {
        event.preventDefault();

        // Obtener los valores del formulario
        var username = $('#username').val();
        var password = $('#password').val();
        $.ajax({
            type: 'POST',
            url: 'PHP/login.php',
            data: {
                username: username,
                password: password
            },
            success: function(response) {
                window.location.href = 'index.html';
            },
            error: function() {
                alert('Nombre de usuario o contraseña incorrectos.');
            }
        });
    });
});