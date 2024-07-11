package controladores;

import DAO.ContactoDAO;
import modelos.ConexionDB;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelos.Contacto;

@WebServlet("/listaContacto")
public class listaContacto extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        try {
            ConexionDB conexionDB = ConexionDB.getInstancia();
            conn = conexionDB.getConnection();

            ContactoDAO contactoDAO = new ContactoDAO();
            List<Contacto> listaContacto = contactoDAO.listaContacto();

            request.setAttribute("listaUsuario", listaContacto);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al obtener la lista de contacto");
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        request.getRequestDispatcher("listaContacto.jsp").forward(request, response);
    }
}
