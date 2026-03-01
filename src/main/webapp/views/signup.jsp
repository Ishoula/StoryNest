<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Join StoryNest | Create Your Account</title>
    <style>
        /* Shared Styles from Landing Page */
        :root {
            --primary: #daedff;
            --bg: #0f172a;
            --bg-main: #010d29; 
            --dark: #0f172a;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: var(--bg);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        /* Signup Container */
        .signup-container {
            background: var(--bg-main);
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 450px;
        }

        .signup-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .signup-header h2 {
            color: var(--primary);
            font-size: 2rem;
            margin-bottom: 10px;
        }

        .signup-header p {
            color: var(--primary);
        }

        /* Form Styling */
        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: var(--primary);
        }

        .form-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 1rem;
            transition: border-color 0.3s;
            background: var(--primary);
        }

        .form-group input:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(39, 174, 96, 0.1);
        }

        /* Submit Button */
        .signup-btn {
            width: 100%;
            padding: 14px;
            background-color: var(--primary);
            color: var(--bg);
            border: none;
            border-radius: 6px;
            font-size: 1.1rem;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s;
            margin-top: 10px;
        }

        .footer-text {
            text-align: center;
            margin-top: 20px;
            font-size: 0.9rem;
            color: var(--primary);
        }

        .footer-text a {
            color: var(--primary);
            text-decoration: none;
            font-weight: bold;
        }

        /* Requirements List */
        .password-hints {
            font-size: 0.8rem;
            color: #95a5a6;
            margin-top: 5px;
        }

        .logo-link {
            text-decoration: none;
            color: var(--primary);
            font-weight: 800;
            font-size: 1.5rem;
            display: block;
            text-align: center;
            margin-bottom: 20px;
        }

        .error-msg {
            background: #361d1d;
            color: var(--primary);
            padding: 10px;
            border-radius: 6px;
            margin-bottom: 20px;
            font-size: 0.85rem;
            text-align: center;
            display: none;
        }
    </style>
</head>
<body>

    <div class="signup-container">
        <a href="landing.jsp" class="logo-link">StoryNest</a>
        
        <div class="signup-header">
            <h2>Create Account</h2>
            <p>Start your reading journey today.</p>
        </div>

        <% if (request.getAttribute("error") != null) { %>
            <div class="error-msg" style="display: block;">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <form action="register" method="POST">
            
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="shoula27" required>
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" placeholder="shoula27@gmail.com" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="••••••••" required>
                <div class="password-hints">Must be at least 8 characters long.</div>
            </div>

            <div class="form-group">
                <label for="confirm_password">Confirm Password</label>
                <input type="password" id="confirm_password" name="confirm_password" placeholder="••••••••" required>
            </div>

            <button type="submit" class="signup-btn">Create Free Account</button>
        </form>

        <div class="footer-text">
            Already have an account? <a href="login.jsp">Log In</a>
        </div>
    </div>

</body>
</html>