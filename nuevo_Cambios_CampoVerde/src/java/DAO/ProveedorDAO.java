package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelos.ConexionDB;
import modelos.Proveedor;

public class ProveedorDAO {

    public List<Proveedor> listaProveedor() throws SQLException, ClassNotFoundException {
        List<Proveedor> listaProveedor = new ArrayList<>();
        
        String sql = "SELECT * FROM proveedor";
        
        try (Connection conn = ConexionDB.getInstancia().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Proveedor proveedor = new Proveedor();
                proveedor.setIDproveedor(rs.getInt("IDproveedor"));
                proveedor.setnombre(rs.getString("nombre"));
                proveedor.setnombreEmpresa(rs.getString("nombreEmpresa"));
                proveedor.setruc(rs.getString("ruc"));
                proveedor.settelefono(rs.getString("telefono"));
                listaProveedor.add(proveedor);
            }
        }

        return listaProveedor;
    }

    public void insertarProveedor(Proveedor proveedor) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

}
