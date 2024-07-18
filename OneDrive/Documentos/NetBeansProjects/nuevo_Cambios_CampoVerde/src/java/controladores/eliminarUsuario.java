package controladores;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import modelos.ConexionDB;

@WebServlet("/eliminarUsuario")
public class eliminarUsuario extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener el ID del usuario seleccionado desde el formulario
        int userId = Integer.parseInt(request.getParameter("userId"));

        // Conexión a la base de datos
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = ConexionDB.getInstancia().getConnection();

            // Consulta para eliminar el usuario en la base de datos
            String sql = "DELETE FROM usuarios WHERE id=?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);

            // Ejecutar la consulta
            int rowsAffected = stmt.executeUpdate();

            // Verificar si se eliminó correctamente
            if (rowsAffected > 0) {
                // Redirigir a la página principal
                response.sendRedirect("principal.jsp");
            } else {
                // Si no se encontró el usuario, podrías redirigir a una página de error o mostrar un mensaje al usuario
                response.sendRedirect("error.jsp");
            }
        } catch (SQLException | ClassNotFoundException e) {
            // Manejar cualquier excepción de base de datos o clase no encontrada
            e.printStackTrace();
            // Redirigir a una página de error
            response.sendRedirect("error.jsp");
        } finally {
            // Cerrar recursos
            ConexionDB.getInstancia().closeConnection(conn);
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
