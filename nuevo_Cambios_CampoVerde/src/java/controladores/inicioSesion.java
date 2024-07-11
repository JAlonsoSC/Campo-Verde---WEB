package controladores;

import modelos.ConexionDB;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/inicioSesion")
public class inicioSesion extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String correo = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");

        // Validar las credenciales del usuario normal
        if (validarCredencialesUsuario(correo, contrasena)) {
            // Obtener y establecer el nombre completo del usuario en la sesión
            String nombreUsuario = obtenerNombreUsuario(correo);
            request.getSession().setAttribute("usuario", correo);
            request.getSession().setAttribute("nombreUsuario", nombreUsuario);
            response.sendRedirect("index.jsp");
        } else {
            // Validar las credenciales del empleado
            String cargo = obtenerCargoEmpleado(correo, contrasena);
            int IdEmpleado = obtenerIdEmpleado(correo, contrasena);
            if (cargo != null) {
                // Verificar el estado del empleado
                String estadoEmpleado = obtenerEstadoEmpleado(correo, contrasena);
                if ("habilitado".equals(estadoEmpleado)) {
                    request.getSession().setAttribute("empleado", correo);
                    String nombre = obtenerNombreEmpleado(correo, contrasena);
                    request.getSession().setAttribute("IdEmpleado", IdEmpleado);
                    request.getSession().setAttribute("nombre", nombre);
                    if ("Administrador".equals(cargo)) {
                        response.sendRedirect("principal.jsp");
                    } else {
                        response.sendRedirect("principalEmpleado.jsp");
                    }
                } else {
                    request.setAttribute("error", "El empleado está inhabilitado para iniciar sesión.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "Usuario o contraseña incorrectos");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }
    }

    private boolean validarCredencialesUsuario(String correo, String contrasena) {
        try (Connection conn = ConexionDB.getInstancia().getConnection(); PreparedStatement stmt = conn.prepareStatement("SELECT * FROM usuario WHERE correo = ? AND contrasena = ?")) {

            stmt.setString(1, correo);
            stmt.setString(2, contrasena);

            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    private String obtenerCargoEmpleado(String usuario, String contrasena) {
        try (Connection conn = ConexionDB.getInstancia().getConnection(); PreparedStatement stmt = conn.prepareStatement("SELECT Cargo FROM empleado WHERE User = ? AND Contrasena = ?")) {

            stmt.setString(1, usuario);
            stmt.setString(2, contrasena);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("Cargo");
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    private String obtenerNombreEmpleado(String usuario, String contrasena) {
        String nombre = "";
        try (Connection conn = ConexionDB.getInstancia().getConnection(); PreparedStatement stmt = conn.prepareStatement("SELECT Nombres FROM empleado WHERE User = ? AND Contrasena = ?")) {

            stmt.setString(1, usuario);
            stmt.setString(2, contrasena);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    nombre = rs.getString("Nombres");
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return nombre;
    }

    private int obtenerIdEmpleado(String usuario, String contrasena) {
        int IdEmpleado = 0;
        try (Connection conn = ConexionDB.getInstancia().getConnection(); PreparedStatement stmt = conn.prepareStatement("SELECT IdEmpleado FROM empleado WHERE User = ? AND Contrasena = ?")) {

            stmt.setString(1, usuario);
            stmt.setString(2, contrasena);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    IdEmpleado = rs.getInt("IdEmpleado");
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return IdEmpleado;
    }

    private String obtenerNombreUsuario(String correo) {
        String nombreUsuario = "";
        try (Connection conn = ConexionDB.getInstancia().getConnection(); PreparedStatement stmt = conn.prepareStatement("SELECT nombreCompleto FROM usuario WHERE correo = ?")) {

            stmt.setString(1, correo);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    nombreUsuario = rs.getString("nombreCompleto");
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return nombreUsuario;
    }

    private String obtenerEstadoEmpleado(String usuario, String contrasena) {
        try (Connection conn = ConexionDB.getInstancia().getConnection(); PreparedStatement stmt = conn.prepareStatement("SELECT Estado FROM empleado WHERE User = ? AND Contrasena = ?")) {

            stmt.setString(1, usuario);
            stmt.setString(2, contrasena);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("Estado");
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }
}
