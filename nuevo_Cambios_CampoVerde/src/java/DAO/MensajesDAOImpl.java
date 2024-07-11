package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelos.Mensajes;
import modelos.ConexionDB;

public class MensajesDAOImpl implements MensajesDAO {

    @Override
    public void enviarMensaje(Mensajes mensaje) throws Exception {
        String sql = "INSERT INTO mensajeria (EmisorID, ReceptorID, mensaje, timestamp) VALUES (?, ?, ?, CURRENT_TIMESTAMP)";
        try (Connection conn = ConexionDB.getInstancia().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, mensaje.getEmisorID());
            ps.setInt(2, mensaje.getReceptorID());
            ps.setString(3, mensaje.getMensaje());
            ps.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            throw new Exception("Error al enviar mensaje", e);
        }
    }

    @Override
    public List<Mensajes> obtenerMensajesDisponibles(int emisorID, int receptorID) throws Exception {
        List<Mensajes> mensajes = new ArrayList<>();
        String sql = "SELECT * FROM mensajeria WHERE (EmisorID = ? AND ReceptorID = ?) OR (EmisorID = ? AND ReceptorID = ?) ORDER BY timestamp";
        try (Connection conn = ConexionDB.getInstancia().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, emisorID);
            ps.setInt(2, receptorID);
            ps.setInt(3, receptorID);
            ps.setInt(4, emisorID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Mensajes mensaje = new Mensajes();
                mensaje.setMensajeID(rs.getInt("MensajeID"));
                mensaje.setEmisorID(rs.getInt("EmisorID"));
                mensaje.setReceptorID(rs.getInt("ReceptorID"));
                mensaje.setMensaje(rs.getString("mensaje"));
                mensaje.setTimestamp(rs.getTimestamp("timestamp"));
                mensajes.add(mensaje);
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new Exception("Error al obtener mensajes disponibles", e);
        }
        return mensajes;
    }
}
