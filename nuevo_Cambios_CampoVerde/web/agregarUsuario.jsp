<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Lista de Usuarios</title>
        <link rel="stylesheet" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="icon" href="img/logo-icono.png" type="image/x-icon">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Campo Verde</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Dashboard</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="listaUsuario.jsp">Lista de Usuarios</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="listaProveedores.jsp">Lista de Proveedores</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Productos
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Productos Agrícolas</a></li>
                                <li><a class="dropdown-item" href="#">Productos Ganaderos</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <i class="fa-solid fa-user"><button class="btn btn-outline-success" type="submit">Cerrar Sesión</button></i>
                    </form>
                </div>
            </div>
        </nav>  

        <form action="eliminarUsuario" method="post">
            <table border="1">
                <label for="userId">Seleccionar Usuario:</label>
                <select id="userId" name="userId">
                    <option value="1">Usuario 1</option>
                    <option value="2">Usuario 2</option>
                    <!-- Agrega más opciones según tus usuarios -->
                </select>
                <tr>
                    <td><label for="nombreCompleto">Nombre Completo:</label></td>
                    <td><input type="text" id="nombreCompleto" name="nombreCompleto" required></td>
                </tr>
                <tr>
                    <td><label for="apellido">Apellidos:</label></td>
                    <td><input type="text" id="apellido" name="apellido" required></td>
                </tr>
                <tr>
                    <td><label for="correo">Correo/Código:</label></td>
                    <td><input type="email" id="correo" name="correo" required></td>
                </tr>
                <tr>
                    <td><label for="contrasena">Contraseña:</label></td>
                    <td><input type="password" id="contrasena" name="contrasena" required></td>
                </tr>
                <tr>
                    <td colspan="2"><button type="submit">Eliminar</button></td>
                </tr>
            </table>
        </form>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
    </body>
</html>




