
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro Campo Verde</title>
        <link rel="stylesheet" href="css/registr.css">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="icon" href="img/logo-icono.png" type="image/x-icon">

        <style>

            .bg-cover {
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                height: 100%;
                width: 100%;
            }
            .transparent-card, .form-control{
                background: rgba(255, 255, 255, 0.2);
            }
            .btn-primary {
                background-color: #064420;
                border-color: #064420;
            }

        </style>
    </head>
    <body>
        <div class="bg-cover" style="background-image: url('img/login1111.jpg');">
            <div class="container d-flex justify-content-center align-items-center min-vh-100">
                <div class="card transparent-card col-lg-4">
                    <div class="card-body">
                        <form class="form-sign mb-4" action="registroUsuario" method="post">
                            <div class="form-group  mb-4 text-center">
                                <h2 class="form-group mb-5">Bienvenido a REGISTRO</h2>
                                <img class="form-group mb-4" src="img/logo-text-green.png" alt="70" width="330"/>
                            </div>
                            <div class="form-group mb-4">
                                <label for="nombreCompleto">Nombre Completo:</label>
                                <input type="text" id="nombreCompleto" name="nombreCompleto" class="form-control" required>
                            </div>
                            <div class="form-group mb-4">
                                <label for="apellido">Apellidos:</label>
                                <input type="text" id="apellido" name="apellido" class="form-control" required>
                            </div>
                            <div class="form-group mb-4">
                                <label for="correo">Correo Electrónico:</label>
                                <input type="email" id="correo" name="correo" class="form-control" required>
                            </div>
                            <div class="form-group mb-4">
                                <label for="contrasena">Contraseña:</label>
                                <input type="password" id="contrasena" name="contrasena" class="form-control" required>
                            </div>
                            <div class="form-group mb-4 text-center">
                                <button type="submit" name="accion" value="Registrarse" class="btn btn-primary btn-block btn-outline">Registrarse</button>
                            </div>
                            <div class="form-group mt-3 text-center">
                                ¿Ya tienes una cuenta? <a style="text-decoration: none; color:#064420" href="login.jsp">Inicia Sesión</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
    </body>
</html>


