package servlets.dataServlets;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import DAOImplementation.*;
import DB.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import models.*;

public class BookDetailsServlet extends HttpServlet{
	
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		
		String id=req.getParameter("id");
		if(id==null) {
			res.sendRedirect("home");
			return;
		}
		
		int bookId=Integer.parseInt(id);
		try(Connection con=DBUtil.getConnection()){
			
			BookDAOImpl bookDAO=new BookDAOImpl(con);
			ChapterDAOImpl chapterDAO= new ChapterDAOImpl(con);
			
			Optional<Book> book= bookDAO.getBookById(bookId);
			
			if(book.isPresent()) {
				req.setAttribute("book", book.get());
				List<Chapter> chapters=chapterDAO.getChaptersByBookId(bookId);
				req.setAttribute("chapters", chapters);
				req.getRequestDispatcher("/views/bookDetails.jsp").forward(req, res);
			}else {
				res.sendRedirect("home?error=book_not_found");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
