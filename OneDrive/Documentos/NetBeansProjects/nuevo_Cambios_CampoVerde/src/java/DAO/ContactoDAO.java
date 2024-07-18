package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelos.ConexionDB;
import modelos.Contacto;

public class ContactoDAO {

    public List<Contacto> listaContacto() throws SQLException, ClassNotFoundException {
        List<Contacto> listaContacto = new ArrayList<>();

        String sql = "SELECT * FROM contacto";

        try (Connection conn = ConexionDB.getInstancia().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Contacto contacto = new Contacto();
                contacto.setIdContacto(rs.getInt("idContacto"));
                contacto.setNombreCompleto(rs.getString("nombreCompleto"));
                contacto.setUsuario(rs.getString("usuario"));
                contacto.setCorreo(rs.getString("correo"));
                contacto.setTelefono(rs.getString("telefono"));
                contacto.setCiudad(rs.getString("ciudad"));
                contacto.setProducto(rs.getString("producto"));
                contacto.setMensaje(rs.getString("mensaje"));
                contacto.setFecha(rs.getTimestamp("fecha"));
                listaContacto.add(contacto);
            }
        }

        return listaContacto;
    }

    public void registrarContacto(Contacto contacto) throws SQLException {
        String sql = "INSERT INTO contacto (usuario, nombreCompleto, correo, telefono, ciudad, producto, mensaje, fecha) VALUES (?, ?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP)";

        try (Connection conn = ConexionDB.getInstancia().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, contacto.getUsuario());
            stmt.setString(2, contacto.getNombreCompleto());
            stmt.setString(3, contacto.getCorreo());
            stmt.setString(4, contacto.getTelefono());
            stmt.setString(5, contacto.getCiudad());
            stmt.setString(6, contacto.getProducto());
            stmt.setString(7, contacto.getMensaje());

            stmt.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error al registrar el contacto en la base de datos");
        }
    }
}
