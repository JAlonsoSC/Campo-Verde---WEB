package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelos.ConexionDB;
import modelos.Empleado;

public class EmpleadoDAO {

    public List<Empleado> listarEmpleado() {
        List<Empleado> listaEmpleados = new ArrayList<>();
        String sql = "SELECT * FROM empleado";
        try (Connection conn = ConexionDB.getInstancia().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Empleado empleado = new Empleado();
                empleado.setIdEmpleado(rs.getInt("IdEmpleado"));
                empleado.setDni(rs.getString("Dni"));
                empleado.setNombres(rs.getString("Nombres"));
                empleado.setTelefono(rs.getString("Telefono"));
                empleado.setCorreo(rs.getString("Correo"));
                empleado.setCargo(rs.getString("Cargo"));
                empleado.setArea(rs.getString("Area"));
                empleado.setUser(rs.getString("User"));
                empleado.setContrasena(rs.getString("Contrasena"));
                empleado.setEstado(rs.getString("Estado"));
                listaEmpleados.add(empleado);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return listaEmpleados;
    }

    public boolean agregarEmpleado(Empleado empleado) {
        String sql = "INSERT INTO empleado (Dni, Nombres, Telefono, Correo, Cargo, Area, User, Contrasena, estado) VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'habilitado')";
        try (Connection conn = ConexionDB.getInstancia().getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, empleado.getDni());
            stmt.setString(2, empleado.getNombres());
            stmt.setString(3, empleado.getTelefono());
            stmt.setString(4, empleado.getCorreo());
            stmt.setString(5, empleado.getCargo());
            stmt.setString(6, empleado.getArea());
            stmt.setString(7, empleado.getUser());
            stmt.setString(8, empleado.getContrasena());
            stmt.executeUpdate();
            return true;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Empleado listarIdEmpleado(int id) {
        Empleado empleado = new Empleado();
        String sql = "SELECT * FROM empleado WHERE IdEmpleado = ?";
        try (Connection conn = ConexionDB.getInstancia().getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    empleado.setIdEmpleado(rs.getInt("IdEmpleado"));
                    empleado.setDni(rs.getString("Dni"));
                    empleado.setNombres(rs.getString("Nombres"));
                    empleado.setTelefono(rs.getString("Telefono"));
                    empleado.setCorreo(rs.getString("Correo"));
                    empleado.setCargo(rs.getString("Cargo"));
                    empleado.setArea(rs.getString("Area"));
                    empleado.setUser(rs.getString("User"));
                    empleado.setContrasena(rs.getString("Contrasena"));
                    empleado.setEstado(rs.getString("estado"));
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return empleado;
    }

    public boolean actualizarEmpleado(Empleado empleado) {
        String sql = "UPDATE empleado SET Dni = ?, Nombres = ?, Telefono = ?, Correo = ?, Cargo = ?, Area = ?, User = ?, Contrasena = ?, estado = ? WHERE IdEmpleado = ?";
        try (Connection conn = ConexionDB.getInstancia().getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, empleado.getDni());
            stmt.setString(2, empleado.getNombres());
            stmt.setString(3, empleado.getTelefono());
            stmt.setString(4, empleado.getCorreo());
            stmt.setString(5, empleado.getCargo());
            stmt.setString(6, empleado.getArea());
            stmt.setString(7, empleado.getUser());
            stmt.setString(8, empleado.getContrasena());
            stmt.setString(9, empleado.getEstado());
            stmt.setInt(10, empleado.getIdEmpleado());
            stmt.executeUpdate();
            return true;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean eliminarEmpleado(int id) {
        String sql = "DELETE FROM empleado WHERE IdEmpleado = ?";
        try (Connection conn = ConexionDB.getInstancia().getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
            return true;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }
}
