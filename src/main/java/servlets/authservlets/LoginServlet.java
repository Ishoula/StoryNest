package servlets.authservlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import java.io.IOException;

import org.hibernate.SessionFactory;

import models.User;
import DAOInterface.UserDAO;
import DAOImplementation.UserHibernateDAOImpl;
import ServiceInterface.AuthService;
import ServiceImplementation.AuthServiceImpl;
import Util.HibernateUtil;

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String identity = request.getParameter("identity");
        String password = request.getParameter("password");

        try {
        	SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
			UserDAO userDAO = new UserHibernateDAOImpl(sessionFactory);
            AuthService authService = new AuthServiceImpl(userDAO);

            User user = authService.login(identity, password);

            if (user != null) {
                // Set up session
                HttpSession session = request.getSession();
                session.setAttribute("currentUser", user);
                
                // Redirect to Home Page
                response.sendRedirect(request.getContextPath() + "/");
            } else {
                request.setAttribute("error", "Invalid username/email or password.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An internal error occurred.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}