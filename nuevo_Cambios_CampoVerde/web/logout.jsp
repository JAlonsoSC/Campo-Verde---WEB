<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    HttpSession sessionToInvalidate = request.getSession(false);
    if(sessionToInvalidate != null) {
        sessionToInvalidate.invalidate();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cierre de sesión</title>
    <meta http-equiv="refresh" content="3;url=index.jsp">
</head>
<body>
    <h1>Sesión cerrada correctamente</h1>
    <p>Redirigiendo a la página de inicio...</p>    
</body>
</html>
