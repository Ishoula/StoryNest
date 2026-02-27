package servlets.dataServlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.SessionFactory;

import DAOImplementation.BookHibernateDAOImpl;
import DAOImplementation.LibraryHibernateDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import models.Book;
import models.User;
import models.UserLibrary;

public class HomeServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		if(session==null || session.getAttribute("currentUser")==null) {
			res.sendRedirect(req.getContextPath() + "/");
			return;
		}
		
		String query=req.getParameter("query");
		String category=req.getParameter("category");
		try{
			SessionFactory sessionFactory = Util.HibernateUtil.getSessionFactory();
			BookHibernateDAOImpl bookDAO=new BookHibernateDAOImpl(sessionFactory);
			List<Book> books;
			if((query!=null && !query.isEmpty())|| (category!=null && !category.isEmpty())) {
				books=bookDAO.searchBooks(query, category);
			}else {
				books=bookDAO.getAllBooks();
			}
			req.setAttribute("bookList", books);
			
			User user=(User) session.getAttribute("currentUser");
			
			LibraryHibernateDAOImpl libraryDAO = new LibraryHibernateDAOImpl(sessionFactory);
			List<UserLibrary> progress=libraryDAO.getUserLibrary(user.getUserId());
			req.setAttribute("userProgress", progress);
			
			req.getRequestDispatcher("/views/home.jsp").forward(req, res);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
