package servlets.dataServlets;

import java.io.IOException;
import java.sql.SQLException;

import org.hibernate.SessionFactory;

import DAOImplementation.LibraryHibernateDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.User;
import Util.HibernateUtil;

public class AddToLibraryServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("currentUser") == null) {
            res.sendRedirect(req.getContextPath() + "/");
            return;
        }

        String id = req.getParameter("bookId");
        if (id == null) {
            res.sendRedirect(req.getContextPath() + "/views/home");
            return;
        }

        int bookId;
        try {
            bookId = Integer.parseInt(id);
        } catch (NumberFormatException e) {
            res.sendRedirect(req.getContextPath() + "/views/home");
            return;
        }

        User user = (User) session.getAttribute("currentUser");
        long userId = user.getUserId();

        try {
            SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
            LibraryHibernateDAOImpl libraryDAO = new LibraryHibernateDAOImpl(sessionFactory);
            libraryDAO.addToLibrary(userId, bookId);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        res.sendRedirect(req.getContextPath() + "/views/home?added=1");
    }
}
