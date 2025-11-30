<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Registro - HelpDesk</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: "Poppins", sans-serif;
    }
    body {
      height: 100vh;
      background: linear-gradient(135deg, #4e54c8, #8f94fb);
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .register-wrapper {
      width: 400px;
      background: white;
      border-radius: 16px;
      padding: 2.2em;
      box-shadow: 0 10px 25px rgba(0,0,0,0.2);
      animation: fadeIn 0.8s ease;
    }
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(-20px); }
      to { opacity: 1; transform: translateY(0); }
    }
    h2 {
      text-align: center;
      margin-bottom: 1.5em;
      color: #4e54c8;
    }
    .input-group {
      margin-bottom: 1.3em;
    }
    .input-group label {
      display: block;
      font-size: 0.9em;
      margin-bottom: 0.4em;
      color: #444;
    }
    .input-group input, 
    .input-group select {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 8px;
      font-size: 1em;
      transition: border-color 0.3s;
    }
    .input-group input:focus,
    .input-group select:focus {
      border-color: #4e54c8;
      outline: none;
    }
    button {
      width: 100%;
      padding: 12px;
      background-color: #4e54c8;
      color: white;
      font-size: 1em;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      transition: background-color 0.3s;
    }
    button:hover {
      background-color: #3a3fc1;
    }
    .login-link {
      margin-top: 1em;
      text-align: center;
      font-size: 0.9em;
    }
    .login-link a {
      color: #4e54c8;
      text-decoration: none;
      font-weight: bold;
    }
    .login-link a:hover {
      text-decoration: underline;
    }
    .error {
      color: #e74c3c;
      font-size: 0.9em;
      text-align: center;
      margin-bottom: 1em;
    }
  </style>
</head>
<body>

<div class="register-wrapper">
  <h2>Crear Cuenta</h2>

  <% if ("1".equals(request.getParameter("error"))) { %>
    <div class="error">Error al registrar. Intenta nuevamente.</div>
  <% } %>

  <form action="register" method="post">
    <div class="input-group">
      <label for="username">Nombre de usuario</label>
      <input type="text" id="username" name="username" placeholder="Tu nombre" required>
    </div>

    <div class="input-group">
      <label for="email">Correo electrónico</label>
      <input type="email" id="email" name="email" placeholder="correo@ejemplo.com" required>
    </div>

    <div class="input-group">
      <label for="password">Contraseña</label>
      <input type="password" id="password" name="password" placeholder="Contraseña" required>
    </div>

    <div class="input-group">
      <label for="role">Rol</label>
      <select id="role" name="role" required>
        <option value="user" selected>Usuario</option>
        <option value="admin">Soporte</option>
      </select>
    </div>

    <button type="submit">Registrarse</button>
  </form>

  <div class="login-link">
    ¿Ya tienes cuenta? <a href="login.jsp">Inicia sesión</a>
  </div>
</div>

</body>
</html>
