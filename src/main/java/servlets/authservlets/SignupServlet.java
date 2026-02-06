package servlets.authservlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import DB.DBUtil;
import DAOImplementation.UserDAOImpl;
import DAOInterface.UserDAO;
import ServiceInterface.AuthService;
import ServiceImplementation.AuthServiceImpl;

public class SignupServlet extends HttpServlet {
    
    protected void service(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }
  
        try (Connection con = DBUtil.getConnection()) {
            UserDAO userDAO = new UserDAOImpl(con);
            AuthService authService = new AuthServiceImpl(userDAO);

            if (authService.registerUser(username, email, password)) {
                response.sendRedirect("login.jsp?msg=signup_success");
            } else {
                request.setAttribute("error", "Registration failed. Email or Username might be taken.");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database connection error.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
    }
}