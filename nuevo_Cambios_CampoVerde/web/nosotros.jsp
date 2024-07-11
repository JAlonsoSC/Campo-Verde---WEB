<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
        </style>
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
        <div class="container-fluid page-header" style="background-image: url('img/nosotros1.jpg'); background-size: cover; background-position: center;">
            <div class="container">
                <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 600px;">
                    <h3 class="display-4 text-primary text-uppercase">Nosotros</h3>
                    <div class="d-inline-flex text-primary">
                        <p class="m-0 text-uppercase"><a class="text-dark" href="index.jsp">Inicio</a></p>
                        <i class="fa fa-angle-double-right pt-1 px-3"></i>
                        <p class="m-0 text-uppercase">Nosotros</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End -->


        <!-- About Start -->
        <div class="container-fluid py-5">
            <div class="container pt-5">
                <div class="row">
                    <div class="col-lg-6" style="min-height: 500px;">
                        <div class="position-relative h-100">
                            <img class="position-absolute w-100 h-100" src="img/ternero-677x900.png" style="object-fit: cover;">
                        </div>
                    </div>
                    <div class="col-lg-6 pt-5 pb-lg-5">
                        <div class="about-text bg-white p-4 p-lg-5 my-lg-5">
                            <h1 class="mb-3">Nuestros principios organizacionales</h1>
                            <p>La base que nos sostiene en el tiempo</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->

        <!-- Feature Start -->
        <div class="container-fluid pb-5">
            <div class="container pb-5">
                <div class="row">
                    <div class="col-md-6">
                        <div class="d-flex mb-8 mb-lg-4">
                            <div class="d-flex flex-shrink-0 align-items-center justify-content-center bg-primary mr-3" style="height: 100px; width: 100px;">
                                <i class="fa fa-2x fa-money-check-alt text-white"></i>
                            </div>
                            <div class="d-flex flex-column">
                                <h5 class="">Proposito</h5>
                                <p class="m-0">Cultivamos bienestar y desarrollo para el mundo.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="d-flex mb-8 mb-lg-4">
                            <div class="d-flex flex-shrink-0 align-items-center justify-content-center bg-primary mr-3" style="height: 100px; width: 100px;">
                                <i class="fa fa-2x fa-award text-white"></i>
                            </div>
                            <div class="d-flex flex-column">
                                <h5 class="">Misión</h5>
                                <p class="m-2"><span class="text-dark">-Invirtiendo en el desarrollo humano y tecnológico de nuestros colaboradores, asegurándonos de contar con equipos y procesos de vanguardia y promoviendo la mejora continua en todas las fases del negocio.</span></p>
                                <p class="m-2"><span class="text-dark">-Respetando el Medio Ambiente, velando por la Salud Ocupacional de nuestros colaboradores y manteniendo una relación de apoyo con las Comunidades en las que desarrollamos nuestras actividades.</span></p>
                                <p class="m-2"><span class="text-dark">-Alineando los intereses de nuestros Clientes y los del Entorno Local con los de nuestros Colaboradores y Accionistas.</span></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="d-flex mb-8 mb-lg-4">
                            <div class="d-flex flex-shrink-0 align-items-center justify-content-center bg-primary mr-3" style="height: 100px; width: 100px;">
                                <i class="fa fa-2x fa-globe text-white"></i>
                            </div>
                            <div class="d-flex flex-column">
                                <h5 class="">Visión</h5>
                                <p class="m-2"><span class="text-dark">-Mantendrá su posición de liderazgo nacional en la exportación de productos agricolas y ganaderos.</span></p>
                                <p class="m-2"><span class="text-dark">-Sustentará su éxito en la oportuna adecuación al cambio, mediante la permanente promoción de la innovación como medio generador de valor para la empresa.</span></p>
                                <p class="m-2"><span class="text-dark">-Será una empresa en la que será un orgullo trabajar por el nivel de exigencia profesional, por las relaciones con la comunidad, por el compromiso con la seguridad y salud ocupacional, así como por el respeto del medio ambiente.</span></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="d-flex mb-8 mb-lg-4">
                            <div class="d-flex flex-shrink-0 align-items-center justify-content-center bg-primary mr-3" style="height: 100px; width: 100px;">
                                <i class="fa fa-2x fa-globe text-white"></i>
                            </div>
                            <div class="d-flex flex-column">
                                <h5 class="">Valores</h5>
                                <p class="m-2"><span class="text-dark">Nuestros valores son elementos fundamentales que guían la forma en la que trabajamos, tomamos decisiones y nos relacionamos con nuestros grupos de interés.</span></p>
                                <p class="m-2 text-primary">Compromiso: <span class="text-dark">Tomamos como propios el propósito, visión, valores y objetivos de la empresa.</span></p>
                                <p class="m-2 text-primary">Trabajo en equipo: <span class="text-dark">Colaboramos para lograr objetivos comunes.</span></p>
                                <p class="m-2 text-primary">Respeto: <span class="text-dark">Actuamos con consideración hacia los demás y todo lo que nos rodea; construimos relaciones de confianza.</span></p>
                                <p class="m-2 text-primary">Honestidad: <span class="text-dark">Actuamos con la verdad en todo momento.</span></p>
                                <p class="m-2 text-primary">Responsabilidad: <span class="text-dark">Tenemos en cuenta tanto el negocio como el medio ambiente.</span></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Feature End -->




        <!-- Service Start -->
        <div class="container-fluid py-5">
            <div class="container pt-5 pb-3">
                <div class="text-center mb-3 pb-3">
                    <h1 class="text-primary text-uppercase" style="letter-spacing: 5px;">Nuestras POLITICAS</h1>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="service-item bg-white text-center mb-2 py-5 px-4">
                            <i class="fa fa-2x fa-route mx-auto mb-4"></i>
                            <h5 class="mb-2">Política De Derechos Humanos</h5>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="service-item bg-white text-center mb-2 py-5 px-4">
                            <i class="fa fa-2x fa-ticket-alt mx-auto mb-4"></i>
                            <br>
                            <h5 class="mb-2">Política Integrada de Calidad</h5>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="service-item bg-white text-center mb-2 py-5 px-4">
                            <i class="fa fa-2x fa-hotel mx-auto mb-4"></i>
                            <br>
                            <h5 class="mb-2">Política de Código Ético</h5>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="service-item bg-white text-center mb-2 py-5 px-4">
                            <i class="fa fa-2x fa-route mx-auto mb-4"></i>
                            <h5 class="mb-2">Política de Igualdad de Género</h5>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="service-item bg-white text-center mb-2 py-5 px-4">
                            <i class="fa fa-2x fa-ticket-alt mx-auto mb-4"></i>
                            <h5 class="mb-2">Política de Control y Seguridad</h5>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="service-item bg-white text-center mb-2 py-5 px-4">
                            <i class="fa fa-2x fa-hotel mx-auto mb-4"></i>
                            <h5 class="mb-2">Política de Seguridad y Salud en el Trabajo (SST)</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Service End -->


        <!-- Certificaciones -->
        <div class="container-fluid py-5">
            <div class="container pt-5 pb-3">
                <div class="text-center mb-3 pb-3">
                    <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Nuestras</h6>
                    <h1>Certificaciones</h1>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="destination-item position-relative overflow-hidden mb-2">
                            <img class="img-fluid fixed-size" src="img/certificacion1.png" alt="">
                            <a class="destination-overlay text-white text-decoration-none" href=""></a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="destination-item position-relative overflow-hidden mb-2">
                            <img class="img-fluid fixed-size" src="img/certificacion1.png" alt="">
                            <a class="destination-overlay text-white text-decoration-none" href=""></a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="destination-item position-relative overflow-hidden mb-2">
                            <img class="img-fluid fixed-size" src="img/certificacion1.png" alt="">
                            <a class="destination-overlay text-white text-decoration-none" href=""></a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="destination-item position-relative overflow-hidden mb-2">
                            <img class="img-fluid fixed-size" src="img/certificacion1.png" alt="">
                            <a class="destination-overlay text-white text-decoration-none" href=""></a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="destination-item position-relative overflow-hidden mb-2">
                            <img class="img-fluid fixed-size" src="img/certificacion1.png" alt="">
                            <a class="destination-overlay text-white text-decoration-none" href=""></a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="destination-item position-relative overflow-hidden mb-2">
                            <img class="img-fluid fixed-size" src="img/certificacion1.png" alt="">
                            <a class="destination-overlay text-white text-decoration-none" href=""></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Certificaciones -->

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
