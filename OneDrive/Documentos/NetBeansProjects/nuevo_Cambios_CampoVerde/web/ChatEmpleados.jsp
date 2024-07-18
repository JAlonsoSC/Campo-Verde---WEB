<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List"%>
<%@ page import="modelos.Empleado"%>
<%@ page import="modelos.Mensajes"%>
<%@ page import="DAO.EmpleadoDAO"%>
<%@ page import="DAO.MensajesDAO"%>
<%@ page import="DAO.MensajesDAOImpl"%>

<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="shortcut icon" href="img/icons/icon-48x48.png" />
        <title>Campo Verde</title>
        <link href="css/chat.css" rel="stylesheet" type="text/css"/>
        <link href="css/app.css" rel="stylesheet" type="text/css"/>
        <link href="css/chatempleado.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </head>

    <body>
        <div class="wrapper">
            <nav id="sidebar" class="sidebar js-sidebar">
                <div class="sidebar-content js-simplebar">
                    <a class="sidebar-brand" href="">
                        <span class="align-middle">Campo Verde</span>
                    </a>

                    <ul class="sidebar-nav">
                        <li class="sidebar-header">
                            Principal
                        </li>

                        <li class="sidebar-item active">
                            <a class="sidebar-link" href="">
                                <i class="align-middle" data-feather="sliders"></i> <span
                                    class="align-middle">Dashboard</span>
                            </a>
                        </li>

                        <li class="sidebar-item">
                            <a class="sidebar-link" href="">
                                <i class="align-middle" data-feather="user"></i> <span
                                    class="align-middle">Perfil</span>
                            </a>
                        </li>

                        <li class="sidebar-item">
                            <a class="sidebar-link" href="">
                                <i class="align-middle" data-feather="log-in"></i> <span class="align-middle">Lista de Empleados</span>
                            </a>
                        </li>

                        <li class="sidebar-item">
                            <a class="sidebar-link" href="">
                                <i class="align-middle" data-feather="user-plus"></i> <span
                                    class="align-middle">Lista de clientes</span>
                            </a>
                        </li>

                        <li class="sidebar-item">
                            <a class="sidebar-link" href="">
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
                            <a class="sidebar-link" href="">
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
                        <li>
                            <div class="dropdown-menu dropdown-menu-end">
                                <% if (session.getAttribute("usuario") != null) { %>
                                <a class="dropdown-item"><%= session.getAttribute("usuario") %></a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="CerrarChat">Cerrar sesión</a>
                                <% } else { %>
                                <a class="btn btn-primary px-3 center"  href="ChatEmpleados.jsp">Inicia sesión</a>
                                <% } %>
                            </div></li>
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


                <div class="message-area">
                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                <div class="chat-area">
                                    <!-- chatlist -->
                                    <div class="chatlist">
                                        <div class="modal-dialog-scrollable">
                                            <div class="modal-content">
                                                <div class="chat-header">
                                                    <div class="msg-search">
                                                        <input type="text" class="form-control" id="inlineFormInputGroup">
                                                        <a class="" href="#"><img class="img-fluid"  alt=""></a>
                                                    </div>
                                                </div>
                                                <div class="modal-body">
                                                    <!-- chat-list -->
                                                    <div class="chat-lists">
                                                        <div class="tab-content" id="myTabContent">
                                                            <div class="tab-pane fade show active" id="Open" role="tabpanel" aria-labelledby="Open-tab">
                                                                <!-- chat-list -->
                                                                <div class="chat-list">
                                                                    <table class="table table-hover">
                                                                        <thead>
                                                                            <tr>
                                                                                <th>Empleados</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <% EmpleadoDAO empleadoDAO = new EmpleadoDAO();
                                                                               List<Empleado> listarEmpleados = empleadoDAO.listarEmpleado();
                                                                               for (Empleado empleado : listarEmpleados) { %>
                                                                            <tr>
                                                                                <td>
                                                                                    <a href="ChatEmpleados.jsp?ReceptorID=<%= empleado.getIdEmpleado() %>" style="display: flex; align-items: center; text-decoration: none;">
                                                                                        <img src="img/images.png" alt="Imagen de Empleado" style="width: 40px; height: 40px; border-radius: 50%; margin-right: 10px;">
                                                                                        <span><%= empleado.getNombres() %></span>
                                                                                    </a>
                                                                                </td>
                                                                            </tr>
                                                                            <% } %>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <!-- chat-list -->
                                                            </div>
                                                            <div class="tab-pane fade" id="Closed" role="tabpanel" aria-labelledby="Closed-tab">
                                                                <!-- chat-list -->
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- chat-list -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- chatlist -->

                                    <!-- chatbox -->
                                    <div class="chatbox">
                                        <div class="modal-dialog-scrollable">
                                            <div class="modal-content">
                                                <div class="msg-head">
                                                    <div class="row">
                                                        <div class="col-8">
                                                            <div class="d-flex align-items-center">
                                                                <div class="flex-shrink-0">
                                                                    <img class="avatar img-fluid rounded me-2" src="img/6998118.png" alt="150px"  width="150px">
                                                                </div>
                                                                <div class="flex-grow-1 ms-3">
                                                                    <h3><%= request.getAttribute("receptorNombre") %></h3>
                                                                    <p>Empleado</p>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <%
                                                    int receptorID = Integer.parseInt(request.getParameter("ReceptorID"));
                                                    MensajesDAO msgdao = new MensajesDAOImpl();
                                                    Integer emisorID = (Integer) session.getAttribute("IdEmpleado");
                                                    List<Mensajes> listamensajes = msgdao.obtenerMensajesDisponibles(emisorID, receptorID);
                                                %>
                                                <div class="modal-body">
                                                    <div class="msg-body">
                                                        <ul>
                                                            <% for (Mensajes msg : listamensajes) { %>
                                                            <% if (msg.getEmisorID() == emisorID) { %>
                                                            <li class="repaly">
                                                                <p><%= msg.getMensaje() %></p>
                                                                <span class="time"><%= msg.getTimestamp() %></span>
                                                            </li>
                                                            <% } else if (msg.getReceptorID() == emisorID) { %>
                                                            <li class="sender">
                                                                <p><%= msg.getMensaje() %></p>
                                                                <span class="time"><%= msg.getTimestamp() %></span>
                                                            </li>
                                                            <% } %>
                                                            <% } %>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="send-box">
                                                    <form action="EnviarMensaje" method="post">
                                                        <input type="hidden" id="EmisorID" value="<%=emisorID%>" name="EmisorID">
                                                        <input type="hidden" id="ReceptorID" value="<%=receptorID%>" name="ReceptorID">
                                                        <input type="text" class="form-control" aria-label="message…" placeholder="Write message…" id="mensaje" name="mensaje">
                                                        <button type="submit"><i class="fa fa-paper-plane" aria-hidden="true"></i>Enviar mensaje</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- chatbox -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

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
        <script src="js/chat.js"></script>
        <script src="js/app.js"></script>
    </body>
</html>