package controladores;

import DAO.PedidoDAO;
import DAO.ProductoDAO;
import modelos.Fecha;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.sql.SQLException;
import java.util.List;
import modelos.Carrito;
import modelos.Pedido;
import modelos.Producto;
import modelos.Usuario;

@MultipartConfig(maxFileSize = 16177215) // 16MB
@WebServlet(name = "controllerProducto", urlPatterns = {"/controllerProducto"})
public class controllerProducto extends HttpServlet {

    ProductoDAO pdao = new ProductoDAO();
    Producto p = new Producto();
    List<Producto> productos = new ArrayList<>();

    List<Carrito> listarCarrito = new ArrayList<>();
    int item;
    double totalPago = 0.0;
    int cantidad = 1;
    Carrito car;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        switch (accion) {
            case "Comprar":
                int idp = Integer.parseInt(request.getParameter("id"));
                p = pdao.listarPorID(idp);
                item = item + 1;
                Carrito carr = new Carrito();
                carr.setItem(item);
                carr.setIdProducto(p.getId());
                carr.setNombre(p.getNombres());
                carr.setDescripcion(p.getDescripcion());
                carr.setPrecioDeCompra(p.getPrecio());
                carr.setCantidad(cantidad);
                carr.setSubtotal(cantidad * p.getPrecio());
                listarCarrito.add(carr);

                for (int i = 0; i < listarCarrito.size(); i++) {
                    totalPago = totalPago + listarCarrito.get(i).getSubtotal();
                }
                request.setAttribute("totalPagar", totalPago);
                request.setAttribute("carrito", listarCarrito);
                request.setAttribute("contador", listarCarrito.size());
                request.getRequestDispatcher("carrito.jsp").forward(request, response);
                break;

            case "Agregar":
                int pos = 0;
                cantidad = 1;
                idp = Integer.parseInt(request.getParameter("id"));
                p = pdao.listarPorID(idp);
                if (listarCarrito.size() > 0) {
                    for (int i = 0; i < listarCarrito.size(); i++) {
                        if (idp == listarCarrito.get(i).getIdProducto()) {
                            pos = i;
                        }
                    }
                    if (idp == listarCarrito.get(pos).getIdProducto()) {
                        cantidad = listarCarrito.get(pos).getCantidad() + cantidad;
                        double subtotal = listarCarrito.get(pos).getPrecioDeCompra() * cantidad;
                        listarCarrito.get(pos).setCantidad(cantidad);
                        listarCarrito.get(pos).setSubtotal(subtotal);
                    } else {
                        item = item + 1;
                        carr = new Carrito();
                        carr.setItem(item);
                        carr.setIdProducto(p.getId());
                        carr.setNombre(p.getNombres());
                        carr.setDescripcion(p.getDescripcion());
                        carr.setPrecioDeCompra(p.getPrecio());
                        carr.setCantidad(cantidad);
                        carr.setSubtotal(cantidad * p.getPrecio());
                        listarCarrito.add(carr);
                    }
                } else {
                    item = item + 1;
                    carr = new Carrito();
                    carr.setItem(item);
                    carr.setIdProducto(p.getId());
                    carr.setNombre(p.getNombres());
                    carr.setDescripcion(p.getDescripcion());
                    carr.setPrecioDeCompra(p.getPrecio());
                    carr.setCantidad(cantidad);
                    carr.setSubtotal(cantidad * p.getPrecio());
                    listarCarrito.add(carr);
                }

                request.setAttribute("contador", listarCarrito.size());
                request.getRequestDispatcher("controllerProducto?accion=productos").forward(request, response);
                break;

            case "Carrito":
                totalPago = 0.0;
                request.setAttribute("carrito", listarCarrito);
                for (int i = 0; i < listarCarrito.size(); i++) {
                    totalPago = totalPago + listarCarrito.get(i).getSubtotal();
                }
                request.setAttribute("totalPagar", totalPago);
                request.getRequestDispatcher("carrito.jsp").forward(request, response);
                break;

            case "Delete":
                int idproducto = Integer.parseInt(request.getParameter("idp"));
                for (int i = 0; i < listarCarrito.size(); i++) {
                    if (listarCarrito.get(i).getIdProducto() == idproducto) {
                        listarCarrito.remove(i);
                    }
                }
                break;

            case "Actualizar":
                int idpro = Integer.parseInt(request.getParameter("idp"));
                int cant = Integer.parseInt(request.getParameter("cantidad"));
                for (int i = 0; i < listarCarrito.size(); i++) {
                    if (listarCarrito.get(i).getIdProducto() == idpro) {
                        listarCarrito.get(i).setCantidad(cant);
                        double st = listarCarrito.get(i).getPrecioDeCompra() * cant;
                        listarCarrito.get(i).setSubtotal(st);
                    }
                }
                break;

            case "ActualizarStock":
                for (int i = 0; i < listarCarrito.size(); i++) {
                    Producto pr = new Producto();
                    int Cantidad = listarCarrito.get(i).getCantidad();
                    int idProducto = listarCarrito.get(i).getIdProducto();
                    ProductoDAO productoDao = new ProductoDAO();
                    pr = productoDao.listarPorID(idProducto);
                    int stockActual = pr.getStock() - Cantidad;
                    productoDao.actualizarStock(idProducto, stockActual);
                }
                break;

            case "productos":
               try {
                int categoriaId = Integer.parseInt(request.getParameter("categoriaId"));
                productos = pdao.listar(categoriaId);
                request.setAttribute("productos", productos);
                request.getRequestDispatcher("listaProductos.jsp").forward(request, response);
            } catch (NumberFormatException e) {
                request.setAttribute("error", "El parámetro categoriaId es requerido y debe ser un número.");
                request.getRequestDispatcher("listaProductos.jsp").forward(request, response);
            }
            break;

            case "GenerarPedido":

                Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
                if (usuario == null) {
                    response.sendRedirect("login.jsp");
                    break;
                }

                // Verificar y capturar totalPago y listarCarrito
                Double totalPago = (Double) request.getSession().getAttribute("totalPago");
                List<Carrito> listarCarrito = (List<Carrito>) request.getSession().getAttribute("listarCarrito");

                if (totalPago == null || listarCarrito == null) {
                    request.setAttribute("error", "No se pudo generar el pedido. Datos incompletos.");
                    request.getRequestDispatcher("carrito.jsp").forward(request, response);
                    break;
                }

                Pedido pedido = new Pedido();
                pedido.setUsuario(usuario);
                pedido.setFecha(Fecha.FechaDB());
                pedido.setMonto(totalPago);
                pedido.setEstado("Completado");
                pedido.setDetalleCompras(listarCarrito);

                PedidoDAO pedidoDAO = new PedidoDAO();
                int resultado = pedidoDAO.GenerarPedido(pedido);

                if (resultado > 0) {
                    for (Carrito itemCarrito : listarCarrito) {
                        ProductoDAO productoDAO = new ProductoDAO();
                        Producto producto = productoDAO.listarPorID(itemCarrito.getIdProducto());
                        int stockActualizado = producto.getStock() - itemCarrito.getCantidad();
                        productoDAO.actualizarStock(itemCarrito.getIdProducto(), stockActualizado);
                    }

                    listarCarrito.clear();
                    totalPago = 0.0;

                    request.getRequestDispatcher("confirmacionPedido.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "No se pudo generar el pedido. Inténtalo nuevamente.");
                    request.getRequestDispatcher("carrito.jsp").forward(request, response);
                }

                break;

            default:
               try {
                int categoriaId = Integer.parseInt(request.getParameter("categoriaId"));
                productos = pdao.listar(categoriaId);
            } catch (NumberFormatException e) {
                request.setAttribute("error", "El parámetro categoriaId es requerido y debe ser un número.");
            }
            request.setAttribute("productos", productos);
            request.getRequestDispatcher("productos.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            ProductoDAO productoDAO = new ProductoDAO();
            List<Producto> listaProductos = productoDAO.listaProductos();
            request.setAttribute("listaProducto", listaProductos);
        } catch (ClassNotFoundException | SQLException e) {
            request.setAttribute("error", "Error al obtener la lista de productos");
        }
        request.getRequestDispatcher("principalEmpleado.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}