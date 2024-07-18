<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List"%>
<%@ page import="modelos.Producto"%>
<%@ page import="controladores.controllerProducto"%>
<%@ page import="DAO.ProductoDAO"%>

<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="shortcut icon" href="img/icons/icon-48x48.png" />
        <title>Campo Verde</title>
        <link href="css/app.css" rel="stylesheet" type="text/css"/>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
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
                            <a class="sidebar-link" href="">
                                <i class="align-middle" data-feather="user"></i> <span
                                    class="align-middle">Perfil</span>
                            </a>
                        </li>

                        <li class="sidebar-item">
                            <a class="sidebar-link" href="listaUsuario.jsp">
                                <i class="align-middle" data-feather="user-plus"></i> <span
                                    class="align-middle">Lista de clientes</span>
                            </a>
                        </li>

                        <li class="sidebar-item">
                            <a class="sidebar-link" href="">
                                <i class="align-middle" data-feather="book"></i> <span
                                    class="align-middle">Productos</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="ChatEmpleados.jsp">
                                <i class="align-middle" data-feather="message-square"></i> <span
                                    class="align-middle">Chat - Campo Verde</span>
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
                                <a class="nav-icon dropdown-toggle" href="#" id="alertsDropdown"
                                   data-bs-toggle="dropdown">
                                    <div class="position-relative">
                                        <i class="align-middle" data-feather="bell"></i>
                                        <span class="indicator">4</span>
                                    </div>
                                </a>
                                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0"
                                     aria-labelledby="alertsDropdown">
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
                                                    <div class="text-muted small mt-1">Restart server 12 to complete
                                                        the
                                                        update.</div>
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
                                                    <div class="text-muted small mt-1">Aliquam ex eros, imperdiet
                                                        vulputate
                                                        hendrerit et.</div>
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
                                                    <div class="text-muted small mt-1">Christina accepted your
                                                        request.
                                                    </div>
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
                                <a class="nav-icon dropdown-toggle" href="#" id="messagesDropdown"
                                   data-bs-toggle="dropdown">
                                    <div class="position-relative">
                                        <i class="align-middle" data-feather="message-square"></i>
                                    </div>
                                </a>
                                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0"
                                     aria-labelledby="messagesDropdown">
                                    <div class="dropdown-menu-header">
                                        <div class="position-relative">
                                            Mensajes
                                        </div>
                                    </div>
                                    <div class="list-group">
                                        <a href="#" class="list-group-item">

                                        </a>
                                        <a href="#" class="list-group-item">

                                        </a>
                                        <a href="#" class="list-group-item">

                                        </a>
                                        <a href="#" class="list-group-item">

                                        </a>
                                    </div>
                                    <div class="dropdown-menu-footer">
                                        <a href="#" class="text-muted">Todos los mensajes</a>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#"
                                   data-bs-toggle="dropdown">
                                    <i class="align-middle" data-feather="settings"></i>
                                </a>

                                <a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#"
                                   data-bs-toggle="dropdown">
                                    <span class="text-dark"> <%= session.getAttribute("nombre") != null ? session.getAttribute("nombre") : "Usuario Ingresado" %></span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-end">
                                    <a class="dropdown-item" href="#"><img src="img/6998118.png" class="avatar img-fluid rounded me-1"><%= session.getAttribute("empleado") != null ? session.getAttribute("empleado") : "Usuario Ingresado" %></a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="login.jsp">Cerrar sesión</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>

                <main class="content">
                    <div class="container-fluid p-0">

                        <h1 class="h3 mb-3"><strong>Productos Registrados</strong></h1>

                        <div class="container mt-4">
                            <div class="row">
                                <div class="col-12">
                                    <table class="table table-hover" style="width: 85%; border-collapse: separate; border-spacing: 0 15px;">
                                        <thead>
                                            <tr>
                                                <th>ITEM</th>
                                                <th>Nombres</th>
                                                <th>Foto</th>
                                                <th>Categoria</th>
                                                <th>Descripcion</th>
                                                <th>Precio</th>
                                                <th>Stock</th>
                                                <th>Acción</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% try {        
                                                DAO.ProductoDAO productoDAO = new DAO.ProductoDAO();
                                                java.util.List<modelos.Producto> listaProducto = productoDAO.listaProductos();
                                                for (modelos.Producto productos : listaProducto) {
                                            %>
                                            <tr>
                                                <td>-</td>
                                                <td><%= productos.getNombres() %></td>
                                                <td>
                                                    <img src="controllerIMG?id=${productos.getId()} " width="100" height="100">
                                                </td>
                                                <td><%= productos.getCategoria() %></td>
                                                <td><%= productos.getDescripcion() %></td>
                                                <td><%= productos.getPrecio() %></td>
                                                <td><%= productos.getStock() %></td>
                                                <td>
                                                    <a href="controllerProducto?accion=Eliminar&id=${productos.getId()}" class="btn btn-danger" onclick="return confirm('¿Estás seguro de eliminar este producto?')">Eliminar</a>
                                                </td>                                            
                                            </tr>
                                            <% } } catch (Exception e) {
                                                e.printStackTrace();
                                            } %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- Aquí va el contenido de tu página -->
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#agregarProductoModal">
                            Nuevo Producto
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="agregarProductoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Agregar Producto</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="IngresoProductos" method="post" enctype="multipart/form-data">
                                            <div class="form-group">
                                                <label for="nombre">Nombre del Producto:</label>
                                                <input type="text" class="form-control" id="nombre" name="nombre" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="categoria">Categoría:</label>
                                                <input type="number" class="form-control" id="categoria" name="categoria" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="foto">Foto:</label>
                                                <input type="file" class="form-control-file" id="foto" name="foto" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="descripcion">Descripción:</label>
                                                <textarea class="form-control" id="descripcion" name="descripcion" required></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="precio">Precio:</label>
                                                <input type="number" step="0.01" class="form-control" id="precio" name="precio" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="stock">Stock:</label>
                                                <input type="number" class="form-control" id="stock" name="stock" required>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Agregar Producto</button>
                                        </form>
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
                                    <a class="text-muted" href="" target="_blank"><strong>Campo</strong></a> - <a
                                        class="text-muted" href="" target="_blank"><strong>Verde</strong></a> &copy;
                                </p>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="js/app.js"></script>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>
</html>