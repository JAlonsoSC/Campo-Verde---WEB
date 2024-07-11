package controladores;

import modelos.ConexionDB;
import modelos.Tema;
import DAO.TemaDAO;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CrearTema")
public class CrearTema extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        String eliminar = request.getParameter("eliminarTema");
        
        if ("Eliminar".equals(accion) && eliminar != null) {
            int id = Integer.parseInt(eliminar);
            TemaDAO temaDAO = new TemaDAO();
            boolean eliminado = temaDAO.eliminarTema(id);
            if (eliminado) {
                response.sendRedirect("foro.jsp");
            } else {
                request.setAttribute("error", "Error al eliminar el tema");
                request.getRequestDispatcher("foro.jsp").forward(request, response);
            }
            return;
        }
        
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no válida");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Verificar si el empleado ha iniciado sesión
        String empleado = (String) request.getSession().getAttribute("empleado");
        if (empleado == null) {
            // Si no hay empleado en sesión, redirigir a la página de inicio de sesión
            request.setAttribute("error", "Solo los empleados pueden crear temas. Inicia sesión como empleado.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // Procesar la creación del tema
        String titulo = request.getParameter("tituloTema");

        if (titulo != null && !titulo.trim().isEmpty()) {
            Connection conn = null;
            try {
                ConexionDB conexionDB = ConexionDB.getInstancia();
                conn = conexionDB.getConnection();

                Tema tema = new Tema();
                tema.setTitulo(titulo);

                TemaDAO temaDAO = new TemaDAO();
                temaDAO.crearTema(tema);

            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                request.setAttribute("error", "Error al crear el tema");
                request.getRequestDispatcher("foro.jsp").forward(request, response);
                return;
            } finally {
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }

            response.sendRedirect("foro.jsp");
        } else {
            request.setAttribute("error", "El título del tema no puede estar vacío");
            request.getRequestDispatcher("foro.jsp").forward(request, response);
        }
    }
}

