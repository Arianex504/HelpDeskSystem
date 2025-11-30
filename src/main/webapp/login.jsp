<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>HelpDesk Login</title>
<style>
    * {
        box-sizing: border-box;
        font-family: "Segoe UI", Roboto, sans-serif;
    }

    body {
        margin: 0;
        background: linear-gradient(135deg, #007bff, #00b4d8);
        height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .login-container {
        background: #fff;
        width: 360px;
        padding: 2.5em;
        border-radius: 16px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.2);
        text-align: center;
        animation: fadeIn 0.7s ease-in-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-10px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .login-container h2 {
        margin-bottom: 1em;
        color: #007bff;
    }

    .input-group {
        text-align: left;
        margin-bottom: 1.2em;
    }

    label {
        font-size: 0.9em;
        font-weight: 600;
        color: #333;
    }

    input {
        width: 100%;
        padding: 10px;
        border-radius: 8px;
        border: 1px solid #ccc;
        margin-top: 5px;
        font-size: 1em;
        transition: border-color 0.3s;
    }

    input:focus {
        border-color: #007bff;
        outline: none;
    }

    .error {
        color: #dc3545;
        font-size: 0.9em;
        margin-bottom: 1em;
    }

    button {
        width: 100%;
        padding: 12px;
        background-color: #007bff;
        border: none;
        color: white;
        font-weight: bold;
        border-radius: 8px;
        cursor: pointer;
        font-size: 1em;
        transition: background-color 0.3s;
    }

    button:hover {
        background-color: #0056b3;
    }

    .register-link {
        margin-top: 1em;
        font-size: 0.9em;
    }

    .register-link a {
        color: #007bff;
        text-decoration: none;
        font-weight: bold;
    }

    .register-link a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>

<div class="login-container">
    <h2>HelpDesk Login</h2>

    <% if ("1".equals(request.getParameter("error"))) { %>
        <p class="error">⚠️ Invalid email or password. Please try again.</p>
    <% } %>

    <form action="login" method="post">
        <div class="input-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>
        </div>

        <div class="input-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>
        </div>

        <button type="submit">Sign In</button>
    </form>

    <div class="register-link">
        <p>Don't have an account? <a href="register.jsp">Register</a></p>
    </div>
</div>

</body>
</html>
