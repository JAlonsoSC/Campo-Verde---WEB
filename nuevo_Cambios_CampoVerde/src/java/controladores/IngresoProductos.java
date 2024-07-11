/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import DAO.ProductoDAO;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelos.Producto;

@MultipartConfig
@WebServlet(name = "IngresoProductos", urlPatterns = {"/IngresoProductos"})
public class IngresoProductos extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     String nombres = request.getParameter("nombre");
    String categoriaStr = request.getParameter("categoria");
    Part filePart = request.getPart("foto");
    InputStream foto = null;
    if (filePart != null) {
        foto = filePart.getInputStream();
    }
    String descripcion = request.getParameter("descripcion");
    String precioStr = request.getParameter("precio");
    String stockStr = request.getParameter("stock");

    int categoria = 0;
    double precio = 0.0;
    int stock = 0;

    if (categoriaStr != null && !categoriaStr.trim().isEmpty()) {
        try {
            categoria = Integer.parseInt(categoriaStr.trim());
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }

    if (precioStr != null && !precioStr.trim().isEmpty()) {
        try {
            precio = Double.parseDouble(precioStr.trim());
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }

    if (stockStr != null && !stockStr.trim().isEmpty()) {
        try {
            stock = Integer.parseInt(stockStr.trim());
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }

    Producto producto = new Producto();
    producto.setNombres(nombres);
    producto.setCategoria(categoria);
    producto.setFoto(foto);
    producto.setDescripcion(descripcion);
    producto.setPrecio(precio);
    producto.setStock(stock);

    ProductoDAO productoDAO = new ProductoDAO();
        try {
            productoDAO.agregarProducto(producto);
        } catch (SQLException ex) {
            Logger.getLogger(IngresoProductos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(IngresoProductos.class.getName()).log(Level.SEVERE, null, ex);
        }

    response.sendRedirect("principalEmpleado.jsp");
    }
    

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}