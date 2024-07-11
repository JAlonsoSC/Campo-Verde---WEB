package controladores;

import DAO.EmpleadoDAO;
import DAO.MensajeDAO;
import modelos.ConexionDB;
import modelos.Mensaje;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/MensajeServlet")
public class MensajeServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String emisorID = (String) request.getSession().getAttribute("empleado");
        String receptorID = request.getParameter("receptor");
        String contenido = request.getParameter("contenido");

        if (emisorID != null && receptorID != null && contenido != null) {
            enviarMensaje(emisorID, receptorID, contenido);
            response.sendRedirect("verMensajes.jsp");
        } else {
            response.sendRedirect("enviarMensaje.jsp?error=Falta información");
        }
    }

    private void enviarMensaje(String emisorID, String receptorID, String contenido) {
        try {
            int emisorIdInt = Integer.parseInt(emisorID);
            int receptorIdInt = Integer.parseInt(receptorID);

            // Aquí se debería enviar el mensaje al WebSocket para que lo procese y lo almacene en la base de datos
            // Puedes llamar a un método estático en tu clase de WebSocket o utilizar un cliente WebSocket para enviar el mensaje

            // Ejemplo de cómo almacenar el mensaje en la base de datos usando el DAO de Mensaje
            MensajeDAO mensajeDAO = new MensajeDAO();
            Mensaje mensaje = new Mensaje();
            mensaje.setEmisorID(emisorIdInt);
            mensaje.setReceptorID(receptorIdInt);
            mensaje.setContenido(contenido);

        } catch (NumberFormatException e) {
            e.printStackTrace();
            // Manejo de la excepción si emisorID o receptorID no son números válidos
            // Aquí podrías redirigir a una página de error o mostrar un mensaje al usuario
        }
    }
}
