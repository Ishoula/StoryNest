package servlets.dataServlets;

import java.io.IOException;
import java.sql.SQLException;
import org.hibernate.SessionFactory;
import DAOImplementation.ChapterHibernateDAOImpl;
import DAOImplementation.LibraryHibernateDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import models.Chapter;
import models.User;

public class ReaderServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String bookIdParam = req.getParameter("bookId");
        String orderParam = req.getParameter("order"); // This is the sequence (1, 2, 3...)

        if (bookIdParam == null || orderParam == null) {
            res.sendRedirect(req.getContextPath() + "/views/home");
            return;
        }

        int bookId = Integer.parseInt(bookIdParam);
        int order = Integer.parseInt(orderParam);

        try {
            SessionFactory sessionFactory = Util.HibernateUtil.getSessionFactory();
            ChapterHibernateDAOImpl chapterDAO = new ChapterHibernateDAOImpl(sessionFactory);
            Chapter current = chapterDAO.getChapter(bookId, order);

            if (current != null) {
                boolean hasNext = chapterDAO.hasChapter(bookId, order + 1);
                boolean hasPrevious = chapterDAO.hasChapter(bookId, order - 1);

                req.setAttribute("chapter", current);
                req.setAttribute("hasNext", hasNext);
                req.setAttribute("hasPrev", hasPrevious);

                // TRACK PROGRESS
                HttpSession session = req.getSession(false);
                if (session != null && session.getAttribute("currentUser") != null) {
                    User user = (User) session.getAttribute("currentUser");
                    LibraryHibernateDAOImpl libraryDAO = new LibraryHibernateDAOImpl(sessionFactory);

                    // Check if a specific scroll position was sent via AJAX/Query (optional)
                    String posParam = req.getParameter("pos");
                    double position = (posParam != null) ? Double.parseDouble(posParam) : 0.0;

                    // We save 'order' into the currentChapterId column to make Resuming easy
                    libraryDAO.updateProgress(user.getUserId(), (long)bookId, order, position);
                }

                req.getRequestDispatcher("/views/reader.jsp").forward(req, res);
                return;
            }

            res.sendRedirect(req.getContextPath() + "/views/home");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}