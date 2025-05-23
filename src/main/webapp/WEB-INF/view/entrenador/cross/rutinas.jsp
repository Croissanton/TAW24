<%@ page import="es.uma.taw24.DTO.Usuario" %>
<%@ page import="java.util.List" %>
<%@ page import="es.uma.taw24.DTO.Rutina" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    /*
            Alvaro Acedo Espejo 100%
     */
    Usuario cliente = (Usuario) request.getAttribute("cliente");
    List<Rutina> lista = (List<Rutina>) request.getAttribute("lista");
    Rutina rutina = (Rutina) request.getAttribute("rutina");
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Rutinas</title>
</head>
<body>
<h1>Tus rutinas</h1>
<table border="1">
    <tr>
        <th>Id</th>
        <th>Entrenador</th>
        <th>Fecha de Creaci&oacuten</th>
    </tr>
    <%
        if(lista!=null){
            for(Rutina rutinal: lista){
    %>
    <tr>
        <th><%=rutinal.getId()%></th>
        <th><%=rutinal.getEntrenador().getUsuario().getNombre()%></th>
        <th><%=rutinal.getFechacreacion()%></th>
    </tr>
    <%
            }
        }
    %>
</table>
<button onclick="window.location.href='/entrenadorCross/'">Volver</button>
</body>
</html>
