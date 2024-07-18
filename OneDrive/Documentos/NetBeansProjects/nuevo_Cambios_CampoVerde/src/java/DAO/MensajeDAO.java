package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import modelos.Mensaje;
import modelos.ConexionDB;

public class MensajeDAO {

    private static final String INSERT_MENSAJE_SQL = "INSERT INTO mensajeria (EmisorID, ReceptorID, Contenido, Fecha) VALUES (?, ?, ?, ?)";
    private static final String SELECT_MENSAJES_BY_RECEPTOR = "SELECT * FROM mensajeria WHERE ReceptorID = ?";
    private static final String SELECT_MENSAJES_BY_EMISOR = "SELECT * FROM mensajeria WHERE EmisorID = ?";

    public void insertarMensaje(Mensaje mensaje) {
        Connection connection = null;
        try {
            connection = ConexionDB.getInstancia().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_MENSAJE_SQL);
            preparedStatement.setInt(1, mensaje.getEmisorID());
            preparedStatement.setInt(2, mensaje.getReceptorID());
            preparedStatement.setString(3, mensaje.getContenido());
            preparedStatement.setTimestamp(4, mensaje.getFecha());
            preparedStatement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            ConexionDB.getInstancia().closeConnection(connection);
        }
    }

    public List<Mensaje> listarMensajesPorReceptor(int receptorID) {
        List<Mensaje> mensajes = new ArrayList<>();
        Connection connection = null;
        try {
            connection = ConexionDB.getInstancia().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MENSAJES_BY_RECEPTOR);
            preparedStatement.setInt(1, receptorID);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int mensajeID = rs.getInt("MensajeID");
                int emisorID = rs.getInt("EmisorID");
                String contenido = rs.getString("Contenido");
                Timestamp fecha = rs.getTimestamp("Fecha");
                Mensaje mensaje = new Mensaje(mensajeID, emisorID, receptorID, contenido, fecha);
                mensajes.add(mensaje);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            ConexionDB.getInstancia().closeConnection(connection);
        }
        return mensajes;
    }
}