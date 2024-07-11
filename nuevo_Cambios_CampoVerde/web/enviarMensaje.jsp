<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="java.util.List" %>
<%@ page import="DAO.EmpleadoDAO" %>
<%@ page import="modelos.Empleado" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Enviar Mensaje</title>
    </head>
    <body>
        <h2>Enviar Mensaje</h2>
        <form action="MensajeriaServlet" method="post">
            <label for="receptor">Para:</label>
            <select name="receptor" id="receptor">
                <%
                   EmpleadoDAO empleadoDAO = new EmpleadoDAO();
                   List<Empleado> listarEmpleados = empleadoDAO.listarEmpleado();
                   for (Empleado empleado : listarEmpleados) {
                %>
                    <option value="<%= empleado.getNombres() %>"><%= empleado.getNombres() %></option>
                <%
                   }
                %>
            </select>
            <br>
            <label for="contenido">Mensaje:</label>
            <textarea name="contenido" id="contenido" rows="4" cols="50"></textarea>
            <br>
            <input type="submit" value="Enviar">
        </form>
    </body>
</html>
