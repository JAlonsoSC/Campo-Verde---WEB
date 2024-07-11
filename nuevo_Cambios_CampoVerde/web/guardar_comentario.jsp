
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList" %>
<%
    // Obtener el comentario enviado por el formulario
    String nuevoComentario = request.getParameter("comentario");
    
    // Simular almacenamiento en una lista (deberías usar una base de datos real)
    List<String> comentarios = (List<String>) application.getAttribute("comentarios");
    if (comentarios == null) {
        comentarios = new ArrayList<>();
        application.setAttribute("comentarios", comentarios);
    }
    
    // Agregar el nuevo comentario a la lista
    comentarios.add(nuevoComentario);
    
    // Redireccionar de nuevo al foro principal
    response.sendRedirect("foro.jsp");
%>