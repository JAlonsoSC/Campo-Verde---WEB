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

@WebServlet("/registroUsuario")
public class registroUsuario extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String nombreCompleto = request.getParameter("nombreCompleto");
        String apellido = request.getParameter("apellido");
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            ConexionDB conexionDB = ConexionDB.getInstancia();
            conn = conexionDB.getConnection();

            String mysql = "INSERT INTO usuario (nombreCompleto, apellido, correo, contrasena) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(mysql);
            stmt.setString(1, nombreCompleto);
            stmt.setString(2, apellido);
            stmt.setString(3, correo);
            stmt.setString(4, contrasena);
            stmt.executeUpdate();
            request.setAttribute("message", "Usuario registrado exitosamente");

            
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al registrar usuario");
            request.getRequestDispatcher("registro.jsp").forward(request, response);

        } finally {
            ConexionDB.getInstancia().closeConnection(conn);
        }
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}
