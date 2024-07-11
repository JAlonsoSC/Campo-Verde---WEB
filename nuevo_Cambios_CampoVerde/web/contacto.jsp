<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"%>
<%@ page import="modelos.Contacto"%>
<%@ page import="DAO.ContactoDAO"%>


<!DOCTYPE html>
<html lang="es">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Campo Verde</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"> 

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->

        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <style>
            .nav-item {
                list-style: none;
            }

            .nav-item::before {
                content: none;
            }

            .main-content {
                text-align: center; /* Centra el contenido del formulario */
                padding: 50px 15px; /* Añade espaciado interno al formulario */
            }

            .text-input {
                width: 100%;
                margin-bottom: 10px;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            fieldset {
                border: 1px solid #ccc;
                border-radius: 5px;
                margin-bottom: 10px;
                padding: 10px;
            }

            .button {
                background-color: #007bff;
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .button:hover {
                background-color: #0056b3;
            }

            .map {
                height: 300px; /* Altura del mapa (ajusta según sea necesario) */
                background-color: #f0f0f0; /* Color de fondo del mapa */
                margin-bottom: 20px;
            }

        </style>

        <!-- Incluir API de Google Maps -->
        <script src="https://maps.googleapis.com/maps/api/js?key=TU_API_KEY"></script>

        <!-- Script para inicializar el mapa -->
        <script>
            function initMap() {
                // Coordenadas del centro del mapa
                var myLatLng = {lat: -12.046374, lng: -77.042793};

                // Opciones del mapa
                var mapOptions = {
                    zoom: 15, // Nivel de zoom
                    center: myLatLng        // Centro del mapa
                };

                // Crear el mapa
                var map = new google.maps.Map(document.getElementById('map'), mapOptions);

                // Marcador en el centro del mapa
                var marker = new google.maps.Marker({
                    position: myLatLng,
                    map: map,
                    title: 'Ubicación de Campo Verde' // Título del marcador
                });
            }

            // Llamar a initMap cuando la página esté cargada
            document.addEventListener('DOMContentLoaded', initMap);
        </script>
    </head>

    <body>

        <!-- Topbar Start -->
        <div class="container-fluid bg-light pt-3 d-none d-lg-block">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 text-center text-lg-left mb-2 mb-lg-0">
                        <div class="d-inline-flex align-items-center">
                            <p><i class="fa fa-envelope mr-2"></i>agropecuaria@campoverde.com</p>
                            <p class="text-body px-3">|</p>
                            <p><i class="fa fa-phone-alt mr-2"></i>+51 956 123 456</p>
                        </div>
                    </div>
                    <div class="col-lg-6 text-center text-lg-right">
                        <div class="d-inline-flex align-items-center">
                            <a class="text-primary px-3" href="">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a class="text-primary px-3" href="">
                                <i class="fab fa-twitter"></i>
                            </a>
                            <a class="text-primary px-3" href="">
                                <i class="fab fa-linkedin-in"></i>
                            </a>
                            <a class="text-primary px-3" href="">
                                <i class="fab fa-instagram"></i>
                            </a>
                            <a class="text-primary pl-3" href="">
                                <i class="fab fa-youtube"></i>
                            </a>
                        </div>

                    </div>

                </div>
            </div>
        </div>
        <!-- Topbar End -->


        <!-- Navbar Start -->
        <div class="container-fluid position-relative nav-bar p-0">
            <div class="container-lg position-relative p-0 px-lg-3" style="z-index: 9;">
                <nav class="navbar navbar-expand-lg bg-light navbar-light shadow-lg py-3 py-lg-0 pl-3 pl-lg-5">
                    <a href="" class="navbar-brand">
                        <h1 class="m-0 text-primary"><span class="text-dark">Campo </span>Verde</h1>
                    </a>
                    <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between px-3" id="navbarCollapse">
                        <div class="navbar-nav ml-auto py-0">
                            <a href="index.jsp" class="nav-item nav-link">Inicio</a>
                            <a href="nosotros.jsp" class="nav-item nav-link">Nosotros</a>
                            <a href="vistaForo.jsp" class="nav-item nav-link">Foros</a>
                            <a href="productos.jsp" class="nav-item nav-link">Productos</a>
                            <a href="contacto.jsp" class="nav-item nav-link">Contacto</a>
                            <a class="nav-link" href="controllerProducto?accion=Carrito"><i class="fas fa-cart-plus">(<label style="color: black">${contador}</label>)</i></a>
                            <li class="nav-item dropdown mb-lg-4">
                                <a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#"
                                   data-bs-toggle="dropdown">
                                    <span class="text-black fw-bold"> <%= session.getAttribute("nombreUsuario") != null ? session.getAttribute("nombreUsuario") : "Inicia sesión" %></span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-end">
                                    <% if (session.getAttribute("usuario") != null) { %>
                                    <a class="dropdown-item"><%= session.getAttribute("usuario") %></a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="CerrarSesion">Cerrar sesión</a>
                                    <% } else { %>
                                    <a class="btn btn-primary px-3 center"  href="login.jsp">Inicia sesión</a>
                                    <% } %>
                                </div>
                            </li>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->

        <!-- Header Start -->
        <div class="container-fluid page-header" style="margin-bottom: 60px; background-image: url('img/contacto1.jpg'); background-size: cover; background-position: center;">
            <div class="container">
                <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 400px;">
                    <div class="d-inline-flex text-dark">
                        <p class="m-0 text-uppercase"><a class="text-dark" href="index.jsp">Inicio</a></p>
                        <i class="fa fa-angle-double-right pt-1 px-3"></i>
                        <p class="m-0 text-uppercase">Contacto</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="text-center">
            <h1 class="d-inline-flex text-primary" style="margin-bottom: 60px; font-family: times;">Contactenos</h1>
        </div>

        <!-- Header End -->
        <div style="display: flex;">
            <div class="col-6" style="flex: 1; display: flex; align-items: center;">
                <img class="img-fluid" src="img/contacto1111.jpg" alt="Contact Image" width="700">
            </div>
            <div class="col-6" style="flex: 1; display: flex; align-items: center;">
                <!-- Formulario de contacto -->
                <div style="width: 100%;">
                    <h2 class="text-center" style="margin-bottom: 20px; font-family: times;">Si tiene alguna consulta, contáctenos</h2>
                    <p class="text-center" style="margin-bottom: 20px;">Para contactarnos porfavor ingrese:</p>
                    <div class="container" style="max-width: 600px; margin: 0 auto;">


                        <form action="registrarContacto" method="post" >
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="text" id="nombreCompleto" name="nombreCompleto" class="form-control" placeholder="Su nombre" required>
                                        <label for="nombreCompleto">Su nombre</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="email" id="correo" name="correo" class="form-control" placeholder="Su correo" required>
                                        <label for="correo">Su correo</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="tel" id="telefono" name="telefono" class="form-control" placeholder="Su teléfono" required>
                                        <label for="telefono">Su teléfono</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="text" id="ciudad" name="ciudad" class="form-control" placeholder="Su ciudad" required>
                                        <label for="ciudad">Su ciudad</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <select id="producto" name="producto" class="form-select mb-2" required>
                                        <option selected disabled>Seleccione</option>
                                        <option>Productos Ganaderos</option>
                                        <option>Productos Agrícolas</option>
                                    </select>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating">
                                        <textarea id="mensaje" name="mensaje" class="form-control" placeholder="Su mensaje" required style="height: 200px"></textarea>
                                        <label for="mensaje">Mensaje</label>
                                    </div>
                                </div>
                                <div class="col-12 text-center">
                                    <button class="btn btn-primary rounded-pill py-3 px-3" type="submit">Enviar mensaje</button>
                                </div>
                            </div>
                        </form>


                    </div>
                </div>
            </div>
        </div>


        <!-- Mapa -->
        <div class="map" id="map">
            <!-- Aquí se insertará el mapa -->
        </div>
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3798.9353178058627!2d-63.182136025055264!3d-17.79473678316363!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x93f1e963f3c5870d%3A0xf9b6ce636fe2e9a4!2sAGROPECUARIA%20CAMPO%20VERDE!5e0!3m2!1ses-419!2spe!4v1720153356468!5m2!1ses-419!2spe" width="100%" height="350" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>


        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-white-50 py-5 px-sm-3 px-lg-5" style="margin-top: 90px;">
            <div class="row pt-5">
                <div class="col-lg-4 col-md-6 mb-5">
                    <a href="" class="navbar-brand">
                        <h1 class="text-primary"><span class="text-white">Campo </span>Verde</h1>
                    </a>
                    <p>Nos dedicamos a la producción agropecuaria, y estamos comprometidos con la responsabilidad social y ambiental.</p>
                    <div class="d-flex justify-content-start">
                        <a class="btn btn-outline-primary btn-square mr-2" href="https://x.com/"><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-outline-primary btn-square mr-2" href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-outline-primary btn-square mr-2" href="https://pe.linkedin.com/"><i class="fab fa-linkedin-in"></i></a>
                        <a class="btn btn-outline-primary btn-square" href="https://www.instagram.com/"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-5">
                    <h5 class="text-white text-uppercase mb-4" style="letter-spacing: 5px;">Nuestros servicios</h5>
                    <div class="d-flex flex-column justify-content-start">
                        <a class="text-white-50 mb-2" href="index.jsp"><i class="fa fa-angle-right mr-2"></i>Inicio</a>
                        <a class="text-white-50 mb-2" href="nosotros.jsp"><i class="fa fa-angle-right mr-2"></i>Nosotros</a>
                        <a class="text-white-50 mb-2" href="vistaForo.jsp"><i class="fa fa-angle-right mr-2"></i>Foros</a>
                        <a class="text-white-50 mb-2" href="productos.jsp"><i class="fa fa-angle-right mr-2"></i>Productos</a>
                        <a class="text-white-50 mb-2" href="contacto.jsp"><i class="fa fa-angle-right mr-2"></i>Contacto</a>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 mb-5">
                    <h5 class="text-white text-uppercase mb-4" style="letter-spacing: 5px;">Información</h5>
                    <p><i class="fa fa-map-marker-alt mr-2"></i>123 Ica, Ica, Perú</p>
                    <p><i class="fa fa-phone-alt mr-2"></i>+51 956 123 456</p>
                    <p><i class="fa fa-envelope mr-2"></i>agropecuaria@campoverde.com</p>
                </div>
            </div>
        </div>
        <div class="container-fluid bg-dark text-white border-top py-4 px-sm-3 px-md-5" style="border-color: rgba(256, 256, 256, .1) !important;">
            <div class="row">
                <div class="col-lg-6 text-center text-md-left mb-3 mb-md-0">
                    <p class="m-0 text-white-50">Todos los derechos reservados &copy; 2024</p>
                </div>
            </div>
        </div>
        <!-- Footer End -->

        <!-- Scripts de Bootstrap y otros -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
                integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
                integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
        crossorigin="anonymous"></script>

        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="js/main.js" type="text/javascript"></script>
    </body>

</html>
