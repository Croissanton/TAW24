<%@ page import="java.util.List" %>
<%@ page import="es.uma.taw24.entity.*" %>
<%@ page import="es.uma.taw24.DTO.Ejercicio" %>
<%@ page import="es.uma.taw24.DTO.Usuario" %>
<%@ page import="es.uma.taw24.DTO.SesionEjercicio" %>
<%@ page import="es.uma.taw24.DTO.Rutina" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //Alvaro Acedo Espejo 100%
    List<SesionEjercicio> list = (List<SesionEjercicio>) request.getAttribute("listSesionEjs");
    Usuario client = (Usuario) request.getAttribute("cliente");
    Integer idRutina = (Integer) request.getAttribute("rutinaId");
    short dia = (short) request.getAttribute("dia");
    Integer sesion = (Integer) request.getAttribute("sesionId");
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sesion Ejercicio</title>
</head>
<body>
<h1>Sesi&oacuten</h1>
<table border="1">
    <tr>
        <th>Nombre de ejercicio</th>
        <th>Repeticiones</th>
        <th>Peso</th>
        <th>Series</th>
        <th>Distancia</th>
        <th>Duraci&oacuten</th>
        <th>Velocidad</th>
        <th>Tipo</th>
        <th>Video de ejemplo</th>
    </tr>
    <%
        if(list!=null){
            for (SesionEjercicio se : list){
    %>
                <tr>
                    <td><%=se.getEjercicio().getNombre()%></td>
                    <td><%=se.getRepeticiones()%></td>
                    <td><%=se.getPeso()%></td>
                    <td><%=se.getSeries()%></td>
                    <td><%=se.getDistancia()%></td>
                    <td><%=se.getDuracion()%></td>
                    <td><%=se.getVelocidad()%></td>
                    <td><%=se.getEjercicio().getTipo().getNombre()%></td>
                    <th><a href="<%=se.getEjercicio().getUrl()%>">Ver Tutorial</a></th>
                    <th><a href="/entrenadorCross/<%=client.getId()%>/crearRutinaSesion/<%=dia%>/borrarEjercicio?rutinaId=<%=idRutina%>&sesionId=<%=sesion%>&ejercicioId=<%=se.getEjercicio().getId()%>">Borrar</a></th>
                </tr>
    <%
            }
        }
    %>
</table>
<a href="/entrenadorCross/<%=client.getId()%>/crearRutinaSesion/<%=dia%>/crearEjercicio?rutinaId=<%=idRutina%>&sesionId=<%=sesion%>">A&ntildeadir Ejercicio</a></br>
<a href="/entrenadorCross/clientes/<%=client.getId()%>/rutinas/crear/<%=sesion%>?rutinaId=<%=idRutina%>">Volver</a>
</body>
</html>
