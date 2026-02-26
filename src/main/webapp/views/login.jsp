<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login | StoryNest</title>
    <style>
        :root {
            --bg-main: #0f172a;        /* Deep Navy */
            --bg-card: rgba(30, 41, 59, 0.7); /* Translucent Slate */
            --primary: #22c55e;        /* Vibrant Emerald */
            --primary-glow: rgba(34, 197, 94, 0.3);
            --text-main: #f8fafc;
            --text-muted: #94a3b8;
            --glass-border: rgba(255, 255, 255, 0.1);
            --error-red: #ef4444;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Inter', 'Segoe UI', sans-serif;
            background: radial-gradient(circle at center, #1e293b 0%, #0f172a 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: var(--text-main);
        }

        /* Glassmorphism Card */
        .login-container {
            background: var(--bg-card);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            padding: 50px 40px;
            border-radius: 24px;
            border: 1px solid var(--glass-border);
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
            width: 100%;
            max-width: 420px;
            text-align: center;
        }

        .logo-link {
            text-decoration: none;
            color: var(--primary);
            font-weight: 800;
            font-size: 2.2rem;
            letter-spacing: -1.5px;
            display: inline-block;
            margin-bottom: 10px;
            transition: transform 0.3s ease;
        }

        .logo-link:hover {
            transform: scale(1.05);
        }

        .login-header h2 {
            font-size: 1.75rem;
            margin: 0 0 10px 0;
            font-weight: 700;
        }

        .login-header p {
            color: var(--text-muted);
            font-size: 0.95rem;
            margin-bottom: 35px;
        }

        /* Inputs and Labels */
        .form-group {
            text-align: left;
            margin-bottom: 22px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-size: 0.85rem;
            font-weight: 600;
            color: var(--text-muted);
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .form-group input {
            width: 100%;
            padding: 14px;
            background: rgba(15, 23, 42, 0.6);
            border: 1px solid var(--glass-border);
            border-radius: 12px;
            font-size: 1rem;
            color: white;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            box-sizing: border-box; /* Crucial for width alignment */
        }

        .form-group input:focus {
            outline: none;
            border-color: var(--primary);
            background: rgba(15, 23, 42, 0.9);
            box-shadow: 0 0 0 4px var(--primary-glow);
        }

        .options-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            font-size: 0.85rem;
            color: var(--text-muted);
        }

        .options-row a {
            color: var(--primary);
            text-decoration: none;
            font-weight: 600;
        }

        .options-row a:hover {
            text-decoration: underline;
        }

        /* The Button */
        .login-btn {
            width: 100%;
            padding: 16px;
            background-color: var(--primary);
            color: #064e3b; /* Dark contrast text */
            border: none;
            border-radius: 12px;
            font-size: 1.1rem;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 10px 15px -3px rgba(34, 197, 94, 0.3);
        }

        .login-btn:hover {
            transform: translateY(-2px);
            background-color: #4ade80;
            box-shadow: 0 20px 25px -5px rgba(34, 197, 94, 0.4);
        }

        .login-btn:active {
            transform: translateY(0);
        }

        .signup-link {
            margin-top: 30px;
            font-size: 0.9rem;
            color: var(--text-muted);
        }

        .signup-link a {
            color: var(--primary);
            text-decoration: none;
            font-weight: 700;
        }

        /* Error Message Overlay */
        .error-msg {
            background: rgba(239, 68, 68, 0.1);
            color: var(--error-red);
            padding: 12px;
            border-radius: 10px;
            margin-bottom: 25px;
            font-size: 0.85rem;
            border: 1px solid rgba(239, 68, 68, 0.2);
        }
    </style>
</head>
<body>

    <div class="login-container">
        <a href="landing.jsp" class="logo-link">StoryNest</a>

        <div class="login-header">
            <h2>Welcome back</h2>
            <p>Enter your credentials to continue your journey.</p>
        </div>

        <%-- Dynamic Error Display --%>
        <% if (request.getAttribute("error") != null) { %>
            <div class="error-msg">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <form action="login" method="POST">
            <div class="form-group">
                <label for="identity">Username or Email</label>
                <input type="text" id="identity" name="identity" placeholder="name@example.com" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="••••••••" required>
            </div>

            <div class="options-row">
                <label style="display: flex; align-items: center; gap: 8px; cursor: pointer;">
                    <input type="checkbox" name="remember" style="width: auto;"> Remember me
                </label>
                <a href="#">Forgot Password?</a>
            </div>

            <button type="submit" class="login-btn">Sign In</button>
        </form>

        <div class="signup-link">
            New to the nest? <a href="signup.jsp">Create an account</a>
        </div>
    </div>

</body>
</html>