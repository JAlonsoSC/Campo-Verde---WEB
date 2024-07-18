<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List"%>
<%@ page import="modelos.Empleado"%>
<%@ page import="DAO.EmpleadoDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="shortcut icon" href="img/icons/icon-48x48.png" />
        <title>Lista Empleados - Campo Verde</title>
        <link href="css/app.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    </head>
    <body>
        <div class="wrapper">
            <nav id="sidebar" class="sidebar js-sidebar">
                <div class="sidebar-content js-simplebar">
                    <a class="sidebar-brand" href="principal.jsp">
                        <span class="align-middle">Campo Verde</span>
                    </a>

                    <ul class="sidebar-nav">
                        <li class="sidebar-header">
                            Principal
                        </li>

                        <li class="sidebar-item">
                            <a class="sidebar-link" href="principal.jsp">
                                <i class="align-middle" data-feather="sliders"></i> <span
                                    class="align-middle">Dashboard</span>
                            </a>
                        </li>

                        <li class="sidebar-item">
                            <a class="sidebar-link" href="enviarMensaje.jsp">
                                <i class="align-middle" data-feather="user"></i> <span
                                    class="align-middle">Perfil</span>
                            </a>
                        </li>

                        <li class="sidebar-item">
                            <a class="sidebar-link" href="Empleado_lista.jsp">
                                <i class="align-middle" data-feather="log-in"></i> <span class="align-middle">Lista de Empleados</span>
                            </a>
                        </li>

                        <li class="sidebar-item">
                            <a class="sidebar-link" href="listaUsuario.jsp">
                                <i class="align-middle" data-feather="user-plus"></i> <span
                                    class="align-middle">Lista de clientes</span>
                            </a>
                        </li>

                        <li class="sidebar-item">
                            <a class="sidebar-link" href="listaProveedores.jsp">
                                <i class="align-middle" data-feather="book"></i> <span
                                    class="align-middle">Lista de Proveedores</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="principalEmpleado.jsp">
                                <i class="align-middle" data-feather="book"></i> <span
                                    class="align-middle">Productos</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="foro.jsp">
                                <i class="align-middle" data-feather="message-square"></i> <span
                                    class="align-middle">Foro de Discusión</span>
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
                                    <a class="dropdown-item" href="CerrarSesion">Cerrar sesión</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Tabla de la lista de los empleados de la empresa Campo Verde</h1>
                    <p class="mb-4"><a target="_blank"></a></p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <!-- Botón para abrir el modal -->
                        <div class="card-header py-3">

                            <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addEmployeeModal">Agregar Empleado</a>
                        </div>

                        <!-- Modal para agregar empleado -->
                        <div class="modal fade" id="addEmployeeModal" tabindex="-1" aria-labelledby="addEmployeeModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="addEmployeeModalLabel">Agregar Empleado</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="controlador" method="post">
                                            <div class="form-group mb-4">
                                                <label for="Dni">Dni</label>
                                                <input type="text" id="Dni" value="${empty param.Dni ? '' : param.Dni}" name="Dni" class="form-control" required pattern="\d+">
                                            </div>
                                            <div class="form-group mb-4">
                                                <label for="Nombres">Nombres</label>
                                                <input type="text" id="Nombres" value="${empty param.Nombres ? '' : param.Nombres}" name="Nombres" class="form-control" required>
                                            </div>
                                            <div class="form-group mb-4">
                                                <label for="Telefono">Telefono</label>
                                                <input type="number" id="Telefono" value="${empty param.Telefono ? '' : param.Telefono}" name="Telefono" class="form-control" required pattern="\d+">
                                            </div>
                                            <div class="form-group mb-4">
                                                <label for="Correo">Correo</label>
                                                <input type="email" id="Correo" value="${empty param.Correo ? '' : param.Correo}" name="Correo" class="form-control" required>
                                            </div>
                                            <div class="form-group mb-4">
                                                <label for="Cargo">Cargo</label>
                                                <select id="Cargo" name="Cargo" class="form-select mb-2" required>
                                                    <option selected disabled>${empty param.Cargo ? 'Cargo' : param.Cargo}</option>
                                                    <option value="Administrador" ${param.Cargo == 'Administrador' ? 'selected' : ''}>Administrador</option>
                                                    <option value="Empleado" ${param.Cargo == 'Empleado' ? 'selected' : ''}>Empleado</option>
                                                </select>
                                            </div>
                                            <div class="form-group mb-4">
                                                <label for="Area">Area</label>
                                                <select id="Area" name="Area" class="form-select mb-2" required>
                                                    <option selected disabled>${empty param.Area ? 'Seleccionar Area' : param.Area}</option>
                                                    <option value="Administracion" ${param.Area == 'Administracion' ? 'selected' : ''}>Administración</option>
                                                    <option value="Logistica" ${param.Area == 'Logistica' ? 'selected' : ''}>Logística</option>
                                                    <option value="Ventas" ${param.Area == 'Ventas' ? 'selected' : ''}>Ventas</option>
                                                    <option value="Gestión del Talento" ${param.Area == 'Gestión del Talento' ? 'selected' : ''}>Gestión del Talento</option>
                                                    <option value="Contabilidad y Finanzas" ${param.Area == 'Contabilidad y Finanzas' ? 'selected' : ''}>Contabilidad y Finanzas</option>
                                                    <option value="Marketing" ${param.Area == 'Marketing' ? 'selected' : ''}>Marketing</option>
                                                    <option value="Sistemas y Tecnología" ${param.Area == 'Sistemas y Tecnología' ? 'selected' : ''}>Sistemas y Tecnología</option>
                                                </select>
                                            </div>
                                            <div class="form-group mb-4">
                                                <label for="User">Usuario</label>
                                                <input type="text" id="User" value="${empty param.User ? '' : param.User}" name="User" class="form-control" required>
                                            </div>
                                            <div class="form-group mb-4">
                                                <label for="Contrasena">Contraseña</label>
                                                <input type="text" id="Contrasena" value="${empty param.Contrasena ? '' : param.Contrasena}" name="Contrasena" class="form-control" required>
                                            </div>
                                            <input type="submit" name="accion" value="Agregar" class="btn btn-info text-bg-primary">
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>DNI</th>
                                            <th>NOMBRES</th>
                                            <th>TELEFONO</th>
                                            <th>CORREO</th>
                                            <th>CARGO</th>
                                            <th>AREA</th>
                                            <th>USUARIO</th>
                                            <th>CONTRASEÑA</th>
                                            <th>ESTADO</th>
                                            <th>ACCIONES</th>
                                        </tr>
                                    </thead> 
                                    <tbody>
                                        <%
                                             EmpleadoDAO empleadoDAO = new EmpleadoDAO();
                                             List<Empleado> listarEmpleados = empleadoDAO.listarEmpleado();
                                             for (Empleado empleado : listarEmpleados) {
                                        %>
                                        <tr>
                                            <td><%= empleado.getDni() %></td>
                                            <td><%= empleado.getNombres() %></td>
                                            <td><%= empleado.getTelefono() %></td>
                                            <td><%= empleado.getCorreo() %></td>
                                            <td><%= empleado.getCargo() %></td>
                                            <td><%= empleado.getArea() %></td>
                                            <td><%= empleado.getUser() %></td>
                                            <td><%= empleado.getContrasena() %></td>
                                            <td><%= empleado.getEstado() %></td>
                                            <td>
                                                <div>
                                                    <a href="controlador?accion=Actualizar&IdEmpleado=<%= empleado.getIdEmpleado() %>" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#exampleModal<%= empleado.getIdEmpleado() %>">Editar</a>

                                                    <!-- Modal para editar empleado -->
                                                    <div class="modal fade" id="exampleModal<%= empleado.getIdEmpleado() %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel">Editar Empleado</h5>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <form action="controlador?accion=Actualizar&IdEmpleado=<%= empleado.getIdEmpleado()%>" method="post">
                                                                        <input type="hidden" name="accion" value="Actualizar">
                                                                        <input type="hidden" name="IdEmpleado" value="<%= empleado.getIdEmpleado() %>">
                                                                        <div class="form-group mb-4">
                                                                            <label for="Dni<%= empleado.getIdEmpleado() %>">DNI</label>
                                                                            <input type="text" id="Dni<%= empleado.getIdEmpleado() %>" value="<%= empleado.getDni() %>" name="Dni" class="form-control" required pattern="\d+">
                                                                        </div>
                                                                        <div class="form-group mb-4">
                                                                            <label for="Nombres<%= empleado.getIdEmpleado() %>">Nombres</label>
                                                                            <input type="text" id="Nombres<%= empleado.getIdEmpleado() %>" value="<%= empleado.getNombres() %>" name="Nombres" class="form-control" required>
                                                                        </div>
                                                                        <div class="form-group mb-4">
                                                                            <label for="Telefono<%= empleado.getIdEmpleado() %>">Teléfono</label>
                                                                            <input type="text" id="Telefono<%= empleado.getIdEmpleado() %>" value="<%= empleado.getTelefono() %>" name="Telefono" class="form-control" required pattern="\d+">
                                                                        </div>
                                                                        <div class="form-group mb-4">
                                                                            <label for="Correo<%= empleado.getIdEmpleado() %>">Correo:</label>
                                                                            <input type="email" id="Correo<%= empleado.getIdEmpleado() %>" value="<%= empleado.getCorreo() %>" name="Correo" class="form-control" required>
                                                                        </div>
                                                                        <div class="form-group mb-4">
                                                                            <label for="Cargo<%= empleado.getIdEmpleado() %>">Cargo:</label>
                                                                            <select id="Cargo<%= empleado.getIdEmpleado() %>" name="Cargo" class="form-select mb-2" required>
                                                                                <option selected disabled><%= empleado.getCargo() == null ? "Seleccionar Cargo" : empleado.getCargo() %></option>
                                                                                <option value="Administrador" <%= "Administrador".equals(empleado.getCargo()) ? "selected" : "" %>>Administrador</option>
                                                                                <option value="Empleado" <%= "Empleado".equals(empleado.getCargo()) ? "selected" : "" %>>Empleado</option>
                                                                            </select>
                                                                        </div>
                                                                        <div class="form-group mb-4">
                                                                            <label for="Area<%= empleado.getIdEmpleado() %>">Area: </label>
                                                                            <select id="Area<%= empleado.getIdEmpleado() %>" name="Area" class="form-select mb-2" required>
                                                                                <option selected disabled><%= empleado.getArea() == null ? "Seleccionar Area" : empleado.getArea() %></option>
                                                                                <option value="Administracion" <%= "Administracion".equals(empleado.getArea()) ? "selected" : "" %>>Administración</option>
                                                                                <option value="Logistica" <%= "Logistica".equals(empleado.getArea()) ? "selected" : "" %>>Logistica</option>
                                                                                <option value="Ventas" <%= "Ventas".equals(empleado.getArea()) ? "selected" : "" %>>Ventas</option>
                                                                                <option value="Contabilidad y Finanzas" <%= "Contabilidad y Finanzas".equals(empleado.getArea()) ? "selected" : "" %>>Contabilidad y Finanzas</option>
                                                                                <option value="Gestion del Talento" <%= "Gestion del Talento".equals(empleado.getArea()) ? "selected" : "" %>>Gestion del Talento</option>
                                                                                <option value="Marketing" <%= "Marketing".equals(empleado.getArea()) ? "selected" : "" %>>Marketing</option>
                                                                                <option value="Sistemas y Tecnología" <%= "Sistemas y Tecnología".equals(empleado.getArea()) ? "selected" : "" %>>Sistemas y Tecnología</option>
                                                                            </select>
                                                                        </div>
                                                                        <div class="form-group mb-4">
                                                                            <label for="User<%= empleado.getIdEmpleado() %>">Usuario</label>
                                                                            <input type="text" id="User<%= empleado.getIdEmpleado() %>" value="<%= empleado.getUser() %>" name="User" class="form-control" required>
                                                                        </div>
                                                                        <div class="form-group mb-4">
                                                                            <label for="Contrasena<%= empleado.getIdEmpleado() %>">Contraseña</label>
                                                                            <input type="text" id="Contrasena<%= empleado.getIdEmpleado() %>" value="<%= empleado.getContrasena() %>" name="Contrasena" class="form-control" required>
                                                                        </div>
                                                                        <div class="form-group mb-4">
                                                                            <label for="Estado<%= empleado.getIdEmpleado() %>">Estado: </label>
                                                                            <select id="Estado<%= empleado.getIdEmpleado() %>" name="Estado" class="form-select mb-2" required>
                                                                                <option selected disabled><%= empleado.getEstado() == null ? "Seleccionar Cargo" : empleado.getEstado() %></option>
                                                                                <option value="inhabilitado" <%= "inhabilitado".equals(empleado.getEstado()) ? "selected" : "" %>>inhabilitado</option>
                                                                                <option value="habilitado" <%= "habilitado".equals(empleado.getEstado()) ? "selected" : "" %>>habilitado</option>
                                                                            </select>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                                            <button type="submit" class="btn btn-success">Actualizar</button>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <a href="controlador?accion=Eliminar&IdEmpleado=<%= empleado.getIdEmpleado() %>" class="btn btn-danger">Eliminar</a>
                                                </div>
                                            </td>
                                        </tr>
                                        <%
                                             }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Footer -->
                <footer class="footer">
                    <div class="container-fluid">
                        <div class="row text-muted">
                            <div class="col-6">
                                <p class="mb-0">
                                    <a class="text-muted" href="" target="_blank"><strong>Campo</strong></a> -
                                    <a class="text-muted" href="" target="_blank"><strong>Verde</strong></a> &copy;
                                </p>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <!-- JS Files -->
        <script src="js/app.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>