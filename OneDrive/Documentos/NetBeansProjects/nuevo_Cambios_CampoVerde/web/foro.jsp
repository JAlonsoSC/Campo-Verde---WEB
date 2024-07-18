<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List"%>
<%@ page import="modelos.Tema"%>
<%@ page import="DAO.TemaDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="shortcut icon" href="img/icons/icon-48x48.png" />
        <title>Foro de Discusión - Campo Verde</title>
        <link href="css/app.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body>
        <div class="wrapper">
            <nav id="sidebar" class="sidebar js-sidebar">
                <div class="sidebar-content js-simplebar">
                    <a class="sidebar-brand" href="index.html">
                        <span class="align-middle">Campo Verde</span>
                    </a>

                    <ul class="sidebar-nav">
                        <li class="sidebar-header">
                            Principal
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="principal.jsp">
                                <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Dashboard</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="enviarMensaje.jsp">
                                <i class="align-middle" data-feather="user"></i> <span class="align-middle">Perfil</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="Empleado_lista.jsp">
                                <i class="align-middle" data-feather="log-in"></i> <span class="align-middle">Lista de Empleados</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="listaUsuario.jsp">
                                <i class="align-middle" data-feather="user-plus"></i> <span class="align-middle">Lista de clientes</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="listaProveedores.jsp">
                                <i class="align-middle" data-feather="book"></i> <span class="align-middle">Lista de Proveedores</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="principalEmpleado.jsp">
                                <i class="align-middle" data-feather="book"></i> <span class="align-middle">Productos</span>
                            </a>
                        </li>
                        <li class="sidebar-item active">
                            <a class="sidebar-link" href="foro.jsp">
                                <i class="align-middle" data-feather="message-square"></i> <span class="align-middle">Foro de Discusión</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <div class="main">
                <nav class="navbar navbar-expand navbar-light navbar-bg">
                    <a class="sidebar-toggle js-sidebar-toggle">
                        <i class="hamburger align-self-center"></i>
                    </a>
                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav navbar-align">
                            <li class="nav-item dropdown">
                                <a class="nav-icon dropdown-toggle" href="#" id="alertsDropdown" data-bs-toggle="dropdown">
                                    <div class="position-relative">
                                        <i class="align-middle" data-feather="bell"></i>
                                        <span class="indicator">4</span>
                                    </div>
                                </a>
                                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0" aria-labelledby="alertsDropdown">
                                    <div class="dropdown-menu-header">
                                        Notificaciones
                                    </div>
                                    <div class="list-group">
                                        <a href="#" class="list-group-item">
                                            <div class="row g-0 align-items-center">
                                                <div class="col-2">
                                                    <i class="text-danger" data-feather="alert-circle"></i>
                                                </div>
                                                <div class="col-10">
                                                    <div class="text-dark">Update completed</div>
                                                    <div class="text-muted small mt-1">Restart server 12 to complete the update.</div>
                                                    <div class="text-muted small mt-1">30m ago</div>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <div class="row g-0 align-items-center">
                                                <div class="col-2">
                                                    <i class="text-warning" data-feather="bell"></i>
                                                </div>
                                                <div class="col-10">
                                                    <div class="text-dark">Lorem ipsum</div>
                                                    <div class="text-muted small mt-1">Aliquam ex eros, imperdiet vulputate hendrerit et.</div>
                                                    <div class="text-muted small mt-1">2h ago</div>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <div class="row g-0 align-items-center">
                                                <div class="col-2">
                                                    <i class="text-primary" data-feather="home"></i>
                                                </div>
                                                <div class="col-10">
                                                    <div class="text-dark">Login </div>
                                                    <div class="text-muted small mt-1">5h ago</div>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <div class="row g-0 align-items-center">
                                                <div class="col-2">
                                                    <i class="text-success" data-feather="user-plus"></i>
                                                </div>
                                                <div class="col-10">
                                                    <div class="text-dark">New connection</div>
                                                    <div class="text-muted small mt-1">Christina accepted your request.</div>
                                                    <div class="text-muted small mt-1">14h ago</div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="dropdown-menu-footer">
                                        <a href="#" class="text-muted">Show all notifications</a>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-icon dropdown-toggle" href="#" id="messagesDropdown" data-bs-toggle="dropdown">
                                    <div class="position-relative">
                                        <i class="align-middle" data-feather="message-square"></i>
                                    </div>
                                </a>
                                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0" aria-labelledby="messagesDropdown">
                                    <div class="dropdown-menu-header">
                                        <div class="position-relative">
                                            Mensajes
                                        </div>
                                    </div>
                                    <div class="list-group">
                                        <a href="#" class="list-group-item">
                                            <!-- Mensajes de ejemplo -->
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <!-- Mensajes de ejemplo -->
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <!-- Mensajes de ejemplo -->
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <!-- Mensajes de ejemplo -->
                                        </a>
                                    </div>
                                    <div class="dropdown-menu-footer">
                                        <a href="#" class="text-muted">Todos los mensajes</a>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#" data-bs-toggle="dropdown">
                                    <i class="align-middle" data-feather="settings"></i>
                                </a>
                                <a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-bs-toggle="dropdown">
                                    <span class="text-dark"> <%= session.getAttribute("nombre") != null ? session.getAttribute("nombre") : "Usuario Ingresado" %></span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-end">
                                    <a class="dropdown-item" href="#"><img src="img/6998118.png" class="avatar img-fluid rounded me-1"><%= session.getAttribute("empleado") != null ? session.getAttribute("empleado") : "Usuario Ingresado" %></a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="CerrarSesion">Cerrar sesión</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>

                <main class="content">
                    <div class="container-fluid p-0">

                        <h1 class="h3 mb-3"><strong>Foro CAMPO - VERDE</strong></h1>

                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="card-title mb-0">Temas de discusión</h5>
                                    </div>
                                    <div class="card-body">
                                        <form action="CrearTema" method="post">
                                            <div class="input-group mb-3">
                                                <input type="text" class="form-control" placeholder="Nuevo tema" name="tituloTema" required>
                                                <button class="btn btn-primary" type="submit">Crear</button>
                                            </div>
                                        </form>

                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    <th>Título</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% 
                                                    TemaDAO temaDAO = new TemaDAO();
                                                    List<Tema> temas = temaDAO.obtenerTemas();
                                                    for (Tema tema : temas) {
                                                %>
                                                <tr>
                                                    <td>-</td>
                                                    <td><%= tema.getTitulo() %></td>
                                                    <td>
                                                        <a href="#" class="btn btn-danger delete-link"
                                                           data-id="<%= tema.getId() %>">Eliminar</a>
                                                    </td>

                                                </tr>
                                                <% } %>
                                            </tbody>
                                        </table>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </main>

                <footer class="footer">
                    <div class="container-fluid">
                        <div class="row text-muted">
                            <div class="col-6 text-start">
                                <p class="mb-0">
                                    <a class="text-muted"><strong>Campo Verde</strong></a> &copy;
                                </p>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>

        <script src="js/app.js"></script>
        <script src="js/formulario.js" type="text/javascript"></script>
    </body>
</html>
