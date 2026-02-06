<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login | StoryNest</title>
    <style>
        :root {
            --primary: #27ae60;
            --dark: #2c3e50;
            --light: #f4f7f6;
            --accent: #3498db;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--light);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .login-container {
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 400px;
        }

        .logo-link {
            text-decoration: none;
            color: var(--primary);
            font-weight: 800;
            font-size: 1.8rem;
            display: block;
            text-align: center;
            margin-bottom: 10px;
        }

        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .login-header h2 {
            color: var(--dark);
            margin-bottom: 8px;
        }

        .login-header p {
            color: #7f8c8d;
            font-size: 0.95rem;
        }

        /* Form Elements */
        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: var(--dark);
        }

        .form-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .form-group input:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(39, 174, 96, 0.1);
        }

        .options-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            font-size: 0.85rem;
        }

        .options-row a {
            color: var(--accent);
            text-decoration: none;
        }

        .login-btn {
            width: 100%;
            padding: 14px;
            background-color: var(--primary);
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 1.1rem;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s;
        }

        .login-btn:hover {
            background-color: #219150;
        }

        .signup-link {
            text-align: center;
            margin-top: 25px;
            font-size: 0.9rem;
            color: #7f8c8d;
        }

        .signup-link a {
            color: var(--primary);
            text-decoration: none;
            font-weight: bold;
        }

        /* Error Message Styling (Used for failed logins) */
        .error-msg {
            background: #fdf2f2;
            color: #e74c3c;
            padding: 10px;
            border-radius: 4px;
            margin-bottom: 20px;
            font-size: 0.85rem;
            text-align: center;
            border: 1px solid #fadbd8;
            display: none; /* Show only if error exists */
        }
    </style>
</head>
<body>

    <div class="login-container">
        <a href="landing.jsp" class="logo-link">StoryNest</a>
        
        <div class="login-header">
            <h2>Welcome Back</h2>
            <p>Please enter your details to sign in.</p>
        </div>

        <%-- This section would be toggled by your Servlet if login fails --%>
        <% if (request.getAttribute("error") != null) { %>
            <div class="error-msg" style="display: block;">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <form action="login" method="POST">
            <div class="form-group">
                <label for="identity">Username or Email</label>
                <input type="text" id="identity" name="identity" placeholder="Enter your email" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="••••••••" required>
            </div>

            <div class="options-row">
                <label><input type="checkbox" name="remember"> Remember me</label>
                <a href="#">Forgot Password?</a>
            </div>

            <button type="submit" class="login-btn">Sign In</button>
        </form>

        <div class="signup-link">
            Don't have an account? <a href="signup.jsp">Create one for free</a>
        </div>
    </div>

</body>
</html>