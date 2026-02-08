package DAOImplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import DAOInterface.BookDAO;
import models.Book;

public class BookDAOImpl implements BookDAO {
    private final Connection con;

    public BookDAOImpl(Connection con) {
        this.con = con;
    }

    @Override
    public List<Book> getAllBooks() throws SQLException {
        List<Book> books = new ArrayList<>();
        // We join with the authors table to get the author's name instead of just an ID
        String sql = "SELECT b.*, a.name as author_name FROM books b " +
                     "JOIN authors a ON b.author_id = a.author_id";
        
        try (PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                books.add(mapResultSetToBook(rs));
            }
        }
        return books;
    }

    @Override
    public Optional<Book> getBookById(long bookId) throws SQLException {
        String sql = "SELECT b.*, a.name as author_name FROM books b " +
                     "JOIN authors a ON b.author_id = a.author_id WHERE b.book_id = ?";
        
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setLong(1, bookId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(mapResultSetToBook(rs));
                }
            }
        }
        return Optional.empty();
    }

    @Override
    public List<Book> getBooksByCategory(String category) throws SQLException {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT b.*, a.name as author_name FROM books b " +
                     "JOIN authors a ON b.author_id = a.author_id WHERE b.category = ?";
        
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, category);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    books.add(mapResultSetToBook(rs));
                }
            }
        }
        return books;
    }

    @Override
    public boolean createBook(Book book) throws SQLException {
        String sql = "INSERT INTO books (title, author_id, description, cover_image_url, category) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, book.getTitle());
            ps.setInt(2, book.getAuthorId());
            ps.setString(3, book.getDescription());
            ps.setString(4, book.getCoverImageUrl());
            ps.setString(5, book.getCategory());
            return ps.executeUpdate() > 0;
        }
    }

    private Book mapResultSetToBook(ResultSet rs) throws SQLException {
        Book book = new Book();
        book.setBookId(rs.getInt("book_id"));
        book.setTitle(rs.getString("title"));
        book.setDescription(rs.getString("description"));
        book.setCoverImageUrl(rs.getString("cover_image_url"));
        book.setCategory(rs.getString("category"));
        // Assuming your Book model has an authorName field for the UI
        book.setAuthorName(rs.getString("author_name")); 
        return book;
    }

	@Override
	public List<Book> searchBooks(String query, String category) throws SQLException {
		List<Book> books=new ArrayList<>();
		StringBuilder stmt=new StringBuilder("SELECT b.*,a.name as author_name FROM books b "+"JOIN authors a ON b.author_id =a.author_id WHERE 1=1");
	
		
		if(query!=null && !query.isEmpty()) {
			stmt.append("AND(b.title LIKE ? OR a.name LIKE ?)");
		}
		if(category!=null && !category.isEmpty()) {
			stmt.append("AND b.category =?");
		}
		
		try(PreparedStatement ps=con.prepareStatement(stmt.toString())){
			if(query!=null && !query.isEmpty()) {
				String searchPattern = "%" + query +"%";
				ps.setString(1,searchPattern);
				ps.setString(2, searchPattern);
			}
			if(category!=null &&!category.isEmpty()) {
				ps.setString(3, category);			
			}
			
			try(ResultSet rs=ps.executeQuery()){
				while(rs.next()) {
					books.add(mapResultSetToBook(rs));
				}
			}
		}
		return books;
	}
}