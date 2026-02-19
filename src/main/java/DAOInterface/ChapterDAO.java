package DAOInterface;

import java.sql.SQLException;
import java.util.List;

import models.Chapter;

public interface ChapterDAO {

	List<Chapter> getChaptersByBookId(int bookId) throws SQLException;

}
