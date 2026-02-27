package servlets.authservlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import java.io.IOException;

import org.hibernate.SessionFactory;

import DAOInterface.UserDAO;
import DAOImplementation.UserHibernateDAOImpl;
import ServiceInterface.AuthService;
import ServiceImplementation.AuthServiceImpl;
import Util.HibernateUtil;

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
  
        try {
			SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
			UserDAO userDAO = new UserHibernateDAOImpl(sessionFactory);
            AuthService authService = new AuthServiceImpl(userDAO);

            if (authService.registerUser(username, email, password)) {
                response.sendRedirect("login.jsp?msg=signup_success");
            } else {
                request.setAttribute("error", "Registration failed. Email or Username might be taken.");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Database connection error.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
    }
}