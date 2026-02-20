package DAOImplementation;

import java.sql.*;
import java.util.*;

import DAOInterface.LibraryDAO;
import models.UserLibrary;

public class LibraryDAOImpl implements LibraryDAO {

	
	private final Connection con;
	public LibraryDAOImpl(Connection con) {
		this.con=con;
	}
	@Override
	public List<UserLibrary> getUserLibrary(long userId) throws SQLException {
		
		List<UserLibrary> progressList=new ArrayList<>();
		String stmt="SELECT p.*, b.title, b.cover_image_url "+" FROM user_library p "+" JOIN books b ON p.book_id=b.book_id "+" WHERE p.user_id=? "+"ORDER BY p.last_read_at DESC";
		try(PreparedStatement ps=con.prepareStatement(stmt)){
			ps.setLong(1, userId);
			
			try(ResultSet rs=ps.executeQuery()){
				while(rs.next()) {
					UserLibrary ul=new UserLibrary();
					ul.setBookId(rs.getLong("book_id"));
					ul.setCurrentChapterId(rs.getInt("current_chapter_id"));
					ul.setScrollPosition(rs.getDouble("scroll_position"));
					ul.setBookCover(rs.getString("cover_image_url"));
					ul.setBookTitle(rs.getString("title"));
					ul.setUserId(rs.getLong("user_id"));
					progressList.add(ul);
					}
			}
		}
		return progressList;
	}

	@Override
	public void updateProgress(long userId, long bookId, int chapterId, int position) throws SQLException {
		
		String stmt="INSERT INTO user_library (user_id, book_id, current_chapter_id, scroll_position,last_read_at) "+ 
		        "VALUES (?,?,?,?,CURRENT_TIMESTAMP) "+
				"ON CONFLICT (user_id, book_id) DO UPDATE SET "+
		        "last_chapter_id = EXCLUDED.current_chapter_id, "+
				"scroll_position = EXCLUDED.scroll_position, "+
		        "last_read_at = CURRENT_TIMESTAMP";
		
		try(PreparedStatement ps=con.prepareStatement(stmt)){
			ps.setLong(1,userId);
			ps.setLong(2, bookId);
			ps.setInt(3, chapterId);
			ps.setInt(4, position);
			ps.executeUpdate();
		}
	
		
	}

	@Override
	public void addToLibrary(long userId, long bookId) throws SQLException {
		
		String stmt = "INSERT INTO user_library (user_id, book_id, current_chapter_id, scroll_position) " +
                "VALUES (?, ?, (SELECT chapter_id FROM chapters WHERE book_id = ? ORDER BY chapter_sequence ASC LIMIT 1), 0) " +
                "ON CONFLICT DO NOTHING";
		
		try(PreparedStatement ps=con.prepareStatement(stmt)){
			ps.setLong(1,userId);
			ps.setLong(2, bookId);
			ps.setLong(3, bookId);
			
			ps.executeUpdate();
		}
	}

}
