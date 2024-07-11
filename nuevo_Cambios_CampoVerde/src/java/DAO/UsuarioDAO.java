package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelos.ConexionDB;
import modelos.Usuario;

public class UsuarioDAO {

    public List<Usuario> listaUsuario() throws SQLException, ClassNotFoundException {
        List<Usuario> ListaUsuario = new ArrayList<>();
        
        String sql = "SELECT * FROM usuario";
        
        try (Connection conn = ConexionDB.getInstancia().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setUserID(rs.getInt("UserID"));
                usuario.setnombreCompleto(rs.getString("nombreCompleto"));
                usuario.setapellido(rs.getString("apellido"));
                usuario.setcorreo(rs.getString("correo"));
                usuario.setcontrasena(rs.getString("contrasena"));
                ListaUsuario.add(usuario);
            }
        }

        return ListaUsuario;
    }
}
