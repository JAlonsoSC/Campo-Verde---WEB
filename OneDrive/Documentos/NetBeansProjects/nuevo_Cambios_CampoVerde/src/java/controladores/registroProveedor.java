package controladores;

import modelos.ConexionDB;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/registroProveedor")
public class registroProveedor extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String usuario = (String) request.getSession().getAttribute("nombreUsuario"); // Obtener nombre del usuario autenticado
        String nombre = request.getParameter("nombre");
        String nombreEmpresa = request.getParameter("nombreEmpresa");
        String ruc = request.getParameter("ruc");
        String telefono = request.getParameter("telefono");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Obtener la conexión a la base de datos
            ConexionDB conexionDB = ConexionDB.getInstancia();
            conn = conexionDB.getConnection();

            // Preparar la sentencia SQL
            String sql = "INSERT INTO proveedor (usuario, nombre, nombreEmpresa, ruc, telefono) VALUES (?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, usuario);
            stmt.setString(2, nombre);
            stmt.setString(3, nombreEmpresa);
            stmt.setString(4, ruc);
            stmt.setString(5, telefono);

            // Ejecutar la sentencia SQL
            stmt.executeUpdate();

            // Establecer mensaje de éxito
            request.setAttribute("message", "Proveedor registrado exitosamente");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al registrar proveedor");
            request.getRequestDispatcher("proveedor.jsp").forward(request, response);

        } finally {
            // Cerrar la conexión
            ConexionDB.getInstancia().closeConnection(conn);
        }

        // Redireccionar a la página de proveedor después de manejar la solicitud
        request.getRequestDispatcher("proveedor.jsp").forward(request, response);
    }
}
