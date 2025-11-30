<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.helpdesk.model.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel de Usuario - HelpDesk</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #007bff, #00bcd4);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 40px 0;
        }

        .container {
            background: white;
            border-radius: 20px;
            width: 90%;
            max-width: 1000px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
            padding: 30px 40px;
            margin-top: 30px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 2px solid #f1f1f1;
            padding-bottom: 10px;
            margin-bottom: 25px;
        }

        .header h2 {
            color: #007bff;
            font-weight: 600;
        }

        .logout-btn {
            background-color: #ff4d4d;
            border: none;
            color: white;
            font-weight: 500;
            padding: 8px 16px;
            border-radius: 8px;
            transition: 0.3s;
        }

        .logout-btn:hover {
            background-color: #cc0000;
        }

        h3 {
            color: #007bff;
            font-weight: 600;
            margin-bottom: 15px;
        }

        form {
            background: #f9fbff;
            border: 1px solid #e0e0e0;
            border-radius: 16px;
            padding: 20px;
            margin-bottom: 30px;
        }

        input, textarea, select {
            font-size: 1em;
            border-radius: 10px;
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 15px;
        }

        button {
            background: #007bff;
            border: none;
            color: white;
            padding: 12px 18px;
            border-radius: 10px;
            transition: 0.3s;
            font-weight: 500;
        }

        button:hover {
            background: #0056b3;
        }

        .table {
            border-radius: 10px;
            overflow: hidden;
            background: #fff;
        }

        .table thead {
            background-color: #007bff;
            color: white;
        }

        .table tbody tr:hover {
            background-color: #f0f8ff;
        }

        .no-tickets {
            text-align: center;
            color: #777;
            font-style: italic;
        }

        label {
            font-weight: 500;
            color: #333;
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<div class="container">
    <div class="header">
        <h2>Bienvenido, <c:out value="${user.username}" /> 👋</h2>
        <form action="logout" method="post">
            <button class="logout-btn">Cerrar sesión</button>
        </form>
    </div>

    <!-- Formulario para crear ticket -->
    <h3>📝 Crear un nuevo ticket</h3>
    <form action="createTicket" method="post">
        <label for="title">Título del problema:</label>
        <input type="text" name="title" id="title" class="form-control" placeholder="Ejemplo: No puedo acceder a mi cuenta" required>

        <label for="description">Descripción detallada:</label>
        <textarea name="description" id="description" class="form-control" rows="5" placeholder="Describe tu problema con claridad..." required></textarea>

        <label for="priority">Prioridad:</label>
        <select name="priority" id="priority" class="form-select" required>
            <option value="low">Baja</option>
            <option value="medium" selected>Media</option>
            <option value="high">Alta</option>
            <option value="urgent">Urgente</option>
        </select>

        <div class="text-center mt-3">
            <button type="submit">Enviar Ticket</button>
        </div>
    </form>

    <!-- Lista de tickets -->
    <h3>🎟️ Mis Tickets Enviados</h3>
    <table class="table table-hover align-middle">
        <thead>
            <tr>
                <th>ID</th>
                <th>Título</th>
                <th>Estado</th>
                <th>Prioridad</th>
                <th>Fecha Enviada</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="ticket" items="${tickets}">
                <tr>
                    <td><c:out value="${ticket.ticketId}" /></td>
                    <td><c:out value="${ticket.title}" /></td>
                    <td>
                        <span class="badge
                            <c:choose>
                                <c:when test="${ticket.status == 'open'}">bg-primary</c:when>
                                <c:when test="${ticket.status == 'in_progress'}">bg-warning text-dark</c:when>
                                <c:when test="${ticket.status == 'resolved'}">bg-success</c:when>
                                <c:otherwise>bg-secondary</c:otherwise>
                            </c:choose>">
                            <c:out value="${ticket.status}" />
                        </span>
                    </td>
                    <td><c:out value="${ticket.priority}" /></td>
                    <td><c:out value="${ticket.createdAt}" /></td>
                </tr>
            </c:forEach>

            <c:if test="${empty tickets}">
                <tr>
                    <td colspan="5" class="no-tickets">Aún no has enviado ningún ticket.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
</div>

</body>
</html>
