<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%-- @author Ignacy Borzestowski: 100%--%>

<!doctype html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Editar tipo de ejercicio</title>
</head>
<body>
<h2>
    Editar tipo de ejercicio
</h2>
<div style="color: red;">
    ${error}
</div>
<form:form modelAttribute="tipo" action="/tipo/editar" method="post">
    <table>
        <tr>
            <td>
                <form:hidden path="id" />
            </td>
        </tr>

        <tr>
            <td>
                <form:label path="nombre">Nombre: </form:label>
            </td>
            <td>
                <form:input maxlength="90" path="nombre" />
            </td>
        </tr>

    </table>
    <input type="submit" value="Crear"/>
</form:form>
<button onclick="window.location.href='/usuario/'">Volver al inicio</button>
</body>
</html>