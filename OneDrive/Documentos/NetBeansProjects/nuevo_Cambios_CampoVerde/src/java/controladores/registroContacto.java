package controladores;

import modelos.ConexionDB;
import modelos.Contacto;
import DAO.ContactoDAO;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/registroContacto")
public class registroContacto extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String usuario = (String) request.getSession().getAttribute("nombreUsuario");
        String nombreCompleto = request.getParameter("nombreCompleto");
        String correo = request.getParameter("correo");
        String telefono = request.getParameter("telefono");
        String ciudad = request.getParameter("ciudad");
        String producto = request.getParameter("producto");
        String mensaje = request.getParameter("mensaje");

        // Validación básica de campos no nulos
        if (usuario != null && nombreCompleto != null && correo != null && telefono != null && ciudad != null && producto != null && mensaje != null
                && !usuario.trim().isEmpty() && !nombreCompleto.trim().isEmpty() && !correo.trim().isEmpty() && !telefono.trim().isEmpty()
                && !ciudad.trim().isEmpty() && !producto.trim().isEmpty() && !mensaje.trim().isEmpty()) {
            Connection conn = null;
            try {
                conn = ConexionDB.getInstancia().getConnection();
                ContactoDAO contactoDAO = new ContactoDAO();

                // Crear objeto Contacto
                Contacto contacto = new Contacto();
                contacto.setUsuario(usuario);
                contacto.setNombreCompleto(nombreCompleto);
                contacto.setCorreo(correo);
                contacto.setTelefono(telefono);
                contacto.setCiudad(ciudad);
                contacto.setProducto(producto);
                contacto.setMensaje(mensaje);
                contacto.setFecha(new Timestamp(System.currentTimeMillis()));

                // Guardar el contacto en la base de datos
                contactoDAO.registrarContacto(contacto);

                // Redirigir a una página de éxito o mensaje enviado
                response.sendRedirect("contacto.jsp");
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                request.setAttribute("error", "Error al enviar el mensaje");
                request.getRequestDispatcher("formularioContacto.jsp").forward(request, response);
            } finally {
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        } else {
            request.setAttribute("error", "Todos los campos son obligatorios");
            request.getRequestDispatcher("formularioContacto.jsp").forward(request, response);
        }
    }
}
