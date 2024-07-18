package controladores;

import DAO.MensajesDAO;
import DAO.MensajesDAOImpl;
import modelos.Mensajes;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/EnviarMensaje")
public class EnviarMensaje extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int emisorID = Integer.parseInt(request.getParameter("EmisorID"));
        int receptorID = Integer.parseInt(request.getParameter("ReceptorID"));
        String contenidoMensaje = request.getParameter("mensaje");
        String receptorNombre = request.getParameter("receptorNombre");

        Mensajes mensaje = new Mensajes();
        mensaje.setEmisorID(emisorID);
        mensaje.setReceptorID(receptorID);
        mensaje.setMensaje(contenidoMensaje);

        MensajesDAO mensajesDAO = new MensajesDAOImpl();
        try {
            mensajesDAO.enviarMensaje(mensaje);
            response.sendRedirect("ChatEmpleados.jsp?ReceptorID=" + receptorID + "&receptorNombre=" + receptorNombre);
        } catch (Exception e) {
            throw new ServletException("Error al enviar el mensaje", e);
        }
    }
}
