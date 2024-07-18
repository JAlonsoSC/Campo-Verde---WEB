package controladores;


import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import java.io.IOException;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.PdfDocument;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.swing.text.Document;

@WebServlet(name = "ControllerReporte", urlPatterns = {"/ControllerReporte"})
public class ControllerReporte extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/pdf");
        OutputStream out = response.getOutputStream();
        try {
           try{
               PdfDocument documento = new PdfDocument();
               PdfWriter.getInstance(documento, out);
               documento.open();
               
               Paragraph par1 = new Paragraph();
               Font fontTitulo = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD,BaseColor.BLUE);
               par1.add(new Phrase("Reporte de los productos almacenados en el inventario ", fontTitulo));
               par1.setAlignment(Element.ALIGN_CENTER);
               par1.add(new Phrase(Chunk.NEWLINE));
               par1.add(new Phrase(Chunk.NEWLINE));
               documento.add(par1);
               
               documento.close();
           } catch(Exception e){
               e.getMessage();
           }
        }finally{
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}