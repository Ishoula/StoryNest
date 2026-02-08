package DAOInterface;

import java.sql.SQLException;
import java.util.List;

import models.UserLibrary;

public interface LibraryDAO {
	
	List<UserLibrary> getUserLibrary(long userId) throws SQLException;
	void updateProgress(long userId, long bookId, int chapterId, int position) throws SQLException;
	void addToLibrary(long userId, long bookId) throws SQLException;

}
