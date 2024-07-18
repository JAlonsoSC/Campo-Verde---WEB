package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelos.ConexionDB;
import modelos.Tema;

public class TemaDAO {

    private static final String INSERT_SQL = "INSERT INTO tema (titulo) VALUES (?)";
    private static final String SELECT_ALL_SQL = "SELECT id, titulo FROM tema";

    public void crearTema(Tema tema) {
        try (Connection conn = ConexionDB.getInstancia().getConnection(); PreparedStatement stmt = conn.prepareStatement(INSERT_SQL)) {

            stmt.setString(1, tema.getTitulo());
            stmt.executeUpdate();

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public List<Tema> obtenerTemas() {
        List<Tema> temas = new ArrayList<>();
        try (Connection conn = ConexionDB.getInstancia().getConnection(); PreparedStatement stmt = conn.prepareStatement(SELECT_ALL_SQL); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Tema tema = new Tema();
                tema.setId(rs.getInt("id"));
                tema.setTitulo(rs.getString("titulo"));
                temas.add(tema);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return temas;
    }

    public Tema obtenerTemaPorId(int id) {
        Tema tema = null;
        String sql = "SELECT id, titulo FROM tema WHERE id = ?";
        Connection conn = null;
        try {
            conn = ConexionDB.getInstancia().getConnection();
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, id);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        tema = new Tema();
                        tema.setId(rs.getInt("id"));
                        tema.setTitulo(rs.getString("titulo"));
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            ConexionDB.getInstancia().closeConnection(conn);
        }
        return tema;
    }
    public boolean eliminarTema(int id) {
        String sql = "DELETE FROM tema WHERE id = ?";
        try (Connection conn = ConexionDB.getInstancia().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
            return true;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

}
