<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.helpdesk.model.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"admin".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel de Administración - HelpDesk</title>
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

        .dashboard-container {
            background: white;
            border-radius: 5px;
            width: 90%;
            max-width: 1100px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
            padding: 30px 40px;
            margin-top: 30px;
        }

        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 2px solid #f1f1f1;
            padding-bottom: 10px;
            margin-bottom: 25px;
        }

        .dashboard-header h2 {
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

        .welcome-text {
            font-size: 18px;
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }

        .card {
            border: none;
            border-radius: 16px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            transition: 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .table {
            border-radius: 10px;
            overflow: hidden;
        }

        .table thead {
            background-color: #007bff;
            color: white;
        }

        .table a {
            text-decoration: none;
        }
    </style>
</head>

<body>
<div class="dashboard-container">
    <div class="dashboard-header">
        <h2>HelpDesk Admin Panel</h2>
        <form action="logout" method="post">
            <button class="logout-btn">Cerrar sesión</button>
        </form>
    </div>

    <div class="welcome-text">
        Bienvenido, <b><%= user.getUsername() %></b> 👋
    </div>

    <!-- Tarjetas de métricas -->
    <div class="row text-center mb-4">
        <div class="col-md-3">
            <div class="card p-3">
                <h5>Abiertos</h5>
                <h2 class="text-primary mb-0">
                    <c:out value="${ticketCounts.open}" default="0" />
                </h2>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card p-3">
                <h5>En Progreso</h5>
                <h2 class="text-warning mb-0">
                    <c:out value="${ticketCounts.inProgress}" default="0" />
                </h2>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card p-3">
                <h5>Resueltos</h5>
                <h2 class="text-success mb-0">
                    <c:out value="${ticketCounts.resolved}" default="0" />
                </h2>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card p-3">
                <h5>Cerrados</h5>
                <h2 class="text-secondary mb-0">
                    <c:out value="${ticketCounts.closed}" default="0" />
                </h2>
            </div>
        </div>
    </div>

    <!-- Tabla de tickets -->
    <h4 class="text-center mb-3">📋 Últimos Tickets</h4>
    <table class="table table-hover align-middle">
        <thead>
        <tr>
            <th>ID</th>
            <th>Título</th>
            <th>Estado</th>
            <th>Prioridad</th>
            <th>Usuario</th>
            <th>Fecha</th>
            <th>Acción</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="ticket" items="${tickets}">
            <tr>
                <td><c:out value="${ticket.ticketId}" /></td>
                <td><a href="viewTicket?id=${ticket.ticketId}" class="text-primary">
                    <c:out value="${ticket.title}" /></a>
                </td>
                <td><c:out value="${ticket.status}" /></td>
                <td><c:out value="${ticket.priority}" /></td>
                <td><c:out value="${ticket.userId}" /></td>
                <td><c:out value="${ticket.createdAt}" /></td>
                <td>
                    <a href="deleteTicket?id=${ticket.ticketId}" class="text-danger"
                       onclick="return confirm('¿Estás seguro de eliminar este ticket?');">Eliminar</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
