package servlets.dataServlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.SessionFactory;

import DAOImplementation.LibraryHibernateDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.User;
import models.UserLibrary;
import Util.HibernateUtil;

public class LibraryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("currentUser") == null) {
            res.sendRedirect(req.getContextPath() + "/");
            return;
        }

        User user = (User) session.getAttribute("currentUser");
        long userId = user.getUserId();

        try {
            SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
            LibraryHibernateDAOImpl libraryDAO = new LibraryHibernateDAOImpl(sessionFactory);
            List<UserLibrary> library = libraryDAO.getUserLibrary(userId);
            req.setAttribute("userLibrary", library);
            req.getRequestDispatcher("/views/library.jsp").forward(req, res);
        } catch (SQLException e) {
            e.printStackTrace();
            res.sendRedirect(req.getContextPath() + "/views/home");
        }
    }
}
