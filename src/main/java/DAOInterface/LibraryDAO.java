package DAOInterface;

import java.sql.SQLException;
import java.util.List;
import models.UserLibrary;

public interface LibraryDAO {
	List<UserLibrary> getUserLibrary(long userId) throws SQLException;
	// Changed position to double and chapterId to 'order' for clarity
	void updateProgress(long userId, long bookId, int order, double position) throws SQLException;
	void addToLibrary(long userId, long bookId) throws SQLException;
}