package servlets.dataServlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import DAOImplementation.BookDAOImpl;
import DAOImplementation.LibraryDAOImpl;
import DB.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import models.Book;
import models.User;
import models.UserLibrary;

public class HomeServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String query=req.getParameter("query");
		String category=req.getParameter("category");
		try(Connection con=DBUtil.getConnection()){
			BookDAOImpl bookDAO=new BookDAOImpl(con);
			List<Book> books;
			if((query!=null && !query.isEmpty())|| (category!=null && !category.isEmpty())) {
				books=bookDAO.searchBooks(query, category);
			}else {
				books=bookDAO.getAllBooks();
			}
			req.setAttribute("bookList", books);
			
			HttpSession session=req.getSession(false);
			if(session!=null &&session.getAttribute("currentUser")!=null) {
				User user=(User) session.getAttribute("currentUser");
				
				LibraryDAOImpl libraryDAO = new LibraryDAOImpl(con);
				List<UserLibrary> progress=libraryDAO.getUserLibrary(user.getUserId());
				req.setAttribute("userProgress", progress);
				
				
				req.getRequestDispatcher("/views/home.jsp").forward(req, res);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
