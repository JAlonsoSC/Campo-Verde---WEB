package controladores;

import modelos.ConexionDB;
import modelos.Usuario;
import DAO.UsuarioDAO;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/listaUsuario")
public class listaUsuario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        try {
            ConexionDB conexionDB = ConexionDB.getInstancia();
            conn = conexionDB.getConnection();

            UsuarioDAO usuarioDAO = new UsuarioDAO();
            List<Usuario> listaUsuario = usuarioDAO.listaUsuario();

            request.setAttribute("listaUsuario", listaUsuario);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al obtener la lista de usuarios");
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        request.getRequestDispatcher("listaUsuario.jsp").forward(request, response);
    }
}
