package DAO;

import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import modelos.ConexionDB;
import modelos.Producto;
import java.sql.SQLException;

public class ProductoDAO {

    Connection con;
    ConexionDB cn = ConexionDB.getInstancia();
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public List<Producto> listaProductos() throws SQLException, ClassNotFoundException {
        List<Producto> listaProductos = new ArrayList<>();

        String sql = "SELECT * FROM productos";

        try (Connection conn = ConexionDB.getInstancia().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Producto producto = new Producto();
                producto.setId(rs.getInt("ProductoID"));
                producto.setNombres(rs.getString("Nombre"));
                producto.setCategoria(rs.getInt("Categoria"));
                producto.setDescripcion(rs.getString("Descripcion"));
                producto.setPrecio(rs.getInt("Precio"));
                producto.setFoto(rs.getBinaryStream("Foto"));
                producto.setStock(rs.getInt("Disponibilidad"));
                listaProductos.add(producto);
            }
        }

        return listaProductos;
    }

    public List listar(int categoriaId) {
        List<Producto> productos = new ArrayList();
        String sql = "select * from productos where Categoria = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, categoriaId);
            rs = ps.executeQuery();

            while (rs.next()) {
                Producto p = new Producto();
                p.setId(rs.getInt(1));
                p.setNombres(rs.getString(2));
                p.setCategoria(rs.getInt(3));
                p.setDescripcion(rs.getString(4));
                p.setPrecio(rs.getDouble(5));
                p.setFoto(rs.getBinaryStream(6));
                p.setStock(rs.getInt(7));
                productos.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return productos;
    }

    public boolean agregarProducto(Producto producto) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO productos (Nombre, Categoria, Descripcion, Precio, Foto, Disponibilidad) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = ConexionDB.getInstancia().getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {

            ps.setString(1, producto.getNombres());
            ps.setInt(2, producto.getCategoria());
            ps.setString(3, producto.getDescripcion());
            ps.setDouble(4, producto.getPrecio());
            ps.setBlob(5, producto.getFoto());
            ps.setInt(6, producto.getStock());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean eliminarProducto(int idp) {
        String sql = "DELETE FROM productos WHERE ProductoID = ?";
        try (Connection conn = ConexionDB.getInstancia().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idp);
            stmt.executeUpdate();
            return true;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void listarImg(int id, HttpServletResponse response) {
        String sql = "select*from productos where ProductoID =" + id;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;

        try {
            outputStream = response.getOutputStream();
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                inputStream = rs.getBinaryStream("Foto");
            }

            bufferedInputStream = new BufferedInputStream(inputStream);
            bufferedOutputStream = new BufferedOutputStream(outputStream);

            int i = 0;

            while ((i = bufferedInputStream.read()) != -1) {
                bufferedOutputStream.write(i);
            }
        } catch (Exception e) {

        }

    }

    public boolean actualizarProducto(Producto producto) {
        String sql = "UPDATE producto SET Nombre = ?, Categoria = ?, Descripcion = ?, Precio = ?, Foto = ?, Disponibilidad = ? WHERE ProductoID = ?";
        try (Connection conn = ConexionDB.getInstancia().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, producto.getNombres());
            stmt.setInt(2, producto.getCategoria());
            stmt.setString(3, producto.getDescripcion());
            stmt.setDouble(4, producto.getPrecio());
            stmt.setBlob(5, producto.getFoto());
            stmt.setInt(6, producto.getStock());

            stmt.executeUpdate();
            return true;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Producto listarPorID(int id) {
        String sql = "select*from productos where ProductoID=" + id;
        Producto p = new Producto();

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                p.setId(rs.getInt(1));
                p.setNombres(rs.getString(2));
                p.setCategoria(rs.getInt(3));
                p.setDescripcion(rs.getString(4));
                p.setPrecio(rs.getDouble(5));
                p.setFoto(rs.getBinaryStream(6));
                p.setStock(rs.getInt(7));

            }
        } catch (Exception e) {

        }
        return p;
    }

    public int actualizarStock(int id, int stock) {
        String sql = "update productos set Disponibilidad=? where ProductoID=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, stock);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {

        }
        return r;
    }
}
