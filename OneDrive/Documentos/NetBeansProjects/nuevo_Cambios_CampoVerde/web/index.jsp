<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            .fixed-size {
                width: 100%;
                height: auto;
            }
            .bg-custom {
                background-color: #1b3821;
            }
            .btn-primary {
                background-color: #064420;
                border-color: #064420;
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
        <div class="container-fluid page-header" style="background-image: url('img/fondo11.jpg'); background-size: cover; background-position: center;">
            <div class="container">
                <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 700px;">
                    <div class="p-3">
                        <h4 class="text-black text-white mb-md-3">Agropecuaria</h4>
                        <h1 class="display-3 text-white mb-md-4">Campo Verde</h1>
                        <p class="text-white">Somos una empresa agropecuaria de avanzada en producción de genética de ganado de la raza Nelore y producción de carne bovina</p>
                        <a href="nosotros.jsp" class="btn btn-primary py-md-3 px-md-5 mt-2">Conoce mas</a>
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
                            <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Nuestros productos</h6>
                            <h1 class="mb-3">Nos dedicamos a la producción agropecuaria, y estamos comprometidos con la responsabilidad social y ambiental.</h1>
                            <p>Amor por la raza Nelore, pasión por la calidad y búsqueda permanente de la excelencia, es la trinidad de la Agropecuaria Campo Verde. Para obtener resultados óptimos nos enfocamos en el Manejo Adecuado, Genética y la Nutrición</p>
                            <div class="row mb-4">
                                <div class="col-6">
                                    <img class="img-fluid" src="img/agricola.jpg" alt="" width="250">
                                </div>
                                <div class="col-6">
                                    <img class="img-fluid" src="img/soja-920x550.jpg" alt="" width="300">
                                </div>
                            </div>
                            <div class="text-center">
                                <a href="productos.jsp" class="btn btn-primary mt-1">Conoce más</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->


        <!-- Product Start -->
        <div class="container-xxl bg-light my-6 py-6 pt-0 mt-5">
            <div class="container">
                <div class="bg-custom p-5 mt-4">
                    <div class="row g-4 align-items-center">
                        <div class="col-lg-12">
                            <h1 class="display-4 text-light mb-0">La Mejor Opcion de los productos</h1>
                        </div>
                    </div>
                </div>
                <div class="text-center mx-auto mb-5 mt-4 wow">
                    <h1 class="display-6 mb-4">Explora Las Distintas Categorias Que Ofrecemos </h1>
                </div>
                <div class="row g-6">
                    <div class="col-lg-6 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="product-item d-flex flex-column bg-white rounded overflow-hidden h-100">
                            <div class="text-center p-6">
                                <h3 class="mb-3">Ganaderia</h3>
                                <span>La constante selección y la consecuente expansión, sienta precedentes notables en los propósitos perseguidos de poblar extensas áreas con ganado adaptado a sistemas extensivos de crianza.</span>
                            </div>
                            <div class="position-relative mt-auto">
                                <div class="product-overlay d-flex justify-content-center align-items-center">
                                    <a class="btn btn-lg-square btn-outline-light rounded-circle d-flex justify-content-center align-items-center" href="controllerProducto?accion=productos&categoriaId=2">
                                        <i class="fa fa-eye text-primary"></i>
                                    </a>
                                </div>
                                <img class="img-fluid w-100" src="img/nelore.jpg" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                        <div class="product-item d-flex flex-column bg-white rounded overflow-hidden h-100">
                            <div class="text-center p-6">
                                <h4 class="mb-3">Agricultura</h4>
                                <span>Desarrollamos y representamos productos eficaces, confiables, seguros y amigables con el medio ambiente.
                                    Te invitamos a visitar nuestro catalogo de productos agropecuarios.</span>
                            </div>
                            <div class="position-relative mt-auto">
                                <div class="product-overlay d-flex justify-content-center align-items-center">
                                    <a class="btn btn-lg-square btn-outline-light rounded-circle d-flex justify-content-center align-items-center" href="controllerProducto?accion=productos&categoriaId=1">
                                        <i class="fa fa-eye text-primary"></i>
                                    </a>
                                </div>
                                <img class="img-fluid w-100" src="img/prod-agro.jpg" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Product End -->






        <!-- Video -->
        <div class="container-fluid mt-5">
            <div class="d-flex justify-content-center">
                <video width="100%" height="auto" controls>
                    <source src="img/Agropecuaria2.mp4" type="video/mp4">
                </video>
            </div>
        </div>
        <!-- Video -->


        <!-- Facts Start -->
        <div class="container-xxl py-6 mt-5">
            <div class="container">
                <div class="row g-4">
                    <div class="col-lg-3 col-md-6 wow fadeIn" data-wow-delay="0.1s">
                        <div class="fact-item bg-light rounded text-center h-100 p-5">
                            <i class="fa fa-certificate fa-4x text-primary mb-4"></i>
                            <p class="mb-2">Premios ganados</p>
                            <h1 class="display-5 mb-0" data-toggle="counter-up">14</h1>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 wow fadeIn" data-wow-delay="0.5s">
                        <div class="fact-item bg-light rounded text-center h-100 p-5">
                            <i class="fa fa-users fa-4x text-primary mb-4"></i>
                            <p class="mb-2">Proveedores Profesionales</p>
                            <h1 class="display-5 mb-0" data-toggle="counter-up">4</h1>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 wow fadeIn" data-wow-delay="0.5s">
                        <div class="fact-item bg-light rounded text-center h-100 p-5">
                            <i class="fa fa-bread-slice fa-4x text-primary mb-4"></i><i class="fa-solid fa-cow"></i>
                            <p class="mb-2">Total  de Products</p>
                            <h1 class="display-5 mb-0" data-toggle="counter-up">+100</h1>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 wow fadeIn" data-wow-delay="0.7s">
                        <div class="fact-item bg-light rounded text-center h-100 p-5">
                            <i class="fa fa-cart-plus fa-4x text-primary mb-4"></i>
                            <p class="mb-2">Ventas por Dia</p>
                            <h1 class="display-5 mb-0" data-toggle="counter-up">+500</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Facts End -->

        <!-- Certificaciones -->
        <div class="container-fluid py-6 mt-5">
            <div class="container pt-5 pb-3">
                <div class="text-center mb-3 pb-3">
                    <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Nuestras</h6>
                    <h1>Certificaciones</h1>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="destination-item position-relative overflow-hidden mb-2">
                            <img class="img-fluid fixed-size" src="img/certificaciones-11.png" alt="">
                            <a class="destination-overlay text-white text-decoration-none" href="#"></a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="destination-item position-relative overflow-hidden mb-2">
                            <img class="img-fluid fixed-size" src="img/certificaciones-12.png" alt="">
                            <a class="destination-overlay text-white text-decoration-none" href="#"></a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="destination-item position-relative overflow-hidden mb-2">
                            <img class="img-fluid fixed-size" src="img/certificaciones-13.jpg" alt="">
                            <a class="destination-overlay text-white text-decoration-none" href="#"></a>
                        </div>
                    </div>
                    <div class="text-center">
                        <a href="nosotros.jsp" class="btn btn-primary">Conoce más</a>
                    </div>                
                </div>
            </div>
        </div>
        <!-- Destination End -->

        <!-- Service Start -->
        <div class="container-fluid py-5">
            <div class="container pt-5 pb-3">
                <div class="text-center mb-3 pb-3">
                    <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Mejoramos</h6>
                    <h1>Nuestro compromiso</h1>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="service-item bg-white text-center mb-2 py-5 px-4">
                            <i class="fa fa-2x fa-route mx-auto mb-4"></i>
                            <h5 class="mb-2">Sostenibilidad</h5>
                            <p class="m-0">Deseamos poner al alcance de todos las oportunidades de esta nueva era, seamos parte de la solución</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="service-item bg-white text-center mb-2 py-5 px-4">
                            <i class="fa fa-2x fa-ticket-alt mx-auto mb-4"></i>
                            <h5 class="mb-2">Bienestar Animal</h5>
                            <p class="m-0">Brindamos alta calidad de vida con los mejores suplementos a los animales criados para la producción de alimentos.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="service-item bg-white text-center mb-2 py-5 px-4">
                            <i class="fa fa-2x fa-hotel mx-auto mb-4"></i>
                            <h5 class="mb-2">Genética</h5>
                            <p class="m-0">Mejoramos la rentabilidad al ofrecerle en cada generación de animales una mejora en la producción</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Service End -->


        <!-- Registration Start -->
        <div class="container-fluid bg-registration py-5 mt-1" style="background-image: url('img/bbbbb.jpg'); background-size: cover; background-position: center;">
            <div class="container py-5">
                <div class="row align-items-center">
                    <div class="col-lg-7 mb-5 mb-lg-0">
                        <div class="mb-4">
                            <h1 class="text-white text-uppercase" style="letter-spacing: 5px;">Campo Verde</h1>
                            <h2 class="text-white">Agropecuaria</h2>
                        </div>
                        <h4 class="text-white">Trabajamos juntos para adaptarnos a ti y a las necesidades de tu mercado, ofrecemos productos:</h4>
                        <ul class="list-inline text-white m-0">
                            <li class="py-2"><i class="fa fa-check text-primary mr-3"></i>Agropecuarios</li>
                            <li class="py-2"><i class="fa fa-check text-primary mr-3"></i>Agricolas</li>
                        </ul>
                    </div>
                    <div class="col-lg-5">
                        <div class="card border-0">
                            <div class="bg-custom card-header  text-center p-3">
                                <h1 class="text-white m-0">Comunicate con Nosotros</h1>
                            </div>
                            <div class="card-body rounded-bottom bg-white p-5">
                                <form>
                                    <div>
                                        <a href="contacto.jsp" class="border-top border-bottom btn btn-block py-3" >Contactanos</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Registration End -->


        <!-- Footer Start -->

        <div class="container-fluid bg-dark text-white-50 py-5 px-sm-3 px-lg-5 mt-5">
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
        <script src="js/cont.js" type="text/javascript"></script>

    </body>

</html>
