package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import modelos.Carrito;
import modelos.ConexionDB;
import modelos.Pedido;
import java.sql.SQLException;
import java.sql.Statement;

public class PedidoDAO {
    Connection con;
    ConexionDB cn = ConexionDB.getInstancia();
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;

    public int GenerarPedido(Pedido pedido) {
        int resultado = 0;
        int idpedido = 0;
        // Inserción del pedido
        String sqlPedido = "INSERT INTO pedido(IDUsuario, fecha_ped, Total, estado) VALUES(?, ?, ?, ?)";
        try {

            con = cn.getConnection();
            ps = con.prepareStatement(sqlPedido, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, pedido.getUsuario().getUserID());
            ps.setString(2, pedido.getFecha());
            ps.setDouble(3, pedido.getMonto());
            ps.setString(4, pedido.getEstado());
            resultado = ps.executeUpdate();

            // Obtener el ID del pedido recién insertado
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                idpedido = rs.getInt(1);
            }
            rs.close();
            String sqlDetalle = "INSERT INTO detalle_pedido(IDPedido, IDProducto, precio, cantidad) VALUES(?, ?, ?, ?)";
            for (Carrito detalle : pedido.getDetalleCompras()) {
                ps = con.prepareStatement(sqlDetalle);
                ps.setInt(1, idpedido);
                ps.setInt(2, detalle.getIdProducto());
                ps.setDouble(3, detalle.getPrecioDeCompra());
                ps.setInt(4, detalle.getCantidad());
                resultado = ps.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return resultado;
    }

}