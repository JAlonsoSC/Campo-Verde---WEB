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

        String nombre = request.getParameter("nombre");
        String nombreEmpresa = request.getParameter("nombreEmpresa");
        String ruc = request.getParameter("ruc");
        String telefono = request.getParameter("telefono");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            
            ConexionDB conexionDB = ConexionDB.getInstancia();
            conn = conexionDB.getConnection();

            String mysql = "INSERT INTO proveedor (nombre, nombreEmpresa, ruc, telefono) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(mysql);
            stmt.setString(1, nombre);
            stmt.setString(2, nombreEmpresa);
            stmt.setString(3, ruc);
            stmt.setString(4, telefono);
            stmt.executeUpdate();
            request.setAttribute("message", "Proveedor registrado exitosamente");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al registrar proveedor");
            request.getRequestDispatcher("error.jsp").forward(request, response);

        } finally {

            ConexionDB.getInstancia().closeConnection(conn);
        }
        request.getRequestDispatcher("proveedor.jsp").forward(request, response);
    }
}
