package servlets.dataServlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

import org.hibernate.SessionFactory;

import DAOImplementation.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import models.*;
import Util.HibernateUtil;

public class BookDetailsServlet extends HttpServlet{
	
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("currentUser") == null) {
			res.sendRedirect(req.getContextPath() + "/");
			return;
		}
		
		String id=req.getParameter("id");
		if(id==null) {
			res.sendRedirect(req.getContextPath() + "/views/home");
			return;
		}
		
		int bookId=Integer.parseInt(id);
		try{
			SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
			BookHibernateDAOImpl bookDAO = new BookHibernateDAOImpl(sessionFactory);
			ChapterHibernateDAOImpl chapterDAO = new ChapterHibernateDAOImpl(sessionFactory);
			LibraryHibernateDAOImpl libraryDAO = new LibraryHibernateDAOImpl(sessionFactory);
			
			Optional<Book> book= bookDAO.getBookById(bookId);
			
			if(book.isPresent()) {
				req.setAttribute("book", book.get());
				List<Chapter> chapters=chapterDAO.getChaptersByBookId(bookId);
				req.setAttribute("chapters", chapters);
				User currentUser = (User) session.getAttribute("currentUser");
				boolean inLibrary = false;
				if (currentUser != null) {
					long userId = currentUser.getUserId();
					UserLibraryId ulId = new UserLibraryId(userId, bookId);
					try (org.hibernate.Session hibSession = sessionFactory.openSession()) {
						UserLibrary existing = hibSession.get(UserLibrary.class, ulId);
						inLibrary = (existing != null);
					}
				}
				req.setAttribute("inLibrary", inLibrary);
				req.getRequestDispatcher("/views/bookDetails.jsp").forward(req, res);
			}else {
				res.sendRedirect(req.getContextPath() + "/views/home?error=book_not_found");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
