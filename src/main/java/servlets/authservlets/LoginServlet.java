package servlets.authservlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import models.User;
import DB.DBUtil;
import DAOImplementation.UserDAOImpl;
import DAOInterface.UserDAO;
import ServiceInterface.AuthService;
import ServiceImplementation.AuthServiceImpl;

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String identity = request.getParameter("identity");
        String password = request.getParameter("password");

        try (Connection con = DBUtil.getConnection()) {
            UserDAO userDAO = new UserDAOImpl(con);
            AuthService authService = new AuthServiceImpl(userDAO);

            User user = authService.login(identity, password);

            if (user != null) {
                // Set up session
                HttpSession session = request.getSession();
                session.setAttribute("currentUser", user);
                
                // Redirect to Home Page
                response.sendRedirect("home");
            } else {
                request.setAttribute("error", "Invalid username/email or password.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "An internal error occurred.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}