package DAO;

import modelos.ConexionDB;
import modelos.MensajeChat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MensajeChatDAO {

    private static final String INSERT_SQL = "INSERT INTO mensajeschat (idTema, usuario, mensaje, timestamp) VALUES (?, ?, ?, CURRENT_TIMESTAMP)";
    private static final String SELECT_BY_TEMA_SQL = "SELECT * FROM mensajeschat WHERE idTema = ? ORDER BY timestamp";

    public void guardarMensaje(MensajeChat mensajeChat) {
        try (Connection conn = ConexionDB.getInstancia().getConnection(); PreparedStatement stmt = conn.prepareStatement(INSERT_SQL)) {

            stmt.setInt(1, mensajeChat.getIdTema());
            stmt.setString(2, mensajeChat.getUsuario());
            stmt.setString(3, mensajeChat.getMensaje());

            stmt.executeUpdate();

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            // Manejar el error adecuadamente
        }
    }

    public List<MensajeChat> obtenerMensajesPorTema(int idTema) {
        List<MensajeChat> mensajes = new ArrayList<>();
        try (Connection conn = ConexionDB.getInstancia().getConnection(); PreparedStatement stmt = conn.prepareStatement(SELECT_BY_TEMA_SQL)) {

            stmt.setInt(1, idTema);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    MensajeChat mensaje = new MensajeChat();
                    mensaje.setIdMensaje(rs.getInt("idMensaje"));
                    mensaje.setIdTema(rs.getInt("idTema"));
                    mensaje.setUsuario(rs.getString("usuario"));
                    mensaje.setMensaje(rs.getString("mensaje"));
                    mensaje.setTimestamp(rs.getTimestamp("timestamp").toLocalDateTime());
                    
                    mensajes.add(mensaje);
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            // Manejar el error adecuadamente
        }
        return mensajes;
    }
}
