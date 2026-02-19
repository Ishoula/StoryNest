package DAOInterface;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

import models.Book;
import models.Chapter;

public interface BookDAO {
	
	List<Book> getAllBooks() throws SQLException;
	Optional<Book> getBookById(long bookId) throws SQLException;
	List<Book> getBooksByCategory(String Category) throws SQLException;
	boolean createBook(Book book) throws SQLException;
	List<Book> searchBooks(String query, String category) throws SQLException;
	
}
