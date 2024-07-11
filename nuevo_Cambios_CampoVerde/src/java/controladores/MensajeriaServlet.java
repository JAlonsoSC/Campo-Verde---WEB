package controladores;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import DAO.MensajeDAO;
import modelos.Mensaje;
import modelos.Empleado;

@WebServlet("/MensajeriaServlet")
public class MensajeriaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MensajeDAO mensajeDAO;

    @Override
    public void init() {
        mensajeDAO = new MensajeDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Empleado emisor = (Empleado) session.getAttribute("empleado");

        int emisorID = emisor.getIdEmpleado();
        int receptorID = Integer.parseInt(request.getParameter("receptor"));
        String contenido = request.getParameter("contenido");
        Timestamp fecha = new Timestamp(System.currentTimeMillis());

        Mensaje mensaje = new Mensaje();
        mensaje.setEmisorID(emisorID);
        mensaje.setReceptorID(receptorID);
        mensaje.setContenido(contenido);
        mensaje.setFecha(fecha);

        mensajeDAO.insertarMensaje(mensaje);

        response.sendRedirect("ChatEmpleados.jsp?receptor=" + receptorID);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int receptorID = Integer.parseInt(request.getParameter("receptor"));
        List<Mensaje> mensajes = mensajeDAO.listarMensajesPorReceptor(receptorID);

        request.setAttribute("mensajes", mensajes);
        request.getRequestDispatcher("ChatEmpleados.jsp").forward(request, response);
    }
}