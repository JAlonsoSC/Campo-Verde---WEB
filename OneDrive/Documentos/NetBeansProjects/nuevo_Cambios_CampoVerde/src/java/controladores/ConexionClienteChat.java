package controladores;

import modelos.ConexionDB;
import modelos.MensajeChat;
import DAO.MensajeChatDAO;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ConexionClienteChat")
public class ConexionClienteChat extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idTemaStr = request.getParameter("idTema");
        String mensaje = request.getParameter("mensaje");
        String usuario = (String) request.getSession().getAttribute("nombreUsuario"); // Obtener nombre del usuario autenticado

        if (idTemaStr != null && mensaje != null && !mensaje.trim().isEmpty()) {
            int idTema = Integer.parseInt(idTemaStr);
            Connection conn = null;
            try {
                conn = ConexionDB.getInstancia().getConnection();
                MensajeChat mensajeChat = new MensajeChat();
                mensajeChat.setIdTema(idTema);
                mensajeChat.setUsuario(usuario);
                mensajeChat.setMensaje(mensaje);

                MensajeChatDAO mensajeChatDAO = new MensajeChatDAO();
                mensajeChatDAO.guardarMensaje(mensajeChat);

                response.sendRedirect("detalleTema.jsp?id=" + idTema);
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                request.setAttribute("error", "Error al enviar el mensaje");
                request.getRequestDispatcher("detalleTema.jsp?id=" + idTema).forward(request, response);
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
            request.setAttribute("error", "El mensaje no puede estar vacío");
            request.getRequestDispatcher("detalleTema.jsp?id=" + idTemaStr).forward(request, response);
        }
    }
}
