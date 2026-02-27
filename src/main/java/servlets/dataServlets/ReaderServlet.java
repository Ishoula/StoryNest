package servlets.dataServlets;

import java.io.IOException;
import java.sql.SQLException;

import org.hibernate.SessionFactory;

import DAOImplementation.ChapterHibernateDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Chapter;

public class ReaderServlet extends HttpServlet{
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String bookIdParam = req.getParameter("bookId");
        String orderParam = req.getParameter("order");
        if (bookIdParam == null || orderParam == null) {
            res.sendRedirect(req.getContextPath() + "/views/home");
            return;
        }

        int bookId=Integer.parseInt(bookIdParam);
        int order=Integer.parseInt(orderParam);

       try{
           SessionFactory sessionFactory = Util.HibernateUtil.getSessionFactory();
           ChapterHibernateDAOImpl chapterDAO=new ChapterHibernateDAOImpl(sessionFactory);
           Chapter current = chapterDAO.getChapter(bookId,order);
           if(current!=null){
               boolean hasNext= chapterDAO.hasChapter(bookId,order+1);
               boolean hasPrevious= chapterDAO.hasChapter(bookId,order-1);

               req.setAttribute("chapter",current);
               req.setAttribute("hasNext",hasNext);
               req.setAttribute("hasPrev",hasPrevious);

               req.getRequestDispatcher("/views/reader.jsp").forward(req,res);

               return;
           }

           res.sendRedirect(req.getContextPath() + "/views/home");
       } catch (SQLException e) {
           throw new RuntimeException(e);
       }
    }
}
