package controladores;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelos.Empleado;
import DAO.EmpleadoDAO;

@WebServlet("/controlador")
public class controlador extends HttpServlet {

    Empleado empleado = new Empleado();
    EmpleadoDAO empleadoDAO = new EmpleadoDAO();
    int ide;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");

        switch (accion) {
            case "listarEmpleado":
                List lista = empleadoDAO.listarEmpleado();
                request.setAttribute("listarEmpleado", lista);
                break;
            case "Agregar":
                String dni = request.getParameter("Dni");
                String nombres = request.getParameter("Nombres");
                String telefono = request.getParameter("Telefono");
                String correo = request.getParameter("Correo");
                String cargo = request.getParameter("Cargo");
                String area = request.getParameter("Area");
                String user = request.getParameter("User");
                String contrasena = request.getParameter("Contrasena");
                String estado = request.getParameter("Estado");
                empleado.setDni(dni);
                empleado.setNombres(nombres);
                empleado.setTelefono(telefono);
                empleado.setCorreo(correo);
                empleado.setCargo(cargo);
                empleado.setArea(area);
                empleado.setUser(user);
                empleado.setContrasena(contrasena);
                empleado.setEstado(estado);
                empleadoDAO.agregarEmpleado(empleado);
                break;
            case "Actualizar":
                ide = Integer.parseInt(request.getParameter("IdEmpleado"));
                String dni1 = request.getParameter("Dni");
                String nombres1 = request.getParameter("Nombres");
                String telefono1 = request.getParameter("Telefono");
                String correo1 = request.getParameter("Correo");
                String cargo1 = request.getParameter("Cargo");
                String area1 = request.getParameter("Area");
                String user1 = request.getParameter("User");
                String contrasena1 = request.getParameter("Contrasena");
                String estado1 = request.getParameter("Estado");
                empleado.setDni(dni1);
                empleado.setNombres(nombres1);
                empleado.setTelefono(telefono1);
                empleado.setCorreo(correo1);
                empleado.setCargo(cargo1);
                empleado.setArea(area1);
                empleado.setUser(user1);
                empleado.setContrasena(contrasena1);
                empleado.setEstado(estado1);
                empleado.setIdEmpleado(ide);
                empleadoDAO.actualizarEmpleado(empleado);
                break;
           /* case "Inhabilitar":
                ide = Integer.parseInt(request.getParameter("IdEmpleado"));
                empleadoDAO.inhabilitarEmpleado(ide);
                break;*/
            case "Eliminar":
                ide = Integer.parseInt(request.getParameter("IdEmpleado"));
                empleadoDAO.eliminarEmpleado(ide);
                break;
            default:
                throw new AssertionError();
        }

        request.getRequestDispatcher("Empleado_lista.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}