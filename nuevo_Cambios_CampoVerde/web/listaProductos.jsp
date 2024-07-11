<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <title>Campo Verde</title>
        <link href="css/productos.css" rel="stylesheet" type="text/css"/>
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
        <div class="container-fluid page-header" style="background-image: url('img/listaproductos.jpg'); background-size: cover; background-position: center;">
            <div class="container">
                <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 500px;">
                    <div class="p-3">
                        <h4 class="text-primary text-uppercase mb-md-3"></h4>
                        <h1 class="display-3 text-primary mb-md-4">Lista de Productos</h1>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End -->


        <c:if test="${not empty productos}">
            <div class="container mt-4">
                <div class="row">
                    <c:forEach var="p" items="${productos}">
                        <div class="col-sm-4">
                            <div class="card">
                                <div class="card-header">
                                    <label>${p.nombres}</label>
                                </div>
                                <div class="card-body">
                                    <label>${p.precio}</label>
                                    <img src="controllerIMG?id=${p.id}" width="200" height="180">
                                </div>
                                <div class="card-footer text-center">
                                    <label>${p.descripcion}</label>
                                    <div>
                                        <a href="controllerProducto?accion=Agregar&id=${p.id}" class="btn btn-outline-info">Agregar al carrito</a>
                                        <a href="controllerProducto?accion=Comprar&id=${p.id}" class="btn btn-danger">Comprar</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:if>



        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-white-50 py-5 px-sm-3 px-lg-5" style="margin-top: 90px;">
            <div class="row pt-5">
                <div class="col-lg-4 col-md-6 mb-5">
                    <a href="" class="navbar-brand">
                        <h1 class="text-primary"><span class="text-white">Campo </span>Verde</h1>
                    </a>
                    <p>Nos dedicamos a la producción agropecuaria, y estamos comprometidos con la responsabilidad social y ambiental.</p>
                    <div class="d-flex justify-content-start">
                        <a class="btn btn-outline-primary btn-square mr-2" href="#"><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-outline-primary btn-square mr-2" href="#"><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-outline-primary btn-square mr-2" href="#"><i class="fab fa-linkedin-in"></i></a>
                        <a class="btn btn-outline-primary btn-square" href="#"><i class="fab fa-instagram"></i></a>
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
