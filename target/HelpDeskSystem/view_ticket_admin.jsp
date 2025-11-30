<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Detalles del Ticket - HelpDesk</title>
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
            max-width: 900px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
            padding: 35px 45px;
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
            font-size: 1.6rem;
        }

        .back-btn {
            background-color: #6c757d;
            border: none;
            color: white;
            font-weight: 500;
            padding: 8px 16px;
            border-radius: 8px;
            transition: 0.3s;
            text-decoration: none;
        }

        .back-btn:hover {
            background-color: #5a6268;
        }

        .section-title {
            color: #007bff;
            font-weight: 600;
            margin-top: 20px;
            margin-bottom: 10px;
        }

        .info-box {
            background-color: #f9fbff;
            border: 1px solid #e0e0e0;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 25px;
        }

        p {
            font-size: 1rem;
            line-height: 1.6;
            color: #333;
            margin-bottom: 8px;
        }

        .badge-status {
            font-size: 0.95rem;
            padding: 6px 10px;
            border-radius: 8px;
        }

        form {
            background: #f9fbff;
            border: 1px solid #e0e0e0;
            border-radius: 16px;
            padding: 20px;
            margin-top: 15px;
        }

        select {
            border-radius: 10px;
            border: 1px solid #ccc;
            padding: 10px;
            font-size: 1em;
            width: 200px;
        }

        button {
            background: #007bff;
            border: none;
            color: white;
            padding: 10px 18px;
            border-radius: 10px;
            font-weight: 500;
            transition: 0.3s;
        }

        button:hover {
            background: #0056b3;
        }

        hr {
            border: none;
            border-top: 1px solid #e5e5e5;
            margin: 25px 0;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="header">
            <h2>Ticket #<c:out value="${ticket.ticketId}" /></h2>
            <a href="adminDashboard" class="back-btn">⬅ Volver al Dashboard</a>
        </div>

        <div class="info-box">
            <h3 class="section-title"><c:out value="${ticket.title}" /></h3>
            <p><strong>Usuario ID:</strong> <c:out value="${ticket.userId}" /></p>
            <p><strong>Fecha Enviada:</strong> <c:out value="${ticket.createdAt}" /></p>
            <p>
                <strong>Estado:</strong>
                <span class="badge-status
                    <c:choose>
                        <c:when test="${ticket.status == 'open'}">bg-primary</c:when>
                        <c:when test="${ticket.status == 'in_progress'}">bg-warning text-dark</c:when>
                        <c:when test="${ticket.status == 'resolved'}">bg-success</c:when>
                        <c:otherwise>bg-secondary</c:otherwise>
                    </c:choose>">
                    <c:out value="${ticket.status}" />
                </span>
            </p>
        </div>

        <h4 class="section-title">📋 Descripción del Ticket</h4>
        <div class="info-box">
            <p><c:out value="${ticket.description}" /></p>
        </div>

        <h4 class="section-title">🔄 Actualizar Estado</h4>
        <form action="updateStatus" method="post">
            <input type="hidden" name="ticketId" value="${ticket.ticketId}">
            <select name="status">
                <option value="open" ${ticket.status == 'open' ? 'selected' : ''}>Abierto</option>
                <option value="in_progress" ${ticket.status == 'in_progress' ? 'selected' : ''}>En Progreso</option>
                <option value="resolved" ${ticket.status == 'resolved' ? 'selected' : ''}>Resuelto</option>
                <option value="closed" ${ticket.status == 'closed' ? 'selected' : ''}>Cerrado</option>
            </select>
            <button type="submit" class="ms-2">Actualizar Estado</button>
        </form>
    </div>

</body>
</html>
