package controladores;

import modelos.Proveedor;
import DAO.ProveedorDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/listaProveedores")
public class listaProveedores extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
           
            ProveedorDAO proveedorDAO = new ProveedorDAO();
            List<Proveedor> listaProveedores = proveedorDAO.listaProveedor();

            request.setAttribute("listaProveedores", listaProveedores);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al obtener la lista de proveedores");
        }
        request.getRequestDispatcher("listaProveedores.jsp").forward(request, response);
    }
}
